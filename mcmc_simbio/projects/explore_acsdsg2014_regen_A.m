

% We start with importing data and visualizing it.
% the first runs I did on nessa and lambda were timestamps:
close all
clear all
clc

% run logs (important! -- need a better way to log this)
% LAMBDA RUNS (continuous, plot together) <----- BUG in measuredSpecies in
% mcmc_info
% simdata_20180419_212516 50
% simdata_20180420_131657 80
% simdata_20180421_003808 80
% simdata_20180421_113714 80

% NESSA RUNS (continuous, plot together) <----- BUG in measuredSpecies in
% mcmc_info
% simdata_20180419_213851 80
% simdata_20180420_084047 120
% simdata_20180421_003308 120


%%%%%%%%%%%%%%%% RESTARTING RUNS
% LAMBDA:
% 'stepSize', 2.25,'nW', 400,'nPoints',4e4,'thinning', 20,'nIter', 60, 'stdev', 2
% 'simdata_20180421_224847'
% Simulation Parameters are: 
% path: /home/vsinghal/MBCMCMC/txtlsim_vsfork2017/mcmc_simbio/projects/proj_acs_dsg2014_regen_A 
% stdev: 2.0 
% number of walkers: 400 
% step size:2.25 
% tightening: 1.00 
% number of repeats: 60 
% thinning: 20 
% points per iter: 40000 

% NESSA:
% 'stepSize', 1.60, 'nW', 400, 'nPoints', 4e4, 'thinning', 20,'nIter', 120,
% 'multiplier', 2, 'stdev', 3 'simdata_20180421_212747'
% Simulation Parameters are: 
% path: /home/vsinghal/mcmc/txtlsim/mcmc_simbio/projects/proj_acs_dsg2014_regen_A 
% stdev: 3.0 
% number of walkers: 400 
% step size:1.60 
% tightening: 1.00 
% number of repeats: 120 
% thinning: 20 
% points per iter: 40000 


 tstouse_cell = {'20180421_212747'};

specificprojdir = ['/Users/vipulsinghal/Dropbox/Documents/toolbox/'...
    'txtlsim_vsfork2017/mcmc_simbio/projects/'...
    'proj_acs_dsg2014_regen_A/simdata_' tstouse_cell{1}];

% load mcmc_info and the updated model_info
load([specificprojdir '/full_variable_set_' tstouse_cell{1}], 'mcmc_info', 'mi',...
    'data_info');
%
projdir = ['/Users/vipulsinghal/Dropbox/Documents/toolbox/'...
    'txtlsim_vsfork2017/mcmc_simbio/projects/'...
    'proj_acs_dsg2014_regen_A'];
ri = mcmc_info.runsim_info;
mai = mcmc_info.master_info;
di = data_info;
%  plot stuff
% tstouse =  tstouse;
marray = mcmc_get_walkers(tstouse_cell, {1:120}, projdir);
marray_end = marray(:, :, ((end-20):5:end));
marray_initial = marray(:, :, 1);
%

% mvarray_end = masterVecArray(marray_end, mai);
% mvarray_initial = masterVecArray(marray_initial, mai);
% marrayOrd_end = mvarray_end(mi(2).paramMaps(mi(2).orderingIx, 1),:,:);
% marrayOrd_initial = mvarray_initial(mi(2).paramMaps(mi(2).orderingIx, 1),:,:);
%
pnamelist = {'TX_e', 'tau', 'prom_{Kd}', 'prom_F', 'TX_{term}', 'NTP_{Kd1}',...
    'NTP_{F1}',  'NTP_{Kd2}' 'NTP_{F2}', 'RNase_{Kd}', ' RNase_F', 'RNase_{kc}', ...
    'RNAP', 'RNase', 'TL_e', 'UTR1_{Kd}', 'UTR1_F', 'AA_{Kd}', 'AA_F', 'TLatp_{Kd}', ...
    'TLatp_{F}', 'TL_{term}', 'Ribo'}
    %% plto the first 9, for the final distributions
mcmc_plot(marray_end(1:9, :, :), pnamelist(1:9)',...
    'savematlabfig', false, 'savejpeg', false,...
    'projdir', projdir, 'tstamp', tstouse_cell{1},...
    'extrafignamestring', 'all_txtl_params_final', 'support', mai.paramRanges(1:9, :)');
%% plot the first 9, for the initial  distributions
figure
mcmc_plot(marray_initial(1:9, :, :), pnamelist(1:9)',...
    'savematlabfig', false, 'savejpeg', false,...
    'projdir', projdir, 'tstamp', tstouse_cell{1},...
    'extrafignamestring', 'all_txtl_params_final', 'support', mai.paramRanges(1:9, :)');

%% plot the last 14

mcmc_plot(marray_end(10:end, :, :), pnamelist(10:end)',...
    'savematlabfig', false, 'savejpeg', false,...
    'projdir', projdir, 'tstamp', tstouse_cell{1},...
    'extrafignamestring', 'all_txtl_params_final', 'support', mai.paramRanges(10:end, :)');
%
figure
mcmc_plot(marray_initial(10:end, :, :), pnamelist(10:end)',...
    'savematlabfig', false, 'savejpeg', false,...
    'projdir', projdir, 'tstamp', tstouse_cell{1},...
    'extrafignamestring', 'all_txtl_params_final', 'support', mai.paramRanges(10:end, :)');

%% plot the whole chain, but for only the first 4 points

mcmc_plot(marray(1:9, :, :), pnamelist(1:9)',...
    'savematlabfig', false, 'savejpeg', false,...
    'projdir', projdir, 'tstamp', tstouse_cell{1},...
    'extrafignamestring', 'all_txtl_params_final', 'support', mai.paramRanges(1:9, :)');








%%

mcmc_plot(marray_end, pnamelist',...
    'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstouse_cell{1},...
    'extrafignamestring', 'all_txtl_params_final');
%%
figure
mcmc_plot(marray_initial, mai.estNames,...
    'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstouse_cell{1},...
    'extrafignamestring', 'all_txtl_params_initial');


%%
titls = {'E1 dG 10';'E1 dG 30';'E1 dG 60';};
lgds = {};
mvarray = masterVecArray(marray, mai);
marrayOrd = mvarray(mi(1).paramMaps(mi(1).orderingIx, 1),:,:);
fhandle = mcmc_trajectories(mi(1).emo, di(1), mi(1), marrayOrd,...
    titls, lgds,...
    'SimMode', 'meanstd', 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstouse, 'extrafignamestring',...
    '_extract1');
marrayOrd = mvarray(mi(1).paramMaps(mi(1).orderingIx, 2),:,:);
titls = {'E2 dG 10';'E2 dG 30';'E2 dG 60';};
fhandle = mcmc_trajectories(mi(1).emo, di(2), mi(1), marrayOrd,...
    titls, lgds,...
    'SimMode', 'meanstd', 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstouse, 'extrafignamestring',...
    '_extract2');

