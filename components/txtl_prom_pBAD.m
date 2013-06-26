% txtl_prom_pBAD_ptet.m - promoter information for pBAD and ptet combinatorial promoter
% Zoltan Tuza, Oct 2012
%
% This file contains a description of the p28 and ptet combinatorial promoter.
% Calling the function txtl_prom_pBAD_ptet() will set up the reactions for
% transcription with the measured binding rates and transription rates.
% 
% 

% Written by Zoltan Tuza, Oct 2012
%
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

function varargout= txtl_prom_pBAD(mode, tube, dna, rna, varargin)


    % Create strings for reactants and products
    DNA = ['[' dna.Name ']'];		% DNA species name for reactions
    RNA = ['[' rna.Name ']'];		% RNA species name for reactions
    RNAP = 'RNAP70';			% RNA polymerase name for reactions
    RNAPbound = ['RNAP70:' dna.Name];
    P1 = 'protein sigma70';
    
    P3 = 'protein AraC';
    AraCbound = ['arabinose:' P3 ];
    
    % importing the corresponding parameters
    paramObj = txtl_component_config('pBAD');
    
%%%%%%%%%%%%%%%%%%% DRIVER MODE: Setup Species %%%%%%%%%%%%%%%%%%%%%%%%%%%%
if strcmp(mode.add_dna_driver, 'Setup Species')

    promoterData = varargin{1};
    defaultBasePairs = {'pBAD','junk','thio';150,500,0};
    promoterData = txtl_setup_default_basepair_length(tube,promoterData,...
        defaultBasePairs);
    
    varargout{1} = promoterData;
    
    coreSpecies = {RNAP,RNAPbound,P1, P3, AraCbound};
    % empty cellarray for amount => zero amount
    txtl_addspecies(tube, coreSpecies, cell(1,size(coreSpecies,2)), 'Internal');
    
    txtl_transcription(mode, tube, dna, rna, RNAP,RNAPbound);
 
    txtl_transcription(mode, tube, dna, rna, RNAP,[RNAPbound ':' AraCbound ],{AraCbound}); 
     
    %(check agains shaobin results. the parameters here should be tuned to
    %get the shaobin curves. translation/degradation etc should be standard. also, the params modifies are the 
    %RNAP binding affinities, given below. so, nothing in tx: if RNAP is bound, tx proceeds as normal 
    %(what effects will this have for future work?))

%%%%%%%%%%%%%%%%%%% DRIVER MODE: Setup Reactions %%%%%%%%%%%%%%%%%%%%%%%%%%    
elseif strcmp(mode.add_dna_driver,'Setup Reactions')
    
    % Parameters that describe this promoter (this is where the variation
    % in the promoter strength comes in. 
    parameters = {'TXTL_PBAD_RNAPbound_F',paramObj.RNAPbound_Forward;...
                  'TXTL_PBAD_RNAPbound_R',paramObj.RNAPbound_Reverse};
    % Set up binding reaction
    txtl_addreaction(tube,[DNA ' + ' RNAP ' <-> [' RNAPbound ']'],...
        'MassAction',parameters);
    %
    % nominal transcription
    txtl_transcription(mode, tube, dna, rna, RNAP, RNAPbound);


    %% AraC
    %
    % set up binding reactions for AraC:arabinose. 
    Robj4 = addreaction(tube, [dna.Name ' + ' AraCbound ' <-> ' dna.Name ':' AraCbound ]);
    Kobj4 = addkineticlaw(Robj4, 'MassAction');
    Pobj4f = addparameter(Kobj4, 'kf', 2.86e-3);
    Pobj4r = addparameter(Kobj4, 'kr', 0.11e-4);
    set(Kobj4, 'ParameterVariableNames', {'kf', 'kr'});
    
    % the binding of P2 to the DNA-RNAP complex. note that due to the reaction
    % below, this binding means that RNAP will soon leave the DNA.  Hence,
    % P2 binding to RNAPbound expels the PNAP, redusing transcription.
    Robj5 = addreaction(tube, [RNAPbound  ' + ' AraCbound ' <-> [' RNAPbound ':' AraCbound ']']);
    Kobj5 = addkineticlaw(Robj5, 'MassAction');
    Pobj5f = addparameter(Kobj5, 'kf', 2.86e-3);
    Pobj5r = addparameter(Kobj5, 'kr', 0.11e-4);
    set(Kobj5, 'ParameterVariableNames', {'kf', 'kr'});
    % 
    % Set up binding reaction for tetR. notice that the DNA-RNAP-P2 complex
    % is v unstable, and expels the RNAP readily. 
    Robj6 = addreaction(tube, [dna.Name ':' AraCbound ' + ' RNAP ' <-> [' RNAPbound ':' AraCbound ']' ]);
    Kobj6 = addkineticlaw(Robj6, 'MassAction');
    Pobj6f = addparameter(Kobj6, 'kf', paramObj.RNAPbound_Forward*50);
    Pobj6r = addparameter(Kobj6, 'kr', paramObj.RNAPbound_Reverse);
    set(Kobj6, 'ParameterVariableNames', {'kf', 'kr'});
    
        
    
    %%
   
    txtl_transcription(mode, tube, dna, rna, RNAP,RNAPbound); %leaky slow rate
    
    txtl_transcription(mode, tube, dna, rna, RNAP,[RNAPbound ':' AraCbound ],{AraCbound}); %highest rate
   

    
%%%%%%%%%%%%%%%%%%% DRIVER MODE: error handling %%%%%%%%%%%%%%%%%%%%%%%%%%%   
else
    error('txtltoolbox:txtl_prom_pBAD:undefinedmode', ...
      'The possible modes are ''Setup Species'' and ''Setup Reactions''.');
end 



% Automatically use MATLAB mode in Emacs (keep at end of file)
% Local variables:
% mode: matlab
% End: