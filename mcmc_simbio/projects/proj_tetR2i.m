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
 clear all
 clc
[tstamp1, projdir, st] = project_init;

%% We first define the model, mcmc_info struct, and the data_info struct. 
% for the two extracts
mobj = model_tetR_repression2;
mcmc_info = mcmc_info_tetR_2i(mobj);
mi = mcmc_info.model_info;

rkfdG = 1; % nM-1s-1
rkrdG = 60; % s-1

rkfdT = 1;
rkrdT = 60;

rkfpG = 2; % nM-1s-1
rkrpG = 60; % s-1

rkfpT = 2;
rkrpT = 60;

rkfdimTet = 200; % nM-1s-1
rkrdimTet = 100; % s-1

rkfseqTet = 200; % nM-1s-1
rkrseqTet = 100; % s-1

cpol = 100; % nM
cribo = 50; %nM
rkcm = 0.001; %s-1
rkcp = 1/36;
rdel_m = log(2)/720; % 12 min half life of mrna

    masterVector = log([...
    rkfdG;rkrdG;rkfpG;rkrpG;rkfdT;rkrdT;rkfpT;rkrpT;rkfdimTet;...
    rkrdimTet;rkfseqTet;rkrseqTet;rkcm;rkcp;rdel_m;cpol;cribo]);

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

marray = mcmc_get_walkers({'20180323_101331'}, {15}, projdir);
pID = 1:length(mai.estNames);
marray_cut = mcmc_cut(marray, pID, flipud((mai.paramRanges)'));
if size(marray_cut, 2) < ri.nW
    error('too few initial points');
elseif size(marray_cut, 2) > ri.nW
    marray_cut = marray_cut(:,1:ri.nW, :);
end


mi1 = mcmc_runsim_v2(tstamp1, projdir, di(1), mcmc_info,...
    'UserInitialize', marray_cut(:,:,end), 'multiplier', 2); 
% 'UserInitialize', marray_cut(:,:,end)
% 'InitialDistribution', 'LHS'

%%  plot stuff 
tstamptouse = tstamp1; 
marray = mcmc_get_walkers({tstamptouse}, {1:ri.nIter}, projdir);
mcmc_plot(marray, mai.estNames, 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse, 'extrafignamestring', '_extract1');
% mcmc_plot(marray, mi1.namesUnord,'ks', true, 'scatter', false);
% mcmc_plot(marray, mi1.namesUnord,'transparency', 0.05);
titls = {'E1 dT 0.5 dG 10';'E1 dT 0.5 dG 30';'E1 dT 0.5 dG 60'; 
'E1 dT 2 dG 10';'E1 dT 2 dG 30';'E1 dT 2 dG 60';
'E1 dT 8 dG 10';'E1 dT 8 dG 30';'E1 dT 8 dG 60';};
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


marray = mcmc_get_walkers({'20180323_130435'}, {15}, projdir);
pID = 1:length(mai.estNames);
marray_cut = mcmc_cut(marray, pID, flipud((mai.paramRanges)'));
if size(marray_cut, 2) < ri.nW
    error('too few initial points');
elseif size(marray_cut, 2) > ri.nW
    marray_cut = marray_cut(:,1:ri.nW, :);
end


[tstamp2, projdir, st] = project_init;
mi2 = mcmc_runsim_v2(tstamp2, projdir, di(2), mcmc_info,...
    'UserInitialize', marray_cut(:,:,end), 'multiplier', 2); 
% 'UserInitialize', marray_cut(:,:,end)
% 'InitialDistribution', 'LHS'

%%  plot stuff 
tstamptouse = tstamp2; 
marray = mcmc_get_walkers({tstamptouse}, {1:ri.nIter}, projdir);
mcmc_plot(marray, mai.estNames, 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse, 'extrafignamestring', '_extract2');
% mcmc_plot(marray, mi2.namesUnord,'ks', true, 'scatter', false);
% mcmc_plot(marray, mi2.namesUnord,'transparency', 0.05);
titls = {'E2 dT 0.5 dG 10';'E2 dT 0.5 dG 30';'E2 dT 0.5 dG 60'; 
'E2 dT 2 dG 10';'E2 dT 2 dG 30';'E2 dT 2 dG 60';
'E2 dT 8 dG 10';'E2 dT 8 dG 30';'E2 dT 8 dG 60';};
lgds = {};
mvarray2 = masterVecArray(marray, mai);

% paramMaps accesses the full mastervec (as opposed to just the estimated values)
%  to give the full vector of (unordered) values for a model.
marrayOrd = mvarray2(mi2(1).paramMaps(mi2(1).orderingIx, 1),:,:); 

fhandle = mcmc_trajectories(mi2(1).emo, di(2), mi2(1), marrayOrd, titls, lgds,...
    'SimMode', 'curves', 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse, 'extrafignamestring', '_extract2');

