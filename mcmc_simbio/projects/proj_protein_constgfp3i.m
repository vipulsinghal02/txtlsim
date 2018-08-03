%% MCMC toolbox demo - proj_protein_constgfp3i.m
%
% const gfp 3, artificial data, separate, 2 extracts. Check if the CSPs line up exactly. 
% kf fixed
% Vipul Singhal, 
% California Institute of Technology
% 2018

%% initialize the directory where things are stored.
% close all
% clear all
% clc
[tstamp1, projdir, st] = project_init;

%% We first define the model, mcmc_info struct, and the data_info struct. 

mobj = model_protein3;

mcmc_info = mcmc_info_constgfp3i(mobj);

mi = mcmc_info.model_info;

rkfdG = 5; % nM-1s-1
rkrdG = 300; % s-1
rkcp1 = 0.012; %s-1
cpol1 = 100; % nM

masterVector = log([rkfdG 
                    rkrdG
                    rkcp1
                    cpol1]);

di = data_artificial_v2({mobj}, {0:180:7200}, {mi.measuredSpecies}, ...
    {mi.dosedNames}, {mi.dosedVals}, {mi.namesUnord},...
    {exp(masterVector), [exp(masterVector(1:end-2)); 0.024; 200]});

da_extract1 = di(1).dataArray;
da_extract2 = di(2).dataArray;
tv = di(1).timeVector;

mcmc_trajectories([], di, [], [], [], [], 'just_data_info', true);


%     Run the MCMC 
ri = mcmc_info.runsim_info;
mai = mcmc_info.master_info;

% marray = mcmc_get_walkers({'20180311_223247'}, {10}, projdir);
% marray_cut = mcmc_cut(marray, (1:10), flipud((mai.paramRanges)'));
% if size(marray_cut, 2) < ri.nW
%     error('too few initial points');
% elseif size(marray_cut, 2) > ri.nW
%     marray_cut = marray_cut(:,1:ri.nW, :);
% end
%%

mi1 = mcmc_runsim_v2(tstamp1, projdir, di(1), mcmc_info,...
   'InitialDistribution', 'LHS'); % 'InitialDistribution', 'gaussian'
%  'UserInitialize', marray_cut(:,:,end)

%%  plot stuff 
tstamptouse = tstamp1; %'20180311_223247';
marray = mcmc_get_walkers({tstamptouse}, {1:ri.nIter}, projdir);
mcmc_plot(marray, mai.estNames, 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse);
% mcmc_plot(marray, mi1.namesUnord,'ks', true, 'scatter', false);
% mcmc_plot(marray, mi1.namesUnord,'transparency', 0.05);
titls = {'dna 10'; 'dna 30';'dna 60'};
lgds = {};
mvarray1 = masterVecArray(marray, mai);
marrayOrd = mvarray1(mi1.paramMaps(mi1.orderingIx, 1),:,:);
fhandle = mcmc_trajectories(mi1.emo, di(1), mi1, marrayOrd, titls, lgds,...
    'SimMode', 'curves', 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse);
% %% 3D plot
% pToPlot = [2 3 1];
% labellist = mai.estNames;
% for plotID = 1:size(pToPlot, 1)
%     mstacked = marray1(:,:)';
%     figure
%     XX = mstacked(1:2:end, [pToPlot(plotID,1)]);
%     YY = mstacked(1:2:end, [pToPlot(plotID,2)]);
%     ZZ = mstacked(1:2:end, [pToPlot(plotID,3)]);
%     scatter3(XX,YY,ZZ)
%     xlabel(labellist{pToPlot(plotID,1)}, 'FontSize', 20)
%     ylabel(labellist{pToPlot(plotID,2)}, 'FontSize', 20)
%     zlabel(labellist{pToPlot(plotID,3)}, 'FontSize', 20)
%     title('covariation in Extract 1', 'FontSize', 20)
%     saveas(gcf, [projdir '/simdata_' tstamp1 '/3dfig_ext1_' num2str(plotID) '_' tstamp1]);
% end
%     
% 
% mi2 = mcmc_runsim_v2(tstamp2, projdir, di(2), mcmc_info,...
%    'InitialDistribution', 'LHS'); % 'InitialDistribution', 'gaussian'
% %  'UserInitialize', marray_cut(:,:,end)
% 
% %%  plot stuff 
% tstamptouse = tstamp2; %'20180311_223247';
% marray = mcmc_get_walkers({tstamptouse}, {1:ri.nIter}, projdir);
% mcmc_plot(marray, mai.estNames, 'savematlabfig', true, 'savejpeg', true,...
%     'projdir', projdir, 'tstamp', tstamptouse);
% % mcmc_plot(marray, mi1.namesUnord,'ks', true, 'scatter', false);
% % mcmc_plot(marray, mi1.namesUnord,'transparency', 0.05);
% titls = {'dna 10'; 'dna 30';'dna 60'};
% lgds = {};
% mvarray1 = masterVecArray(marray, mai);
% marrayOrd = mvarray2(mi1.paramMaps(mi1.orderingIx, 1),:,:);
% fhandle = mcmc_trajectories(mi2.emo, di(2), mi2, marrayOrd, titls, lgds,...
%     'SimMode', 'curves', 'savematlabfig', true, 'savejpeg', true,...
%     'projdir', projdir, 'tstamp', tstamptouse);
% %% 3D plot
% pToPlot = [2 3 1];
% labellist = mai.estNames;
% for plotID = 1:size(pToPlot, 1)
%     mstacked = marray2(:,:)';
%     figure
%     XX = mstacked(1:2:end, [pToPlot(plotID,1)]);
%     YY = mstacked(1:2:end, [pToPlot(plotID,2)]);
%     ZZ = mstacked(1:2:end, [pToPlot(plotID,3)]);
%     scatter3(XX,YY,ZZ)
%     xlabel(labellist{pToPlot(plotID,1)}, 'FontSize', 20)
%     ylabel(labellist{pToPlot(plotID,2)}, 'FontSize', 20)
%     zlabel(labellist{pToPlot(plotID,3)}, 'FontSize', 20)
%     title('covariation in Extract 2', 'FontSize', 20)
%     saveas(gcf, [projdir '/simdata_' tstamptouse '/3dfig_ext2_' num2str(plotID) '_' tstamptouse]);
% end
    
% marray = mcmc_get_walkers({'20180311_224651'}, {10}, projdir);
% marray_cut = mcmc_cut(marray, (1:10), flipud((mai.paramRanges)'));
% if size(marray_cut, 2) < ri.nW
%     error('too few initial points');
% elseif size(marray_cut, 2) > ri.nW
%     marray_cut = marray_cut(:,1:ri.nW, :);
% end
