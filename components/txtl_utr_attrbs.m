% txtl_utr_rbs.m - promoter information for standard RBS
% RMM, 8 Sep 2012
%
% This file contains a description of a standard ribosome binding site.
% Calling the function txtl_utr_rbs() will set up the reactions for
% translation with the measured binding rates and translation rates.

% Written by Richard Murray, Sep 2012
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

function varargout = txtl_utr_attrbs(mode, tube, rna, protein, varargin)

%%%%%%%%%%%%%%%%%%% DRIVER MODE: Setup Species %%%%%%%%%%%%%%%%%%%%%%%%%%%%
if strcmp(mode, 'Setup Species')

    utrRbsData = varargin{1};
    defaultBasePairs = {'att', 'rbs','spacer';10, 20,200};
    utrRbsData = txtl_setup_default_basepair_length(tube,utrRbsData,defaultBasePairs);
    

    RiboBound = ['Ribo:' rna.Name];
    coreSpecies = {'Ribo',RiboBound};
    % empty cellarray for amount => zero amount
    txtl_addspecies(tube, coreSpecies, cell(1,size(coreSpecies,2)), 'Internal');
    
   
    %TODO! 12/8/12 zoltuz - find out why we need the RiboBound here!
    varargout{1} = sbioselect(tube, 'Name', RiboBound);
    varargout{2} = utrRbsData;

%%%%%%%%%%%%%%%%%%% DRIVER MODE: Setup Reactions %%%%%%%%%%%%%%%%%%%%%%%%%%    
elseif strcmp(mode,'Setup Reactions')

    %check if antisense RNA is present
    asRNAindex = [];
    [~,listOfSpecies] = getstoichmatrix(tube);
    for i = 1:length(listOfSpecies)
        if strcmp(listOfSpecies{i}, 'asRNA')
            asRNAindex = i;
        end
    end
               
    % Set up the binding reaction
    if ~isempty(asRNAindex)
        txtl_addreaction(tube,['[' rna.Name '] + asRNA <-> [asRNA:' rna.Name ']'],...
            'MassAction',{'TXTL_UTR_ATTRBS_ASRNA_F',tube.UserData{1}.asRNA_Binding_F;
            'TXTL_UTR_ATTRBS_ASRNA_R',tube.UserData{1}.asRNA_Binding_R});
        
        % this still needs to happen because what it asRNA concentration
        % is low. (or 0). then asRNA is not empty, but the asRNA mediated
        % repression is very insignificant. 
        txtl_addreaction(tube,['[' rna.Name '] + Ribo <-> [Ribo:' rna.Name ']'],...
            'MassAction',{'TXTL_UTR_RBS_F',tube.UserData{1}.Ribosome_Binding_F;
            'TXTL_UTR_RBS_R',tube.UserData{1}.Ribosome_Binding_R});
        
    else
        txtl_addreaction(tube,['[' rna.Name '] + Ribo <-> [Ribo:' rna.Name ']'],...
            'MassAction',{'TXTL_UTR_RBS_F',tube.UserData{1}.Ribosome_Binding_F;
            'TXTL_UTR_RBS_R',tube.UserData{1}.Ribosome_Binding_R});
    end
    

%%%%%%%%%%%%%%%%%%% DRIVER MODE: error handling %%%%%%%%%%%%%%%%%%%%%%%%%%%
else
    error('txtltoolbox:txtl_utr_rbs:undefinedmode', ...
      'The possible modes are ''Setup Species'' and ''Setup Reactions''.');
end    


% Automatically use MATLAB mode in Emacs (keep at end of file)
% Local variables:
% mode: matlab
% End: