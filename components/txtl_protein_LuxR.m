% txtl_protein_LuxR.m - protein information for LuxR
% VS Nov 2013
%
% This file contains a description of the protein produced by tetR.
% Calling the function txtl_protein_AraC() will set up the reactions for
% sequestration by the inducer aTc.

% Written by Vipul Singhal nov 2013
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

function varargout = txtl_protein_LuxR(mode, tube, protein, varargin)
% in 'setup Species' mode, it returns an array of gene lengths, having
% added defaults in places where the lengths are missing. 

% importing the corresponding parameters
paramObj = txtl_component_config('LuxR'); 


%%%%%%%%%%%%%%%%%%% DRIVER MODE: Setup Species %%%%%%%%%%%%%%%%%%%%%%%%%%%%
if strcmp(mode.add_dna_driver, 'Setup Species')

    geneData = varargin{1};
    defaultBasePairs = {'LuxR','lva','terminator';
        paramObj.Gene_Length,paramObj.LVA_tag_Length,paramObj.Terminator_Length};
    geneData = txtl_setup_default_basepair_length(tube,geneData,...
        defaultBasePairs);
    
    varargout{1} = geneData;
    
    coreSpecies = {'AHL', 'AHL:protein LuxR'}; 
    txtl_addspecies(tube, coreSpecies, cell(1,size(coreSpecies,2)), 'Internal');
 
   
%%%%%%%%%%%%%%%%%%% DRIVER MODE: Setup Reactions %%%%%%%%%%%%%%%%%%%%%%%%%%    
elseif strcmp(mode.add_dna_driver, 'Setup Reactions')
  
        txtl_addreaction(tube, ...
         '[protein LuxR] + AHL <-> [AHL:protein LuxR]',...
         'MassAction',{'TXTL_INDUCER_LuxR_AHL_F',paramObj.Protein_Inducer_Forward;...
                       'TXTL_INDUCER_LuxR_AHL_R',paramObj.Protein_Inducer_Reverse});
    % degrade the aTc inducer
     txtl_addreaction(tube,'AHL -> null',...
      'MassAction',{'TXTL_INDUCER_DEGRADATION_AHL',0.000267});%paramObj.Inducer_Degradation

    
%%%%%%%%%%%%%%%%%%% DRIVER MODE: error handling %%%%%%%%%%%%%%%%%%%%%%%%%%%
else
    error('txtltoolbox:txtl_protein_LuxR:undefinedmode', ...
      'The possible modes are ''Setup Species'' and ''Setup Reactions''.');
end



% Automatically use MATLAB mode in Emacs (keep at end of file)
% Local variables:
% mode: matlab
% End: