function mobj = model_protein3(varargin)
% model_protein Constitutive gene expression model using a single 
% enzymatic step. 
%
% ~~~ MODEL ~~~
% D + pol <-> D__pol  (k_f, k_r  ) 
% D__pol -> D + pol + protien (kc) 
% 


%% set input defaults
p = inputParser ;
addParameter(p, 'simtime', 3600);
parse(p);
p = p.Results;

%% setup model
mobj = sbiomodel('expression');

%% setup model reactions
r1 = addreaction(mobj,'D + pol <-> D_pol');
Kobj = addkineticlaw(r1,'MassAction');
Kobj.ParameterVariableNames = {'kf','kr'};
addparameter(mobj, 'kf', 0.5)
addparameter(mobj, 'kr', 100)

r2 = addreaction(mobj,'D_pol -> D + pol + protein');
Kobj = addkineticlaw(r2,'MassAction');
Kobj.ParameterVariableNames = {'kc'};
addparameter(mobj, 'kc', 20)

% setup model species initial concentrations. 
P = sbioselect(mobj, 'name', 'D');
P.InitialAmount = 1;

C = sbioselect(mobj, 'name', 'pol');
C.InitialAmount = 10;

E = sbioselect(mobj, 'name', 'D_pol');
E.InitialAmount = 0;

S = sbioselect(mobj, 'name', 'protein');
S.InitialAmount = 0;

%% Run the model

cs = getconfigset(mobj, 'active');
set(cs, 'StopTime', p.simtime);
        
sd = sbiosimulate(mobj);

end

