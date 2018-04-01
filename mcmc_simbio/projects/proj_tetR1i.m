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
mobj = model_tetR_repression1;
mcmc_info = mcmc_info_tetR_1i(mobj);
mi = mcmc_info.model_info;

cpol = 100; % nM
rkfdG = 5; % nM-1s-1
rkrdG = 300; % s-1
rkfdT = 5;
rkrdT = 300;
rkcp = 0.012; %s-1
rkfdimTet = 20; % nM-1s-1
rkrdimTet = 10; % s-1
rkfseqTet = 20; % nM-1s-1
rkrseqTet = 10; % s-1

masterVector = log([...
rkfdG 
rkrdG
rkfdT
rkrdT
rkfdimTet
rkrdimTet
rkfseqTet
rkrseqTet
rkcp
cpol]);

di = data_artificial_v2({mobj}, {0:180:7200}, {mi.measuredSpecies}, ...
    {mi.dosedNames}, {mi.dosedVals}, {mi.namesUnord},...
    {exp(masterVector), [exp(masterVector(1:end-2)); 0.024; 200]});

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
figure
tstamptouse = tstamp1; 
marray1 = mcmc_get_walkers({tstamptouse}, {1:ri.nIter}, projdir);
mcmc_plot(marray1, mai.estNames, 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse, 'extrafignamestring', '_extract1');
% mcmc_plot(marray, mi1.namesUnord,'ks', true, 'scatter', false);
% mcmc_plot(marray, mi1.namesUnord,'transparency', 0.05);
titls = {'E1 dT 0.5 dG 10';'E1 dT 0.5 dG 30';'E1 dT 0.5 dG 60'; 
'E1 dT 2 dG 10';'E1 dT 2 dG 30';'E1 dT 2 dG 60';
'E1 dT 8 dG 10';'E1 dT 8 dG 30';'E1 dT 8 dG 60';};
lgds = {};
mvarray1 = masterVecArray(marray1, mai);

% paramMaps accesses the full mastervec (as opposed to just the estimated values)
%  to give the full vector of (unordered) values for a model.
marrayOrd = mvarray1(mi1(1).paramMaps(mi1(1).orderingIx, 1),:,:); 

fhandle = mcmc_trajectories(mi1(1).emo, di(1), mi1(1), marrayOrd, titls, lgds,...
    'SimMode', 'curves', 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse, 'extrafignamestring', '_extract1');

%% 3D plot
% the 3d saving here is trickier: 6 Choose 3 is 20. So for 2 extracts, there are 40 plots. 
% this is too many. I think I am going to just plot some small subset of the 3-wise plots. 
% in particular, I am interested in the covariation of the two ESPs wrt the CSPs! I do not really 
% care about the covariation within the CSPs. Cool realization!
pToPlot = [5 6 1; 5 6 2;  5 6 3;  5 6 4;];
% I am also mildly curious about the covatiation of the tetR repression system parameters 
% All of these are CSPs. 
pToPlot = [pToPlot; 2 3 4];

% labellist = {'kf' 'kr' 'kc1' 'Pol1' 'kc2' 'Pol2' };
labellist = mai.estNames;
for plotID = 1:size(pToPlot, 1)
    mstacked = marray1(:,:)';
    figure
    XX = mstacked(1:2:end, [pToPlot(plotID,1)]);
    YY = mstacked(1:2:end, [pToPlot(plotID,2)]);
    ZZ = mstacked(1:2:end, [pToPlot(plotID,3)]);
    scatter3(XX,YY,ZZ)
    xlabel(labellist{pToPlot(plotID,1)}, 'FontSize', 20)
    ylabel(labellist{pToPlot(plotID,2)}, 'FontSize', 20)
    zlabel(labellist{pToPlot(plotID,3)}, 'FontSize', 20)
    title('covariation in Extract 1', 'FontSize', 20)
    saveas(gcf, [projdir '/simdata_' tstamp1 '/3dfig_ext1_' num2str(plotID) '_' tstamp1]);
end


%% Estimate the parameters for the second extract. 
[tstamp2, projdir, st] = project_init;
mi2 = mcmc_runsim_v2(tstamp2, projdir, di(2), mcmc_info,...
    'InitialDistribution', 'LHS');

%%  plot stuff 
tstamptouse = tstamp2; 
marray = mcmc_get_walkers({tstamptouse}, {1:ri.nIter}, projdir);
marray2 = marray;
mcmc_plot(marray2, mai.estNames, 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse, 'extrafignamestring', '_extract1');
% mcmc_plot(marray, mi2.namesUnord,'ks', true, 'scatter', false);
% mcmc_plot(marray, mi2.namesUnord,'transparency', 0.05);
titls = {'E2 dT 0.5 dG 10';'E2 dT 0.5 dG 30';'E2 dT 0.5 dG 60'; 
'E2 dT 2 dG 10';'E2 dT 2 dG 30';'E2 dT 2 dG 60';
'E2 dT 8 dG 10';'E2 dT 8 dG 30';'E2 dT 8 dG 60';};
lgds = {};
mvarray2 = masterVecArray(marray2, mai);

% paramMaps accesses the full mastervec (as opposed to just the estimated values)
%  to give the full vector of (unordered) values for a model.
marrayOrd = mvarray2(mi2(1).paramMaps(mi2(1).orderingIx, 1),:,:); 

fhandle = mcmc_trajectories(mi2(1).emo, di(2), mi2(1), marrayOrd, titls, lgds,...
    'SimMode', 'curves', 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse, 'extrafignamestring', '_extract2');
%%
% the 3d saving here is trickier: 6 Choose 3 is 20. So for 2 extracts, there are 40 plots. 
% this is too many. I think I am going to just plot some small subset of the 3-wise plots. 
% in particular, I am interested in the covariation of the two ESPs wrt the CSPs! I do not really 
% care about the covariation within the CSPs. Cool realization!
pToPlot = [5 6 1; 5 6 2;  5 6 3;  5 6 4;];

% I am also mildly curious about the covatiation of the tetR repression system parameters 
% All of these are CSPs. 
pToPlot = [pToPlot; 2 3 4];

% labellist = {'kf' 'kr' 'kc1' 'Pol1' 'kc2' 'Pol2' };
labellist = mai.estNames;
for plotID = 1:size(pToPlot, 1)
    mstacked = marray2(:,:)';
    figure
    XX = mstacked(1:2:end, [pToPlot(plotID,1)]);
    YY = mstacked(1:2:end, [pToPlot(plotID,2)]);
    ZZ = mstacked(1:2:end, [pToPlot(plotID,3)]);
    scatter3(XX,YY,ZZ)
    xlabel(labellist{pToPlot(plotID,1)}, 'FontSize', 20)
    ylabel(labellist{pToPlot(plotID,2)}, 'FontSize', 20)
    zlabel(labellist{pToPlot(plotID,3)}, 'FontSize', 20)
    title('covariation in Extract 2', 'FontSize', 20)
    saveas(gcf, [projdir '/simdata_' tstamp2 '/3dfig_ext2_' num2str(plotID) '_' tstamp2]);
end