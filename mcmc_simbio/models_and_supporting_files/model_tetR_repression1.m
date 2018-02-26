function mobj = model_tetR_repression1
% repression with enzymatic one step protein production
% 
% ~~~ MODEL ~~~
% D_T + P <-> D_T:P -> D_T + P + T
% D_G + P <-> D_G:P -> D_G + P + G
% 2 T <-> T2
% D_G + T2 <-> D_G:T2
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

% D_T + P <-> D_T:P -> D_T + P + T
% D_G + P <-> D_G:P -> D_G + P + G
% 2 T <-> T2
% D_G + T2 <-> D_G:T2
% 

%% setup model
mobj = sbiomodel('expression');
%% setup model reactions

rxn = addreaction(mobj,'dT + pol <-> dT_pol');
Kobj = addkineticlaw(rxn,'MassAction');
Kobj.ParameterVariableNames = {'kfd','krd'};
addparameter(mobj, 'kfdT', 4)
addparameter(mobj, 'krdT', 20)

rxn = addreaction(mobj,'dT_pol -> dT + pol + pT');
Kobj = addkineticlaw(rxn,'MassAction');
Kobj.ParameterVariableNames = {'kcpT'};
addparameter(mobj, 'kcpT', 0.1)

rxn = addreaction(mobj,'dG + pol <-> dG_pol');
Kobj = addkineticlaw(rxn,'MassAction');
Kobj.ParameterVariableNames = {'kfd','krd'};
addparameter(mobj, 'kfdG', 4)
addparameter(mobj, 'krdG', 20)

rxn = addreaction(mobj,'dG_pol -> dG + pol + pG');
Kobj = addkineticlaw(rxn,'MassAction');
Kobj.ParameterVariableNames = {'kcpG'};
addparameter(mobj, 'kcpG', 0.1)

rxn = addreaction(mobj,'2 pT <-> pT2');
Kobj = addkineticlaw(rxn,'MassAction');
Kobj.ParameterVariableNames = {'kfdim','krdim'};
addparameter(mobj, 'kfdim', 4)
addparameter(mobj, 'krdim', 20)

rxn = addreaction(mobj,'dG + pT2 <-> dG_pT2');
Kobj = addkineticlaw(rxn,'MassAction');
Kobj.ParameterVariableNames = {'kfseq','krseq'};
addparameter(mobj, 'kfseq', 4)
addparameter(mobj, 'krseq', 20)

% setup model species initial concentrations. 
% setup model species initial concentrations. 
specie = sbioselect(mobj, 'name', 'dT');
specie.InitialAmount = 1;

specie = sbioselect(mobj, 'name', 'dG');
specie.InitialAmount = 1;

specie = sbioselect(mobj, 'name', 'pT');
specie.InitialAmount = 0;

specie = sbioselect(mobj, 'name', 'pG');
specie.InitialAmount = 0;

specie = sbioselect(mobj, 'name', 'pol');
specie.InitialAmount = 100;

specie = sbioselect(mobj, 'name', 'dT_pol');
specie.InitialAmount = 0;

specie = sbioselect(mobj, 'name', 'dG_pol');
specie.InitialAmount = 0;

specie = sbioselect(mobj, 'name', 'pT2');
specie.InitialAmount = 0;

specie = sbioselect(mobj, 'name', 'dG_pT2');
specie.InitialAmount = 0;

%% Run the model

cs = getconfigset(mobj, 'active');
set(cs, 'StopTime', p.simtime);
        
sd = sbiosimulate(mobj);

end

