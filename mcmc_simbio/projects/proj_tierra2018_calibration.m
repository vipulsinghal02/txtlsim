% proj_tierra2018_calibration 
% The calibration step for the Tierra Biosciences dataset. 
% 
% Script for the correction of aTc data from Tierra biosciences can be
% found in the file proj_tierra2018_correction. 
% 
% Overview: this demo uses the following files: 
% 
% 
% - mcmc_info_tierra2018_calib
% Constructs the mcmc_info struct. 
% 
% - model_protein3.m
% Constructs a constitutive expression model. 
% 

close all
[tstamp, projdir, st] = project_init;

mobj = model_protein3;

mcmc_info = mcmc_info_tierra2018_calib(mobj);

mi = mcmc_info.model_info;

%% Get experimental data
% di = data_info_tierra2018;
close all
di = tierradataset;
di(3).timeVector = di(3).timeVector(1:81);
di(4).timeVector = di(4).timeVector(1:81);
di(3).dataArray = di(3).dataArray(1:81, :,:,:)/10;
di(4).dataArray = di(4).dataArray(1:81, :,:,:)/10;

mcmc_trajectories([], di(3:4), [], [], [], [], 'just_data_info', true);

% Manually find a set of parameters that get you in the approximate realm of 
% the experimental data (Otherwise a lot more computation is needed..
% completely doable, but takes some time / cluster access, which I do not
% currently have). 

% manually pick parameter values
rkfdG = 0.5; % nM-1s-1
rkrdG = 30; % s-1
rkcp1 = 0.12; %s-1
rkcp2 = 0.24; %s-1
cpol1 = 4; % nM
cpol2 = 1.5; % nM
 
masterVector = log([...
rkfdG 
rkrdG
rkcp1
rkcp2
cpol1
cpol2]);

% simulate the data
di_artificial = data_artificial_v2({mobj}, {di(3).timeVector}, {mi.measuredSpecies},...
    {mi.dosedNames}, {mi.dosedVals}, {mi.namesUnord},...
     {exp(masterVector([1:2 3 5])), exp(masterVector([1:2 4 6]))});

da_extract1 = di_artificial(1).dataArray;
da_extract2 = di_artificial(2).dataArray;
tv = di_artificial(1).timeVector;

% Plot the data against experimental data from the previous step. 

mcmc_trajectories([], di_artificial, [], [], [], [], 'just_data_info', true);

%%
ri = mcmc_info.runsim_info;

mai = mcmc_info.master_info;

%% 
% '20181105_224005'}, {1:8}
% 20181106_010736
% latest sim:  20181106_101841, 4iters, 
% 

% 20181106_141312 % 5iter
%20181106_145414 %12iter
marraytemp = mcmc_get_walkers({'20181106_145414'}, {1:12}, projdir); 
% next iter NOT run yet, nov 5, 11 am. 
msz=size(marraytemp); %5    46   440

initialization_matrix = [marraytemp(:,:,end)];
clear marraytemp

tic
%%
mi = mcmc_runsim_v2(tstamp, projdir, di, mcmc_info,...
    'pausemode', true,...
    'multiplier', 4, 'UserInitialize', initialization_matrix);
%'UserInitialize', initialization_matrix
%  'InitialDistribution', 'LHS'

toc
%% Save Stuff

tstamptouse = tstamp; 
marray = mcmc_get_walkers({tstamptouse}, {1:ri.nIter}, projdir);

% plot parameter distribution corner plot, and markov chains. 
mcmc_plot(marray, mai.estNames,...
    'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse,...
    'extrafignamestring', '_tierra_calib_t1');

%%

titls = {'dG 1';'dG 2';'dG 4';'dG 8'};
lgds = {};
mvarray = masterVecArray(marray, mai);
marrayOrd = mvarray(mi(1).paramMaps(mi(1).orderingIx, 1),:,:);
fhandle = mcmc_trajectories(mi(1).emo, di(3), mi(1), marrayOrd,...
    titls, lgds,...
    'SimMode', 'meanstd', 'ExpMode', 'curves', 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse, 'extrafignamestring',...
    '_tierra_calib_t1');

%%
marrayOrd = mvarray(mi(1).paramMaps(mi(1).orderingIx, 2),:,:);
fhandle = mcmc_trajectories(mi(1).emo, di(4), mi(1), marrayOrd,...
    titls, lgds,...
    'SimMode', 'meanstd','ExpMode', 'curves', 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse, 'extrafignamestring',...
    '_tierra_calib_t1');