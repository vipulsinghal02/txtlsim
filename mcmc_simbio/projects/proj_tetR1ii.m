%% MCMC toolbox demo - proj_protein_constgfp3i.m
%
% const gfp 3, artificial data, separate, 2 extracts. Check if the CSPs line up exactly. 
% 
% Vipul Singhal, 
% California Institute of Technology
% 2018

%% initialize the directory where things are stored.
% close all
% clear all
% clc
[tstamp, projdir, st] = project_init;

%% We first define the model, mcmc_info struct, and the data_info struct. 

mobj = model_tetR_repression1;

mcmc_info = mcmc_info_tetR_1ii(mobj);

mi = mcmc_info.model_info;

rkfdG = 5; % nM-1s-1
rkrdG = 300; % s-1
rkfdT = 5;
rkrdT = 300;
rkfdimTet = 20; % nM-1s-1
rkrdimTet = 10; % s-1
rkfseqTet = 20; % nM-1s-1
rkrseqTet = 10; % s-1
rkcp1 = 0.012; %s-1
rkcp2 = 0.024; %s-1
cpol1 = 100; % nM
cpol2 = 200; % nM
activeNames = ...
    {'kfdG';    'krdG';    'kfdT';    'krdT';    'kfdimTet';    'krdimTet';    'kfseqTet';...
    'krseqTet';    'kcp';    'pol'};

masterVector = log([...
rkfdG ;rkrdG;rkfdT;rkrdT;rkfdimTet;rkrdimTet;rkfseqTet;rkrseqTet;rkcp1;rkcp2;cpol1;cpol2]);

di = data_artificial_v2({mobj}, {0:180:7200}, {mi.measuredSpecies}, ...
    {mi.dosedNames}, {mi.dosedVals}, {mi.namesUnord},...
    {exp(masterVector([1:9 11])), exp(masterVector([1:8 10 12]))});

da_extract1 = di(1).dataArray;
da_extract2 = di(2).dataArray;
tv = di(1).timeVector;
mcmc_trajectories([], di, [], [], [], [], 'just_data_info', true);
%     Run the MCMC 
ri = mcmc_info.runsim_info;
mai = mcmc_info.master_info;
mi = mcmc_runsim_v2(tstamp, projdir, di, mcmc_info,...
    'InitialDistribution', 'LHS');

%%  plot stuff 
close all
tstamptouse = tstamp; 
marray = mcmc_get_walkers({tstamptouse}, {8:ri.nIter}, projdir);
mcmc_plot(marray([1:4 5 7], :,:), mai.estNames([1:4 5 7]), 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse, 'extrafignamestring', '_extract1');
figure
mcmc_plot(marray([1:4 6 8], :,:), mai.estNames([1:4 6 8]), 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse, 'extrafignamestring', '_extract2');
titls = {'E1 dT 0.5 dG 10';'E1 dT 0.5 dG 30';'E1 dT 0.5 dG 60'; 
'E1 dT 2 dG 10';'E1 dT 2 dG 30';'E1 dT 2 dG 60';
'E1 dT 8 dG 10';'E1 dT 8 dG 30';'E1 dT 8 dG 60';};
lgds = {};
mvarray = masterVecArray(marray, mai);
marrayOrd = mvarray(mi(1).paramMaps(mi(1).orderingIx, 1),:,:);
fhandle = mcmc_trajectories(mi(1).emo, di(1), mi(1), marrayOrd, titls, lgds,...
    'SimMode', 'curves', 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse, 'extrafignamestring', '_extract1');
marrayOrd = mvarray(mi(1).paramMaps(mi(1).orderingIx, 2),:,:);
titls = {'E2 dT 0.5 dG 10';'E2 dT 0.5 dG 30';'E2 dT 0.5 dG 60'; 
'E2 dT 2 dG 10';'E2 dT 2 dG 30';'E2 dT 2 dG 60';
'E2 dT 8 dG 10';'E2 dT 8 dG 30';'E2 dT 8 dG 60';};
fhandle = mcmc_trajectories(mi(1).emo, di(2), mi(1), marrayOrd, titls, lgds,...
    'SimMode', 'curves', 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse, 'extrafignamestring', '_extract2');

%% 3D plot
% the 3d saving here is trickier: 6 Choose 3 is 20. So for 2 extracts, there are 40 plots. 
% this is too many. I think I am going to just plot some small subset of the 3-wise plots. 
% in particular, I am interested in the covariation of the two ESPs wrt the CSPs! I do not really 
% care about the covariation within the CSPs. Cool realization!

% mstacked = mvarray(:,:)'; % <---- THIS IS WRONG! use:
mstacked = marray(:,:)';


pToPlot = [ 5  7 1 ; 5 7 2 ; 5 7 3 ; 5 7 4 ;]; 
% CSP on the vertical axis to conform to schematics in presentations. 

% I am also mildly curious about the covatiation of the tetR repression system parameters 
% All of these are CSPs. 
pToPlot = [pToPlot; 2 3 4];
labellist = mai.estNames;
for plotID = 1:size(pToPlot, 1)
    figure
    XX = mstacked(1:end, [pToPlot(plotID,1)]);
    YY = mstacked(1:end, [pToPlot(plotID,2)]);
    ZZ = mstacked(1:end, [pToPlot(plotID,3)]);
    scatter3(XX,YY,ZZ)
    xlabel(labellist{pToPlot(plotID,1)}, 'FontSize', 20)
    ylabel(labellist{pToPlot(plotID,2)}, 'FontSize', 20)
    zlabel(labellist{pToPlot(plotID,3)}, 'FontSize', 20)
    title('covariation in Extract 1', 'FontSize', 20)
    saveas(gcf, [projdir '/simdata_' tstamptouse '/3dfig_ext1_' num2str(plotID) '_' tstamptouse]);
end
%
pToPlot = [6 8 1; 6 8 2 ; 6 8 3; 6 8 4;]; 
for plotID = 1:size(pToPlot, 1)
    figure
    XX = mstacked(1:end, [pToPlot(plotID,1)]);
    YY = mstacked(1:end, [pToPlot(plotID,2)]);
    ZZ = mstacked(1:end, [pToPlot(plotID,3)]);
    scatter3(XX,YY,ZZ)
    xlabel(labellist{pToPlot(plotID,1)}, 'FontSize', 20)
    ylabel(labellist{pToPlot(plotID,2)}, 'FontSize', 20)
    zlabel(labellist{pToPlot(plotID,3)}, 'FontSize', 20)
    title('covariation in Extract 2', 'FontSize', 20)
    saveas(gcf, [projdir '/simdata_' tstamptouse '/3dfig_ext2_' num2str(plotID) '_' tstamptouse]);
end



