%% MCMC toolbox demo - proj_protein_constgfp3iv.m
% 
% const gfp 3, 
% artificial data, 
% separate, 2 extracts. 
% Check if the CSPs line up exactly. 
% kf fixed. 
%
% This file was modeled after the file proj_protein_constgfp3i.m. 
% 
% Vipul Singhal, 
% California Institute of Technology
% 2018

%% initialize the directory where things are stored.
 close all
% clear all
% clc
[tstamp1, projdir, st] = project_init;

%% We first define the model, mcmc_info struct, and the data_info struct. 
% for the two extracts
mobj = model_protein5;
mcmc_info = mcmc_info_constgfp5ii(mobj);
mi = mcmc_info.model_info;

cpol = 100; % nM
cribo = 50; %nM

rkfdG = 10; % nM-1s-1
rkrdG = 600; % s-1
rkcm = 0.001; %s-1

rkfpG = 10; % nM-1s-1
rkrpG = 300; % s-1
rkcp = 1/36;

rdel_m = log(2)/720; % 12 min half life of mrna

    masterVector = log([...
    rkfdG;rkrdG;rkfpG;rkrpG;rkcm;rkcp;rdel_m;cpol;cribo]);

di = data_artificial_v2({mobj}, {0:180:7200}, {mi.measuredSpecies}, ...
    {mi.dosedNames}, {mi.dosedVals}, {mi.namesUnord},...
    {exp(masterVector), [exp(masterVector(1:end-5)); 2*exp(masterVector((end-4):end))]});

da_extract1 = di(1).dataArray;
da_extract2 = di(2).dataArray;
tv = di(1).timeVector;

mcmc_trajectories([], di, [], [], [], [], 'just_data_info', true);


%%
%     Run the MCMC 
ri = mcmc_info.runsim_info;
mai = mcmc_info.master_info;

%%
mi1 = mcmc_runsim_v2(tstamp1, projdir, di(1), mcmc_info,...
    'InitialDistribution', 'LHS');

%%  plot stuff 
tstamptouse = tstamp1; 
marray = mcmc_get_walkers({tstamptouse}, {1:ri.nIter}, projdir);
mcmc_plot(marray, mai.estNames, 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse, 'extrafignamestring', '_extract1');
% mcmc_plot(marray, mi1.namesUnord,'ks', true, 'scatter', false);
% mcmc_plot(marray, mi1.namesUnord,'transparency', 0.05);
titls = {'E1 dG 10';'E1 dG 30';'E1 dG 60'};
lgds = {};
mvarray1 = masterVecArray(marray, mai);

% paramMaps accesses the full mastervec (as opposed to just the estimated values)
%  to give the full vector of (unordered) values for a model.
marrayOrd = mvarray1(mi1(1).paramMaps(mi1(1).orderingIx, 1),:,:); 

fhandle = mcmc_trajectories(mi1(1).emo, di(1), mi1(1), marrayOrd, titls, lgds,...
    'SimMode', 'curves', 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse, 'extrafignamestring', '_extract1');

% %% 3D plot
% % the 3d saving here is trickier: 11 Choose 3 is 165. So for 2 extracts, there are 330 plots. 
% % this is too many. Not going to plot any at the moment. 

%% Estimate the parameters for the second extract. 
[tstamp2, projdir, st] = project_init;
mi2 = mcmc_runsim_v2(tstamp2, projdir, di(2), mcmc_info,...
    'InitialDistribution', 'LHS');

%%  plot stuff 
tstamptouse = tstamp2; 
marray = mcmc_get_walkers({tstamptouse}, {1:ri.nIter}, projdir);
mcmc_plot(marray, mai.estNames, 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse, 'extrafignamestring', '_extract1');
% mcmc_plot(marray, mi2.namesUnord,'ks', true, 'scatter', false);
% mcmc_plot(marray, mi2.namesUnord,'transparency', 0.05);
titls = {'E2 dG 10';'E2 dG 30';'E2 dG 60'};
lgds = {};
mvarray2 = masterVecArray(marray, mai);

% paramMaps accesses the full mastervec (as opposed to just the estimated values)
%  to give the full vector of (unordered) values for a model.
marrayOrd = mvarray2(mi2(1).paramMaps(mi2(1).orderingIx, 1),:,:); 

fhandle = mcmc_trajectories(mi2(1).emo, di(2), mi2(1), marrayOrd, titls, lgds,...
    'SimMode', 'curves', 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse, 'extrafignamestring', '_extract2');

