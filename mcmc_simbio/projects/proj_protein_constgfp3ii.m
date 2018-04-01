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

mobj = model_protein3;

mcmc_info = mcmc_info_constgfp3ii(mobj);

mi = mcmc_info.model_info;


rkfdG = 5; % nM-1s-1
rkrdG = 300; % s-1
rkcp1 = 0.012; %s-1
rkcp2 = 0.024; %s-1
cpol1 = 100; % nM
cpol2 = 200; % nM


masterVector = log([...
rkfdG 
rkrdG
rkcp1
rkcp2
cpol1
cpol2]);

% supply parameter vectors to this function to generate simulated data. 
di = data_artificial_v2({mobj}, {0:180:7200}, {mi.measuredSpecies}, ...
    {mi.dosedNames}, {mi.dosedVals}, {mi.namesUnord},...
     {exp(masterVector([1:2 3 5])), exp(masterVector([1:2 4 6]))});

da_extract1 = di(1).dataArray;
da_extract2 = di(2).dataArray;
tv = di(1).timeVector;

mcmc_trajectories([], di, [], [], [], [], 'just_data_info', true);

%     Run the MCMC 
ri = mcmc_info.runsim_info;
mai = mcmc_info.master_info;
%%
mi = mcmc_runsim_v2(tstamp, projdir, di, mcmc_info,...
    'InitialDistribution', 'LHS');

%%  plot stuff 
tstamptouse = tstamp; 
marray = mcmc_get_walkers({tstamptouse}, {1:ri.nIter}, projdir);
mcmc_plot(marray([1 2 4], :,:), mai.estNames([1 2 4]), 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse, 'extrafignamestring', '_extract1');
figure
mcmc_plot(marray([1 3 5], :,:), mai.estNames([1 3 5]), 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse, 'extrafignamestring', '_extract2');
titls = {'E1 dG 10';'E1 dG 30';'E1 dG 60';};
lgds = {};
mvarray = masterVecArray(marray, mai);
marrayOrd = mvarray(mi(1).paramMaps(mi(1).orderingIx, 1),:,:);
fhandle = mcmc_trajectories(mi(1).emo, di(1), mi(1), marrayOrd, titls, lgds,...
    'SimMode', 'curves', 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse, 'extrafignamestring', '_extract1');
marrayOrd = mvarray(mi(1).paramMaps(mi(1).orderingIx, 2),:,:);
titls = {'E2 dG 10';'E2 dG 30';'E2 dG 60';};
fhandle = mcmc_trajectories(mi(1).emo, di(2), mi(1), marrayOrd, titls, lgds,...
    'SimMode', 'curves', 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse, 'extrafignamestring', '_extract2');

mstacked = marray(:,:)';



pToPlot = [ 2 4 1 ;]; 
% CSP on the vertical axis to conform to schematics in presentations. 

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
pToPlot = [3 5 1]; 
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








titls = {'dna 1'; 'dna 2';'dna 5'};
lgds = {};
mvarray = masterVecArray(marray, mai);
marrayOrd = mvarray(mi(1).paramMaps(mi(1).orderingIx, 1),:,:);
fhandle = mcmc_trajectories(mi(1).emo, di(1), mi(1), marrayOrd, titls, lgds,...
    'SimMode', 'curves', 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse, 'extrafignamestring', '_extract1');
marrayOrd = mvarray(mi(1).paramMaps(mi(1).orderingIx, 2),:,:);
fhandle = mcmc_trajectories(mi(1).emo, di(2), mi(1), marrayOrd, titls, lgds,...
    'SimMode', 'curves', 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse, 'extrafignamestring', '_extract2');

%%