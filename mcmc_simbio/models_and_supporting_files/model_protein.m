function [varargout] = model_protein(mi,tv, varargin)
% model_protein Constitutive gene expression model using a single 
% enzymatic step. 
%
% ~~~ MODEL ~~~
% D + pol <-> D__pol  (k_f (fixed!), k_r (Proxy for K_d) ) 
% D__pol -> D + pol + protien (kc) 
% 
% ~~~ INPUTS ~~~
%
% mi: An mcmc_info struct. 
%
% tv: A time vector
% 
% Optional name-value pair input arguments: 
%    'paramInfo': A param_info struct that is used to set parameter values in the model object. 
%         This struct has fields: 
%        'paramNames':         A string corresponding to the parameter name, or 
%                                  a 1 by 2 cell array of strings of forward and backward 
%                                  reaction rate parameters for reversible reactions. 
%        'paramVals':          A numerical value of the parameter, or a 1 by 2 vector 
%                                  for reversible reactions. 
%        'reactionString':     This is either the reaction string or the  
%                                  string 'global'. If the paramNames is a 1 x 2 cell array
%                                  and the paramVals is a 
%                                  then the reaction is reversible, and if the paramNames is
%                                  a string, then it is a irreversible reaction. When this 
%                                  argument is 'global', we always have a string and a scalar 
%                                  for paramNames and paramVals respectively. 
%        'reactionString':     this is either the reaction string or the  
%                                  string 'global'. 
%        'paramRanges':        Non-negative orthant values for the parameter upper and 
%                                  lower bounds. For each parameter this is either a 
%                                  2 by 1 vector (for irreversible reactions) or a 2 by 2
%                              matrix, where the first and second rows are the upper 
%                                  and lower bounds respectively, and the first and second 
%                                  columns are the bounds for the forward and reverse rate
%                                  parameters respectively. If nothing is specified, then 
%                                  the bounds for a parameter with value VAL is [VAL/10; VAL*10]
%        'paramNotes'          Human readable notes. 
%                  
% 
% ~~~ OUTPUTS ~~~
%
% m: a Simbiology Model Object
%
% emo: An exported Simbiology Model Object. 
%
% mi: An updated mcmc_info struct. The following fields are added to the mcmc_info struct 
%   names_ord: An ordered list of species and parameters to be estimated.  
%   emo: Exported model Object. 

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


% Specify the names of the parameters and species that are to be estimated. 
estNames = {'kr'
    'kc'
    'pol'};

% specify the parmaeter ranges. 
paramranges = log([0.5 500
    0.5 500
    1 100]);
% geometric mean: [.005; 0.05; 4; 10]'
dosedNames = {'D'}; 

dosedVals = [1 2 5]; 

measuredSpecies = {'protein'}; 

stdev = 0.5; 

tightening = 1; % i have no idea what a good value is
nW = 400; % actual: 200 - 600 ish
stepsize = 1.2; % actual: 2 to 4 ish
niter = 40; % actual: 2 - 20 ish,
npoints = 8e4; % actual: 1e5 ish
thinning = 10; % actual: 10 to 40 ish

mi = struct(...
    'names_unord', {estNames}, ...
    'paramranges', {paramranges},...
    'dosednames', {dosedNames},...
    'dosedvals', {dosedVals},...
    'measuredspecies', {measuredSpecies}, ...
    'stdev', {stdev}, ...
    'tightening', {tightening}, ...
    'nW', {nW}, ...
    'stepsize', {stepsize}, ...
    'niter', {niter}, ...
    'npoints', {npoints}, ...
    'thinning', {thinning}, ...
    'parallel', true);

%% set input defaults
p = inputParser ;
addParameter(p, 'mcmcinfo', mi);
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

mobj.species
%% Run the model

cs = getconfigset(mobj, 'active');
set(cs, 'StopTime', p.simtime);
        
sd = sbiosimulate(mobj);
sbioplot(sd);


%% DONT TOUCH THIS SECTION
%% export and accelerate simbiology model object
% using estimated species and dosing species names

% select the parameters and species objects using the name array
ep = sbioselect(mobj, 'Type', 'parameter', 'Name', ...
    mi.names_unord);% est parameters

es = sbioselect(mobj, 'Type', 'species', 'Name', ...
    mi.names_unord);% est species

aps = [ep; es]; % active parameters and species

% reorder the parameter and species so they are in the same order as that
% in the model. 
eno = cell(length(aps), 1);% est names ordered

for i = 1:length(aps)
    eno{i} = aps(i).Name;
end

% 
ds = sbioselect(mobj, 'Type', 'species', 'Name', mi.dosednames);

emo = export(mobj, [ep; es; ds]); % exported model object, dosed species names. 
SI = emo.SimulationOptions;
SI.StopTime = p.simtime;
accelerate(emo);

mi.names_ord = eno;
mi.emo = emo; % !TODO: remove ?

% process variable outputs
nout = nargout;
outstuff = {mobj, emo, mi};
varargout(1:nout) = outstuff(1:nout); % REMOVE: i think this should work. 

end

