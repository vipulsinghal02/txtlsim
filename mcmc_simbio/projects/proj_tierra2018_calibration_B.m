% proj_tierra2018_calibration_B
% The calibration step for the Tierra Biosciences dataset. 
% Second data set that Abel sent me on Nov 6 2018. 
% Here we first try to correct the tetR Repression data 
% using the calibration from the pTet constututive expression data. 
% 
% Script for the correction of tetR data from Tierra biosciences can be
% found in the file proj_tierra2018_correction_B. 
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

mcmc_info = mcmc_info_tierra2018_calib_B(mobj);

mi = mcmc_info.model_info;

% Get experimental data
% di = data_info_tierra2018;
close all
di = tierradataset('dataset11062018');
% load the constitutive expression data
di(3).timeVector = di(3).timeVector(1:41);
di(4).timeVector = di(4).timeVector(1:41);
di(3).dataArray = di(3).dataArray(1:41, :,:,:)/10;
di(4).dataArray = di(4).dataArray(1:41, :,:,:)/10;

mcmc_trajectories([], di(3:4), [], [], [], [], 'just_data_info', true);

% Manually find a set of parameters that get you in the approximate realm of 
% the experimental data (Otherwise a lot more computation is needed..
% completely doable, but takes some time / cluster access, which I do not
% currently have). 
%%
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

% 20181110_144647, 12 iter, nW: 200, mai.paramRanges:
%    -0.2125   14.7875
%    -7.1203    7.8797
%    -7.1203    7.8797
%    -4.5945   10.4055
%    -4.5945   10.4055

% 20181110_160929, 12 iter, nW: 200, mai.paramRanges:
%    -5.2125   22.7875
%   -10.1203    7.8797
%   -10.1203    7.8797
%    -7.5945   10.4055
%    -7.5945   10.4055

% 20181110_192828, nIter: 6, nW = 200
%    -5.2125   22.7875
%   -10.1203   12.8797
%   -10.1203   12.8797
%    -7.5945   10.4055
%    -7.5945   10.4055
   
   % 20181111_191438 nIter = 20
   % 20181111_211323 = 10
marraytemp = mcmc_get_walkers({'20181111_211323'}, {1:10}, projdir); 
msz=size(marraytemp); %5    46   440
initialization_matrix = marraytemp(:,:,end);
clear marraytemp

tic
%%

mi = mcmc_runsim_v2(tstamp, projdir, di, mcmc_info,...
    'pausemode', true,...
    'multiplier', 1.7,'UserInitialize', initialization_matrix);
%'UserInitialize', initialization_matrix
%  'InitialDistribution', 'LHS'
% 'UserInitialize', initialization_matrix

toc
%% Save Stuff

tstamptouse = tstamp; 
marray = mcmc_get_walkers({tstamptouse}, {1:ri.nIter}, projdir);

% plot parameter distribution corner plot, and markov chains. 
mcmc_plot(marray, mai.estNames,...
    'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse,...
    'extrafignamestring', '_tierra_calib_testB');

%%

titls = {'dG 1';'dG 2';'dG 4';'dG 8'};
lgds = {};
mvarray = masterVecArray(marray, mai);
marrayOrd = mvarray(mi(1).paramMaps(mi(1).orderingIx, 1),:,:);
fhandle = mcmc_trajectories(mi(1).emo, di(3), mi(1), marrayOrd,...
    titls, lgds,...
    'SimMode', 'meanstd', 'ExpMode', 'curves', 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse, 'extrafignamestring',...
    '_tierra_calib_testB');

%%
marrayOrd = mvarray(mi(1).paramMaps(mi(1).orderingIx, 2),:,:);
fhandle = mcmc_trajectories(mi(1).emo, di(4), mi(1), marrayOrd,...
    titls, lgds,...
    'SimMode', 'meanstd','ExpMode', 'curves', 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse, 'extrafignamestring',...
    '_tierra_calib_testB');