function [varargout] = model_enzymatic(varargin)
% model_enzymatic: enzymatic reaction
% 
% INPUTS - Name value pairs, all optional. (defaults kick in if these are
% not specified)
% 1) 'mcmc_info', VALUE, where VALUE is a valid mcmc_info struct. See documentation
% in the file !TODO <write this documentation> for how to specify this. You
% can also see how it was specified within this fucntion (as a default). 
% 2) 'simtime', VALUE, where t_end is a numeric (double) specifying the time
% to the end of the simulation. 
% 
% OUTPUTS - generates a simbiology plot, and returns the following optional
% arguments in order:
% m: a model object, 
% em: an exported model object, 
% mi: an mcmc info struct. 
% 

%
% THIS MODEL:
% E + S <-> C -> E + P
% kf, kr, kc, Einit, Sinit
% 

% setup some defaults (defining the experiment structure suing the
% mcmc_info structure)
% setup the default mcmc_info object

estNames = {'kf'
    'kr'
    'kc'
    'E'};
paramranges = log([0.00005 .5
    0.0005 5
    .04 400
    .1 1000]);
% geometric mean: [.005; 0.05; 4; 10]'
dosedNames = {'S'}; 

dosedVals = [5000 10000 20000]; 

measuredSpecies = {'P', 'E'}; 

stdev = 1; 

tightening = .1; % i have no idea what a good value is
nW = 400; % actual: 200 - 600 ish
stepsize = 2; % actual: 2 to 4 ish
niter = 6; % actual: 2 - 20 ish,
npoints = 3e5; % actual: 1e5 ish
thinning = 20; % actual: 10 to 40 ish

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
addParameter(p, 'simtime', 200);
parse(p);
p = p.Results;
%% setup model
m1 = sbiomodel('enzymatic_rxn');


%% setup model reactions
r1 = addreaction(m1,'E + S <-> C');
Kobj = addkineticlaw(r1,'MassAction');
Kobj.ParameterVariableNames = {'kf','kr'};
addparameter(m1, 'kf', 1)
addparameter(m1, 'kr', 5)

r2 = addreaction(m1,'C -> E + P');
Kobj = addkineticlaw(r2,'MassAction');
Kobj.ParameterVariableNames = {'kc'};
addparameter(m1, 'kc', 1)

% setup model species initial concentrations. 
P = sbioselect(m1, 'name', 'P');
P.InitialAmount = 0;

C = sbioselect(m1, 'name', 'C');
C.InitialAmount = 0;

E = sbioselect(m1, 'name', 'E');
E.InitialAmount = 50;

S = sbioselect(m1, 'name', 'S');
S.InitialAmount = 5000;

m1.species
%% Run the model

cs = getconfigset(m1, 'active');
set(cs, 'StopTime', p.simtime);
        
sd = sbiosimulate(m1);
sbioplot(sd);


%% DONT TOUCH THIS SECTION
%% export and accelerate simbiology model object
% using estimated species and dosing species names

% select the parameters and species objects using the name array
ep = sbioselect(m1, 'Type', 'parameter', 'Name', ...
    mi.names_unord);% est parameters

es = sbioselect(m1, 'Type', 'species', 'Name', ...
    mi.names_unord);% est species

aps = [ep; es]; % active parameters and species

% reorder the parameter and species so they are in the same order as that
% in the model. 
eno = cell(length(aps), 1);% est names ordered

for i = 1:length(aps)
    eno{i} = aps(i).Name;
end

% 
ds = sbioselect(m1, 'Type', 'species', 'Name', mi.dosednames);

emo = export(m1, [ep; es; ds]); % exported model object, dosed species names. 
SI = emo.SimulationOptions;
SI.StopTime = p.simtime;
accelerate(emo);

mi.names_ord = eno;
mi.emo = emo; % !TODO: remove ?

% process variable outputs
nout = nargout;
outstuff = {m1, emo, mi};
varargout(1:nout) = outstuff(1:nout); % REMOVE: i think this should work. 

end

