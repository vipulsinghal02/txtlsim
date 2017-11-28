function [m, emo ,mi] = model_dsg2014(mi,tv, varargin)
%model_dsg2014 Constitutive gene expression model using the txtl
%modeling toolbox stored in txtl_directory
% 
% the default txtl modeling toolbox directory is the one stored in the src
% folder but you can specify another one. Whichever directory is used to
% setup the model, it is added to the path, the model is created, and then it is
% removed from the path. 
%
% THIS MODEL: <add info here>

% %% get txtl modeling toolbox
% if nargin >2
%     txtl_directory = varargin{1};
% else
%     % get the name of the (project) file calling this function, and its path.
%     % get the path of this file, replace with mfilename
%     fp = mfilename('fullpath');
%     slashes = regexp(fp, '/');
%     % looks like slashes =
%     %      1     7    20    28    38    49    54    64    76
%     mcmc_simbio_relpath = fp(1:slashes(end-1)-1);
%     % looks something like /Users/vipulsinghal/Dropbox/Documents/vipul_repo/mcmc/code_mcmc/mcmc_simbio
%     txtl_directory = [mcmc_simbio_relpath '/src/txtl_modeling_toolbox'];
% end
% 
% addpath(txtl_directory);
% txtl_init

%% ################## EDIT THIS SECTION AS NEEDED ####################
% Specify the config files, dna, inducers etc. See TXTL Modeling toolbox
% documentation as needed. 

% setup model object (this model uses the txtl toolbox at 
tube1 = txtl_extract('Emcmc2017');
tube2 = txtl_buffer('Emcmc2017');
tube3 = txtl_newtube('gene_expression');
txtl_add_dna(tube3, ...
  'p70(50)', 'utr1(20)', 'deGFP(1000)', 1, 'plasmid');	

m = txtl_combine([tube1, tube2, tube3]);


%% MOST OFTEN YOU WILL NOT NEED TO TOUCH THIS SECTION
cs1 = getconfigset(m);
set(cs1.RuntimeOptions, 'StatesToLog', 'all');

set(cs1.SolverOptions, 'AbsoluteToleranceScaling', 1);
set(cs1.SolverOptions, 'AbsoluteTolerance', 1.0e-6);
set(cs1.SolverOptions, 'AbsoluteToleranceStepSize', tv(end)*1.0e-6*0.1);
set(cs1.SolverOptions, 'RelativeTolerance', 1.0e-6);
% try: AbsoluteToleranceStepSize = AbsoluteTolerance * StopTime * 0.1
tic
    [~] = txtl_runsim(m,tv(end));
toc


%% DONT TOUCH THIS SECTION
% modify the base model to get it ready for parameter estimation. 
% Change the scope of the reversible reaction parameters from the
% reaction to the model level scope. This is needed for adding rules
% between the parameters (like Kd rules).
% The rules are needed because in parameter esitmation when you change some
% base parameter (like Kd) the parameters that are associated should also
% change. 
% Just like for the reversible reactions, the irreversible reaction params 
% need to be model scoped because
% for the elongation rate the parameter is tied to NTP consumption rates,
% and for the RNA deg rate... actually I dont know. I think at this point I
% am just making everything global, so that a single code set can be used
% uniformly for all the parameters.

globalize_params(m)

%% DONT TOUCH THIS SECTION
% export and accelerate simbiology model object using estimated species
% and dosing species names

% select the parameters and species objects using the name array
ep = sbioselect(m, 'Type', 'parameter', 'Name', ...
    mi.names_unord);% est parameters

es = sbioselect(m, 'Type', 'species', 'Name', ...
    mi.names_unord);% est species

aps = [ep; es]; % active parameters and species

% reorder the parameter and species so they are in the same order as that
% in the model. 
eno = cell(length(aps), 1);% est names ordered

for i = 1:length(aps)
    eno{i} = aps(i).Name;
end

% 
ds = sbioselect(m, 'Type', 'species', 'Name', mi.dosednames);

emo = export(m, [ep; es; ds]); % exported model object, dosed species names. 
SI = emo.SimulationOptions;
SI.StopTime = tv(end);
accelerate(emo);

mi.names_ord = eno;
mi.emo = emo;
end

