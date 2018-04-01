function mobj = model_protein5_5
% enzymatic mrna and protein production and first order mrna degradation
% 
% ~~~ MODEL ~~~
% D + pol <-> D__pol  (k_fd, k_rd) 
% D__pol -> D + pol + mrna (kcm) 
% 
% mrna + ribo <-> mrna__ribo (k_fm, k_rm)
% mrna__ribo <-> mrna + ribo + protein (kcp)
% 
% protein -> null (del_p)
% 
% mrna -> null (kcx)
% 
% Copyright (c) 2018, Vipul Singhal, Caltech
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
%
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.

%% setup model
mobj = sbiomodel('expression');
%% setup model reactions
rxn = addreaction(mobj,'D + pol <-> D_pol');
Kobj = addkineticlaw(rxn,'MassAction');
Kobj.ParameterVariableNames = {'kfd','krd'};
addparameter(mobj, 'kfd', 4)
addparameter(mobj, 'krd', 20)

rxn = addreaction(mobj,'D_pol -> D + pol + mrna');
Kobj = addkineticlaw(rxn,'MassAction');
Kobj.ParameterVariableNames = {'kcm'};
addparameter(mobj, 'kcm', 0.1)

rxn = addreaction(mobj,'mrna + ribo <-> mrna__ribo');
Kobj = addkineticlaw(rxn,'MassAction');
Kobj.ParameterVariableNames = {'kfm','krm'};
addparameter(mobj, 'kfm', 4)
addparameter(mobj, 'krm', 20)

rxn = addreaction(mobj,'mrna__ribo -> mrna + ribo + protein');
Kobj = addkineticlaw(rxn,'MassAction');
Kobj.ParameterVariableNames = {'kcp'};
addparameter(mobj, 'kcp', 0.1)

rxn = addreaction(mobj,'mrna -> null');
Kobj = addkineticlaw(rxn,'MassAction');
Kobj.ParameterVariableNames = {'kcx'};
addparameter(mobj, 'kcx', 0.1)

rxn = addreaction(mobj,'protein -> null');
Kobj = addkineticlaw(rxn,'MassAction');
Kobj.ParameterVariableNames = {'del_p'};
addparameter(mobj, 'del_p', 1)

% setup model species initial concentrations. 
% setup model species initial concentrations. 
specie = sbioselect(mobj, 'name', 'D');
specie.InitialAmount = 1;

specie = sbioselect(mobj, 'name', 'pol');
specie.InitialAmount = 100;

specie = sbioselect(mobj, 'name', 'D_pol');
specie.InitialAmount = 0;

specie = sbioselect(mobj, 'name', 'mrna');
specie.InitialAmount = 0;

specie = sbioselect(mobj, 'name', 'ribo');
specie.InitialAmount = 100;

specie = sbioselect(mobj, 'name', 'mrna__ribo');
specie.InitialAmount = 0;

specie = sbioselect(mobj, 'name', 'protein');
specie.InitialAmount = 0;

%% Run the model

cs = getconfigset(mobj, 'active');
set(cs, 'StopTime', p.simtime);
        
sd = sbiosimulate(mobj);

end

