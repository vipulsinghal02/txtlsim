% proj_tierra2018_correction1
% The first correction step step for the Tierra Biosciences dataset. 
% We first do CSP fixing in the calibration data, and generate the Fixed ESPs 
% in the calibration datasets for both E2 (for correction step 1) and E1 
% (for correction step 2). 
% 
% This file performs Correction step 1. 
% Here we fix the ESPs in E2. 
% 
% Overview: this demo uses the following files: 
% 
% - data_info_constructor_tierra2018.m 
% Constructs the data info object. 
% 
% - mcmc_info_tierra2018_calib
% Constructs the mcmc_info struct. 
% 
% - model_protein3.m
% Constructs a constitutive expression model. 
% 
% 

close all
clear all


[tstamp, projdir, st] = project_init;

%% Get the ESP parameters form the calibration data. 
% 11.6.18
% In the calibration data, the krdG is the CSP, and so we fix its value to 
% its meadian value from the simulation with ID 20181106_010736 
% with 40iter and 1.5 stepsize and tightening 1
% (or the more fine version: 20181106_101841, stepsize 1.1, 
% 4iter, and tightening 10. .)
% 
% Actually Use this: 20181105_112220, 10iter. This is because 
% the above ones were are very large parameter values, and I think 
% integration tolerance systematic errors might be occuring. 
% 

calib_projdir = ...
    ['/Users/vipulsinghal/Dropbox/Documents/toolbox/txtlsim_vsfork2017/'...
    'mcmc_simbio/projects/proj_tierra2018_calibration'];
marraytemp = mcmc_get_walkers({'20181105_112220'}, {1:10}, calib_projdir); 

msz=size(marraytemp)
marraytemp2 = marraytemp(:, :)';
clear marraytemp
msz=size(marraytemp2)

% take the median value for the krdg parameter, 
% and use the index of that value to pick the point to use. 
[sorted_krdg, Ix] = sort(marraytemp2(:,1));
mediansIx = Ix(ceil(length(Ix)/2));
median_fullparam_log = marraytemp2(mediansIx, :)
format short g
median_fullparam = exp(median_fullparam_log)

% Using these, we can pick the ESPs for both the reference and 
% candidate extracts: 
ref_esp_ix = [2,4];
can_esp_ix = [3,5];

ref_esp = median_fullparam(ref_esp_ix);
can_esp = median_fullparam(can_esp_ix);
csp_cutpoint = median_fullparam(1);
% set the model esp parameters to the can_esp

%%

mobj = model_aTc_induc1;

mcmc_info = mcmc_info_tierra2018_corr(mobj, can_esp, csp_cutpoint);

mi = mcmc_info.model_info;

%% Get experimental data
di = tierradataset;
di(5).timeVector = di(5).timeVector(1:121);
di(6).timeVector = di(6).timeVector(1:121);
di(5).dataArray = di(5).dataArray(1:121, :,:,:);
di(6).dataArray = di(6).dataArray(1:121, :,:,:);

mcmc_trajectories([], di(6), [], [], [], [], 'just_data_info', true);

% Manually find a set of parameters that get you in the approximate realm of 
% the experimental data (Otherwise a lot more computation is needed..
% completely doable, but takes some time / cluster access, which I do not
% currently have). 

% manually pick parameter values
cpol = can_esp(2); % nM
rkfdG = .5; % nM-1s-1
rkrdG = csp_cutpoint(1); % s-1
rkfdT = .2;
rkrdT = 30;
rkcp = can_esp(1); %s-1
frate = .5;
rrate = 20;
rkfdimTet = frate ; % nM-1s-1
rkrdimTet = rrate; % s-1
rkfseqTet = frate ; % nM-1s-1
rkrseqTet = rrate; % s-1
% rkfdimaTc = frate ;
% rkrdimaTc = rrate;
rkfseqaTc = frate ;
rkrseqaTc = rrate;
 
masterVector = log([...
rkfdG 
rkrdG
rkfdT
rkrdT
rkfdimTet
rkrdimTet
rkfseqTet
rkrseqTet
rkfseqaTc
rkrseqaTc
rkcp
cpol]);

% rkfdimaTc
% rkrdimaTc

% simulate the data
% di_artificial = data_artificial_v2({mobj}, {di(6).timeVector}, ...
%     {mi.measuredSpecies},...
%     {mi.dosedNames}, {mi.dosedVals}, ...
%     {mi.namesUnord},...
%      {exp(masterVector), exp(masterVector)});

 di_artificial = data_artificial_v2(mobj, di(6).timeVector, ...
    mi.measuredSpecies,...
    mi.dosedNames, mi.dosedVals, ...
    mi.namesUnord,...
     exp(masterVector));
da_test_cand = di_artificial(1).dataArray;
tv = di_artificial(1).timeVector;

% Plot the data against experimental data from the previous step. 

mcmc_trajectories([], di_artificial, [], [], [], [], 'just_data_info', true);
ri = mcmc_info.runsim_info;

mai = mcmc_info.master_info;
%%
marraytemp = mcmc_get_walkers({'20181107_135851'}, {1:2}, projdir); 
% next iter NOT run yet, nov 5, 11 am. 
msz=size(marraytemp); %5    46   440

initialization_matrix = [marraytemp(:,:,end)];
clear marraytemp

mi = mcmc_runsim_v2(tstamp, projdir, di(6), mcmc_info,...
    'pausemode', true,...
    'multiplier', 2,'UserInitialize', initialization_matrix);
% 
%    'InitialDistribution', 'LHS'


%%
tstamptouse = tstamp;%'20181107_084423';
projdir_usethis = projdir;
%['/Users/vipulsinghal/Dropbox/Documents/toolbox/txtlsim_vsfork2017/mcmc_simbio/projects/proj_tierra2018_correction1']

addpath(projdir_usethis)
%load(['full_variable_set_' tstamptouse])

% tstamptouse = tstamp; 
marray = mcmc_get_walkers({tstamptouse}, {1:10}, projdir_usethis);

% plot parameter distribution corner plot, and markov chains. 
mcmc_plot(marray, mai.estNames,...
    'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir_usethis, 'tstamp', tstamptouse,...
    'extrafignamestring', '_tierra_corr1_t1');

%%

titls = {'aTc 10000';'aTc 1000';'aTc 100';'aTc 10';'aTc 1'};
lgds = {};
mvarray = masterVecArray(marray, mai);
%
marrayOrd = mvarray(mi(1).paramMaps(mi(1).orderingIx, 1),:,:);
%
fhandle = mcmc_trajectories(mi(1).emo, di(6), mi(1), marrayOrd,...
    titls, lgds,...
    'SimMode', 'meanstd', 'ExpMode', 'curves', 'savematlabfig', true,...
    'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse,...
    'extrafignamestring', '_tierra_corr_t1');


%% 