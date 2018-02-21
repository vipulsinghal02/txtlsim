%% MCMC toolbox demo
% Vipul Singhal, California Institute of Technology
% 2017
% We demonstrate the use of the MCMC estimation capabilities of the txtl
% modeling toolbox here. 
% 
% This is the second part of the parameter estimation example
% proj_acs_dsg2014

% We set up an estimation problem with constitutively expressed 
% GFP in TXTL at different DNA concentrations. The mrna parameters 
% have already been fixed in part one of the estimation: proj_acs_dsg2014_mrna
% Now we still vary the DNA, and keep the mRNA parameters fixed and try to
% estimate the protien parameters. The species that get fit is just the GFP
% protien. 

%% initialize the directory where things are stored.
[tstamp, projdir, st] = project_init;
data_init

% data_info struct. 
di = data_dsg2014; %

di.dataArray = di.dataArray(:, 2, :, :); % pick out only the protein
di.measuredNames = di.measuredNames(2);
di.dataUnits = di.dataUnits(2);
di.dataInfo = ['Modified to only have protein data. \n ',...
di.dataInfo];

%% construct simbiology model object(s)
mobj = model_dsg2014;

%% %% setup the mcmc_info struct - capture all the mcmc information 
% except the data and the model. 
mcmc_info = mcmc_info_dsg2014_protein_v2(mobj);
ri = mcmc_info.runsim_info;
mai = mcmc_info.master_info;

%% set up the MCMC estimation

marray = mcmc_get_walkers({'20180219_154541'}, {10}, projdir);
marray_cut = mcmc_cut(marray, (1:10), flipud((mai.paramRanges)'));
if size(marray_cut, 2) ~= ri.nW
    error('too few initial points');
end
%%
mi = mcmc_runsim_v2(tstamp, projdir, di, mcmc_info,'UserInitialize', marray_cut(:,:,end));%'InitialDistribution', 'gaussian' 'UserInitialize', marray_cut(:,:,end)); 
%%

% load([projdir '/simdata_' tstamp '/full_variable_set_' tstamp '.mat']);
%%
marray = mcmc_get_walkers({tstamp}, {1}, projdir);
%%
mcmc_plot(marray(:,:,end), mai.estNames);
%% plot trajectories
titls = {'dna 0.5'; 'dna 2';'dna 5';'dna 20'};
lgds = {};
% marray must be in the right order to go into the exported model object. 

mvarray = masterVecArray(marray, mai);
marrayOrd = mvarray(mi(1).paramMaps(mi(1).orderingIx, 1),:,:);
%% plot trajectories
mcmc_trajectories(mi(1).emo, di(1), mi(1), marrayOrd, titls, lgds)






