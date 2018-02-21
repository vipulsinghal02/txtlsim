%% MCMC toolbox demo
% We demonstrate the use of the MCMC estimation capabilities of the txtl
% modeling toolbox here. We set up an estimation problem with
% constitutively expressed GFP in TXTL at different DNA concentrations.
% 
% Vipul Singhal, 
% California Institute of Technology
% 2018

%% initialize the directory where things are stored.
[tstamp, projdir, st] = project_init;
data_init

%% construct simbiology model object(s)
[mobj, emo ,mi] = model_dsg2014(mi, tv);
% - 

%% setup the mcmc_info struct
mi = mcmc_info_dsg2014_mrna;

%% setup the data_info struct
di = data_dsg2014; %
da = di.dataArray(:, 1, :, :); % pick out only the mrna

%% plot data and model trajectories for a few random parameter inputs
mcmc_trajectories(mobj, di, mi, param_matrix)

%% run the mcmc simulations
prevtstamp = '20180120_172922';
simID = '10';

marray = mcmc_get_walkers(prevtstamp, simID, projdir); 

mcmc_runsim_4(tstamp, projdir, tv,da, emo, mi,'userinitialize', marray(:,1:mi.nW,end)); 

%% get the MCMC results from saved files. 
marray = mcmc_get_walkers(prevtstamp, simID, projdir);

%% Cut the parameter manifolds / sets using slabs in parameter space (approximate affine spaces)
marray_cut = mcmc_cut(marray(:,:)', paramindices, parambounds)

%% plot the chains, correlations, and corner plots
mcmc_plot(marray, legends)

%% plot trajectories
mcmc_trajectories(mobj, di, mi, marray(:,1:200))

%% plot the 3D plots. 
mcmc_3D(marray_cut, axisIndices, axisLabels)
