% Copyright (c) 2012 by California Institute of Technology
% All rights reserved.
%
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are
% met:
% 
%   1. Redistributions of source code must retain the above copyright
%      notice, this list of conditions and the following disclaimer.
%
%   2. Redistributions in binary form must reproduce the above copyright 
%      notice, this list of conditions and the following disclaimer in the 
%      documentation and/or other materials provided with the distribution.
%
%   3. The name of the author may not be used to endorse or promote products 
%      derived from this software without specific prior written permission.
% 
% THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
% IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
% WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
% DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT,
% INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
% (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
% SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
% HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
% STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
% IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
% POSSIBILITY OF SUCH DAMAGE.


function txtl_translation(mode, tube, dna, rna, protein, Ribobound)
% basically, this function does nothing if the RNA does not have a ribosome
% binding site. so for instance if the RNA is: [RNA att] or [RNA anti].


%%%%%%%%%%%%%%%%%%% DRIVER MODE: Setup Species %%%%%%%%%%%%%%%%%%%%%%%%%%%%
if strcmp(mode.add_dna_driver, 'Setup Species')
     % Set up the species for translation 
     Ribobound_term = ['term_' Ribobound.Name ];
    coreSpecies = {'AA',['AA:2AGTP:' Ribobound.Name],Ribobound_term, 'Ribo'};
    % empty cellarray for amount => zero amount
    txtl_addspecies(tube, coreSpecies, cell(1,size(coreSpecies,2)), 'Internal');
    
    
%%%%%%%%%%%%%%%%%%% DRIVER MODE: Setup Reactions %%%%%%%%%%%%%%%%%%%%%%%%%%
elseif strcmp(mode.add_dna_driver, 'Setup Reactions')
    
    AAparameters = {'TL_AA_F',tube.UserData.ReactionConfig.TL_AA_Forward;
                  'TL_AA_R',tube.UserData.ReactionConfig.TL_AA_Reverse};
    AGTPparameters = {'TL_AGTP_F',tube.UserData.ReactionConfig.TL_AGTP_Forward;
                  'TL_AGTP_R',tube.UserData.ReactionConfig.TL_AGTP_Reverse};
              
    % translation rate             
    ktlExpression =  strrep(tube.UserData.ReactionConfig.Translation_Rate,...
            'Protein_Length','protein.UserData');             
    ktl_rbs = eval(ktlExpression);              
              
    % define termination complex. 
    Ribobound_term = ['term_' Ribobound.Name ];
    
    % AA consumption models              
    if tube.UserData.ReactionConfig.AAmodel == 1
    % multimolecular binding, bad idea
        aacnt = floor(protein.UserData/100);  % get number of K amino acids
        if (aacnt == 0) 
          aastr = '';
        else
          aastr = int2str(aacnt);
        end
        
        txtl_addreaction(tube,...
            ['[' Ribobound.Name '] + ' aastr ' AA <-> [AA:' Ribobound.Name ']'],...
            'MassAction',AAparameters);
    else
        % consumption reaction usage, a much better method. 
        % resource binding
        txtl_addreaction(tube, ...
            ['[' Ribobound.Name '] + AA <-> [AA:' Ribobound.Name ']'],...
            'MassAction',AAparameters);
        txtl_addreaction(tube, ...
            ['[AA:' Ribobound.Name ']  + 2 AGTP <-> [AA:2AGTP:' Ribobound.Name ']'],...
            'MassAction',AGTPparameters);
        
        % consumption reaction
        aacnt = floor(protein.UserData/100);
        aa_consump_rate = (aacnt-1)*ktl_rbs;
        txtl_addreaction(tube, ...
            ['[AA:2AGTP:' Ribobound.Name '] -> ' Ribobound_term],...
            'MassAction',{'TXTL_TL_AA_consumption',aa_consump_rate});
    end
    
    % Translation (creation of protein and termination complex)
    txtl_addreaction(tube, ...
     ['[AA:2AGTP:' Ribobound.Name '] -> ' Ribobound_term ' + ' protein.Name ],...
     'MassAction',{'TXTL_TL_rate',ktl_rbs});
    
        % translation termination reaction
    txtl_addreaction(tube,['[' Ribobound_term '] -> ' rna.Name ' +  Ribo'],...
            'MassAction',{'TXTL_RIBOBOUND_TERMINATION_RATE', tube.UserData.ReactionConfig.Ribobound_termination_rate});
    % !TODO add these parameters to the config files and the parameter class
    
    % old translation
%     txtl_addreaction(tube, ...
%      ['[AA:AGTP:' Ribobound.Name '] -> ' rna.Name ' + ' protein.Name ' +  Ribo'],...
%      'MassAction',{'TXTL_TL_rate',ktl_rbs});
    
%%%%%%%%%%%%%%%%%%% DRIVER MODE: error handling %%%%%%%%%%%%%%%%%%%%%%%%%%%    
else
    error('txtltoolbox:txtl_translation:undefinedmode', ...
      'The possible modes are ''Setup Species'' and ''Setup Reactions''.');
end    
    

end