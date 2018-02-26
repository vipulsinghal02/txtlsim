function mobj = model_protein3_5
% model_protein Constitutive gene expression model using a single 
% enzymatic step, and first order protein degradation. 
%
% ~~~ MODEL ~~~
% D + pol <-> D__pol  (k_f, k_r ) 
% D__pol -> D + pol + protien (kc) 
% protein -> null (del_p)
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
r1 = addreaction(mobj,'D + pol <-> D_pol');
Kobj = addkineticlaw(r1,'MassAction');
Kobj.ParameterVariableNames = {'kf','kr'};
addparameter(mobj, 'kf', 4)
addparameter(mobj, 'kr', 20)

r2 = addreaction(mobj,'D_pol -> D + pol + protein');
Kobj = addkineticlaw(r2,'MassAction');
Kobj.ParameterVariableNames = {'kc'};
addparameter(mobj, 'kc', 0.1)

r2 = addreaction(mobj,'protein -> null');
Kobj = addkineticlaw(r2,'MassAction');
Kobj.ParameterVariableNames = {'del_p'};
addparameter(mobj, 'del_p', 1)

% setup model species initial concentrations. 
specie = sbioselect(mobj, 'name', 'D');
specie.InitialAmount = 1;

specie = sbioselect(mobj, 'name', 'pol');
specie.InitialAmount = 10;

specie = sbioselect(mobj, 'name', 'D_pol');
specie.InitialAmount = 0;

specie = sbioselect(mobj, 'name', 'protein');
specie.InitialAmount = 0;

%% Run the model

cs = getconfigset(mobj, 'active');
set(cs, 'StopTime', p.simtime);
        
sd = sbiosimulate(mobj);

end

