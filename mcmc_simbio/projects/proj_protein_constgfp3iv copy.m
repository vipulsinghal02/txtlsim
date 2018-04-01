%% MCMC toolbox demo - proj_protein_constgfp3iv.m
%
% const gfp 3, 
% artificial data, 
% separate, 2 extracts. 
% Check if the CSPs line up exactly. 
% kf not fixed. 
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

mcmc_info = mcmc_info_constgfp3iv(mobj);

mi = mcmc_info.model_info;

di = data_artificial_v2({mobj}, {0:10:1000}, {mi.measuredSpecies}, ...
    {mi.dosedNames}, {mi.dosedVals}, {mi.namesUnord},...
    {[0.5; 100;20;10], [0.5; 100;40;20]});

da_extract1 = di(1).dataArray;
da_extract2 = di(2).dataArray;
tv = di(1).timeVector;

%% convert this section into a data visualization function. 
figure 
    subplot(1,2,1)
    p11 = plot(tv, mean(da_extract1(:, 1, :, 1), 3),...
        'LineWidth', 2.5);hold on % dose 1
    p21 = plot(tv, mean(da_extract1(:, 1, :, 2), 3),...
        'LineWidth', 2.5);hold on % dose 2
    p31 = plot(tv, mean(da_extract1(:, 1, :, 3), 3),...
        'LineWidth', 2.5);hold on % dose 3
    xlabel('Time, (a.u.)', 'FontSize', 16)
    ylabel('Protein conc, (a.u.)', 'FontSize', 16)
    title('Extract 1, artificial data', 'FontSize', 16)
    axis([0 1000 0 14000])
    subplot(1,2,2)
    p12 = plot(tv, mean(da_extract2(:, 1, :, 1), 3),...
        'LineWidth', 2.5);hold on
    p22 = plot(tv, mean(da_extract2(:, 1, :, 2), 3),...
        'LineWidth', 2.5);hold on
    p32 = plot(tv, mean(da_extract2(:, 1, :, 3), 3),...
        'LineWidth', 2.5);hold on
    title('Extract 2, artificial data', 'FontSize', 16)
    xlabel('Time, (a.u.)', 'FontSize', 16)
    ylabel('Protein conc, (a.u.)', 'FontSize', 16)
    axis([0 1000 0 14000])
    legend({'D_{init} = 1 (a.u.)', 'D_{init} = 2', 'D_{init} = 5'},...
        'FontSize', 14,...
        'Location', 'NorthWest')
%%
%     Run the MCMC 
ri = mcmc_info.runsim_info;
mai = mcmc_info.master_info;

%%
mi = mcmc_runsim_v2(tstamp, projdir, di, mcmc_info,...
    'InitialDistribution', 'LHS');

%%  plot stuff 
tstamptouse = tstamp; 
marray = mcmc_get_walkers({tstamptouse}, {1:ri.nIter}, projdir);
mcmc_plot(marray([1 2 3 4], :,:), mi.namesUnord, 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse, 'extrafignamestring', '_extract1');
mcmc_plot(marray([1 2 5 6], :,:), mi.namesUnord, 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse, 'extrafignamestring', '_extract2');
% mcmc_plot(marray, mi1.namesUnord,'ks', true, 'scatter', false);
% mcmc_plot(marray, mi1.namesUnord,'transparency', 0.05);
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

%% the 3d saving here is trickier: 4 C 3 is 4. So for 2 extracts, there are 8 plots. 
pToPlot = [1 2 3; 1 2 4; 1 3 4; 2 3 4];
% labellist = {'kf' 'kr' 'kc1' 'Pol1' 'kc2' 'Pol2' };
labellist = mai.estNames;
for plotID = 1:size(pToPlot, 1)
    mstacked = mvarray(:,:)';
    figure
    XX = mstacked(1:2:end, [pToPlot(plotID,1)]);
    YY = mstacked(1:2:end, [pToPlot(plotID,2)]);
    ZZ = mstacked(1:2:end, [pToPlot(plotID,3)]);
    scatter3(XX,YY,ZZ)
    xlabel(labellist{pToPlot(plotID,1)}, 'FontSize', 20)
    ylabel(labellist{pToPlot(plotID,2)}, 'FontSize', 20)
    zlabel(labellist{pToPlot(plotID,3)}, 'FontSize', 20)
    title('covariation in Extract 1', 'FontSize', 20)
    saveas(gcf, [projdir '/simdata_' tstamp '/3dfig_ext1_' num2str(plotID) '_' tstamp]);
end

pToPlot = [1 2 5; 1 2 6; 1 5 6; 2 5 6];
for plotID = 1:size(pToPlot, 1)
    mstacked = mvarray(:,:)';
    figure
    XX = mstacked(1:2:end, [pToPlot(plotID,1)]);
    YY = mstacked(1:2:end, [pToPlot(plotID,2)]);
    ZZ = mstacked(1:2:end, [pToPlot(plotID,3)]);
    scatter3(XX,YY,ZZ)
    xlabel(labellist{pToPlot(plotID,1)}, 'FontSize', 20)
    ylabel(labellist{pToPlot(plotID,2)}, 'FontSize', 20)
    zlabel(labellist{pToPlot(plotID,3)}, 'FontSize', 20)
    title('covariation in Extract 2', 'FontSize', 20)
    saveas(gcf, [projdir '/simdata_' tstamp '/3dfig_ext2_' num2str(plotID) '_' tstamp]);
end
