% txtl_extract.m - function to create a tube of TX-TL extract
%! TODO: add documentation

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

function tube = txtl_extract(name)
tube = txtl_newtube(name);

% Extract is 1/3 of the 10ul reaction volume
stockMulti = 10/(10/3); 

%% building configuration object for the current experiment

TXTLconfig = txtl_reaction_config(name);
tube.UserData.ReactionConfig = TXTLconfig;


%% setting up species and concentrations in the extract 

% Add in ribosomes, RNAP, sigma70 and sigma 28
addspecies(tube, 'RNAP', stockMulti*100);	% 100 nM based on VN's paper
sigma70 = addspecies(tube, 'protein sigma70', stockMulti*35); % 35 nM based on VN's paper
sigma28 = addspecies(tube, 'protein sigma28', stockMulti*20); % <20 nM based on VN's paper
addspecies(tube, 'Ribo', stockMulti*1000);	% 2300 nM based on VN's paper

% Add RNAP+Sigma70 <-> RNAP70 reaction
% Set up the reaction
 txtl_addreaction(tube,['RNAP + ' sigma70.Name ' <-> RNAP70'],...
     'MassAction',{'TXTL_RNAP_S70_F',tube.UserData.ReactionConfig.RNAP_S70_F;
                   'TXTL_RNAP_S70_R',tube.UserData.ReactionConfig.RNAP_S70_R});
% Add RNAP+Sigma28 <-> RNAP28 reacation
txtl_addreaction(tube,['RNAP + [' sigma28.Name '] <-> RNAP28'],...
         'MassAction',{'Sigma28_RNAP_F',10;...
                       'Sigma28_RNAP_R',0.1});
               
               

% Add in exonuclease + protection reactions (if [protein gamS] > 0)
addspecies(tube, 'RecBCD', stockMulti*0.3);	% % 0.3 from Clare Chen (Jongmin will provide ref)

txtl_addreaction(tube,'RecBCD + [protein gamS] -> RecBCD:gamS',...
     'MassAction',{'GamS_RecBCD_f',tube.UserData.ReactionConfig.GamS_RecBCD_F});

% Add in RNA degradation
addspecies(tube, 'RNase', stockMulti*1);	% 1 nM


% Automatically use MATLAB mode in Emacs (keep at end of file)
% Local variables:
% mode: matlab
% End:
