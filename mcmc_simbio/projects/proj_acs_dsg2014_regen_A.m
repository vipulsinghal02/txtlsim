%% MCMC toolbox fits using ACS DSG data, with VNPRL 2011 for some extra info,
% and the new regeneration system for ATP management. 
% We demonstrate the use of the MCMC estimation capabilities of the 
% txtl modeling toolbox here. We set up an estimation problem with
% constitutively expressed GFP in TXTL at different DNA concentrations.
% 
% Vipul Singhal, 
% California Institute of Technology
% 2018

%% initialize the directory where things are stored.
[tstamp, projdir, st] = project_init;
data_init

%% construct simbiology model object(s)
mobj = model_dsg2014;

%% setup the mcmc_info struct
mi = mcmc_info_dsg2014_mrna(mobj);

%% setup the data_info struct
di = data_dsg2014; 
% modify di to only contain the mRNA data. 
di.dataArray = di.dataArray(:, 1, :, :); % pick out only the mrna
di.measuredNames = di.measuredNames(1);
di.dataUnits = di.dataUnits(1);
di.dataInfo = ['Modified to only have mRNA data. \n',...
di.dataInfo];
%% run the mcmc simulations 
prevtstamp = {'20180120_172922'};
simID = {'1'};
marray = mcmc_get_walkers(prevtstamp, {simID}, projdir); 
mtemp = marray(:,:);

mi = mcmc_runsim(tstamp, projdir, di, mobj, mi,'UserInitialize',...
 mtemp(:,(end-mi.nW):end)); 

%% get the MCMC results from saved files.
simID = {'1'};
marray = mcmc_get_walkers({tstamp}, {simID}, projdir);

%% Cut the parameter manifolds / 
% sets using slabs in parameter space (approximate affine spaces)
paramindices = [1 4 6];
parambounds = [2.5 4  -1  ; 1  1 -4];
marray_cut = mcmc_cut(marray(:,:)', paramindices, parambounds);

%% plot the chains, correlations, and corner plots
mcmc_plot(marray, mi.names_ord)

%% plot trajectories
nPrevPoints = 5;

load(['/Users/vipulsinghal/Dropbox/Documents/toolbox/txtlsim_vsfork2017/'...
'mcmc_simbio/projects/proj_acs_dsg2014_mrna/simdata_20180121_131114/full_variable_set_20180121_131114.mat'])
marray = mcmc_get_walkers({'20180121_131114'}, {5}, ...
      ['/Users/vipulsinghal/Dropbox/Documents/toolbox/txtlsim_vsfork2017/'...
      'mcmc_simbio/projects/proj_acs_dsg2014_mrna']);
marray = marray(:, end-nPrevPoints+1:end, end);


minew = struct(...
    'circuitInfo',{'mrna circuit, acs dsg 2014'},...
    'modelObj', {mobj},...
    'modelName', {mobj.name},...;
    'namesUnord', {mi.names_unord}, ...
    'dosedNames', {mi.dosednames},...
    'nW', {600},...                   
    'dosedVals', {mi.dosedvals},... 
    'measuredSpecies', {mi.measuredspecies});
                            
                            
%
titls = {'dna 0.5'; 'dna 2';'dna 5';'dna 20'};
lgds = {};
mcmc_trajectories(mi.emo, di, minew, marray', titls,...
    lgds, 'nSimCurves', nPrevPoints)

%% plot the 3D plots. !TODO later
titlestr = ['test title'];
axisLabels = {'ke TX', 'Kd', 'term'};
mcmc_3D(marray_cut, axisLabels, titlestr)




