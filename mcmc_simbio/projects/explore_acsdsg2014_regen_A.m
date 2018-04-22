

% We start with importing data and visualizing it.
% the first runs I did on nessa and lambda were timestamps:
close all
clear all
clc

% run logs (important! -- need a better way to log this)
% LAMBDA RUNS (continuous, plot together)
% simdata_20180419_212516 50
% simdata_20180420_131657 80
% simdata_20180421_003808 80
% simdata_20180421_113714 80

% NESSA RUNS (continuous, plot together)
% simdata_20180419_213851 80
% simdata_20180420_084047 120
% simdata_20180421_003308 120

% [mi,mai, ri, tstamp, projdir, di] = proj_acs_dsg2014_regen_A('prevtstamp', tstamp,...
% 'stepSize', 1.10, 'nW', 400, 'nPoints', 4e4, 'thinning', 30,...
% 'nIter', 120, 'parallel', true, 'multiplier', 2, 'stdev', 1);


 
 tstouse_cell = {'20180419_212516', '20180420_131657',...
     '20180421_003808', '20180421_113714'};



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
marray = mcmc_get_walkers(tstouse_cell, {1:50, 1:80, 1:80, 1:80}, projdir);
marray = marray(:, :, ceil(end/3):end);
%%
% mcmc_plot(marray([1 2 4], :,:), mai.estNames([1 2 4]),...
%     'savematlabfig', true, 'savejpeg', true,...
%     'projdir', projdir, 'tstamp', tstouse,...
%     'extrafignamestring', '_extract1');
% 
% figure
% mcmc_plot(marray([1 3 5], :,:), mai.estNames([1 3 5]),...
%     'savematlabfig', true, 'savejpeg', true,...
%     'projdir', projdir, 'tstamp', tstouse,...
%     'extrafignamestring', '_extract2');
% 
% titls = {'E1 dG 10';'E1 dG 30';'E1 dG 60';};
% lgds = {};
% mvarray = masterVecArray(marray, mai);
% marrayOrd = mvarray(mi(1).paramMaps(mi(1).orderingIx, 1),:,:);
% fhandle = mcmc_trajectories(mi(1).emo, di(1), mi(1), marrayOrd,...
%     titls, lgds,...
%     'SimMode', 'meanstd', 'savematlabfig', true, 'savejpeg', true,...
%     'projdir', projdir, 'tstamp', tstouse, 'extrafignamestring',...
%     '_extract1');
% marrayOrd = mvarray(mi(1).paramMaps(mi(1).orderingIx, 2),:,:);
% titls = {'E2 dG 10';'E2 dG 30';'E2 dG 60';};
% fhandle = mcmc_trajectories(mi(1).emo, di(2), mi(1), marrayOrd,...
%     titls, lgds,...
%     'SimMode', 'meanstd', 'savematlabfig', true, 'savejpeg', true,...
%     'projdir', projdir, 'tstamp', tstouse, 'extrafignamestring',...
%     '_extract2');
%

% First without the parameter fixing

% FULL VERSION
% 0. Make figs A B E F. in particular, pick n arbitrary points in the ESP
% sets 1 and 2, and color them and their ESP projections in distinct
% colors. Make the full unpicked manifolds semi-transparent. 
% 1. project the ESPs and make lightly shaded markers for the projected
% sets. to sit in the background from the colored projections. Draw a line from the 
% projected points to the points on the manifold
% 2. For the n points in ESP set 2, estimate the corresponding n CSP sets,
% and in a new fig, visualize them against a background of the full
% manifold from the previous step. Plot the fig showing the data and the fits.
% 
% 3. pick n arbitrary points in ESP1 set and one arbitrary points from each 
% of the n CSP sets, and make a manifild visualization, along with a semi
% transparent true manifild visualization. Show how it doesnt fit. Also
% show the corresponding non fits. 

% SIMPLIFIED EASY VERSION (do first)
% dont do the corr step 1 CSP estimation. since the calib step and the corr
% step are the same, just use those CSP points, and show the non fit. 

% Pick n points in the calibration manifolds
% 


% Next with parameter fixing. 
% again, just do the simple version first:

close all
mstacked = marray(:,:)';
n = 40;
nptstotal = size(mstacked, 1);
paramid1 = randperm(nptstotal, n); % extract 1 points
paramid2 = randperm(nptstotal, n); % extract 2 points

% CSP on the vertical axis to conform to schematics in presentations.
labellist = mai.estNames;

% Do extract 2 first, since this is the correction step 1
pToPlot2 = [3 5 1];
for plotID = 1:size(pToPlot2, 1)
    figure
    XX2 = mstacked(1:end, pToPlot2(plotID,1));
    YY2 = mstacked(1:end, pToPlot2(plotID,2));
    ZZ2 = mstacked(1:end, pToPlot2(plotID,3));
    scatter3(XX2,YY2,ZZ2, 10)
    xlabel(labellist{pToPlot2(plotID,1)}, 'FontSize', 20)
    ylabel(labellist{pToPlot2(plotID,2)}, 'FontSize', 20)
    zlabel(labellist{pToPlot2(plotID,3)}, 'FontSize', 20)
    title('covariation in Extract 2', 'FontSize', 20)
    hold on
    
    XX21 = mstacked(paramid2, pToPlot2(plotID,1));
    YY21 = mstacked(paramid2, pToPlot2(plotID,2));
    ZZ21 = mstacked(paramid2, pToPlot2(plotID,3));
    scatter3(XX21,YY21,ZZ21, 100, 'green', 'filled')
    hold on
    XX22 = mstacked(paramid2, pToPlot2(plotID,1));
    YY22 = mstacked(paramid2, pToPlot2(plotID,2));
    ZZ22 = zeros(n, 1);
    ax1 = scatter3(XX22,YY22,ZZ22, 100, 'green', 'filled');
    view(150,30)
    hold on
    ax1 = scatter3(XX2,YY2,zeros(size(mstacked,1), 1), 10, 'blue', 'filled');
    line([XX21';XX22'], [YY21';YY22'], [ZZ21';ZZ22'], 'LineStyle', '--',...
        'LineWidth', 2, 'color', 'k');
    
    % fit a surface to the scatter data min(XX2)
    [xq,yq] = meshgrid(-4.1:.2:max(XX2), min(YY2):.2:max(YY2));
    vq = griddata(XX2,YY2,ZZ2,xq,yq);
    s2 = surf(xq,yq,vq, 0.2*ones(size(vq)));
    % make the surface translucent
    s2.FaceAlpha = 0.2;
    
    axlims = axis;
    axis([-4.1, axlims(2:end)]);
    %
    view(200, 20)
    saveas(gcf, [projdir '/simdata_' tstouse '/3dfig_ext2_'...
        num2str(plotID) '_' tstouse]);
    % % take the whole thing and rotate - animate it and save the video

    OptionZ.FrameRate=10;OptionZ.Duration=5.5;OptionZ.Periodic=true;
    CaptureFigVid(...
        [[260:-20:160 160*ones(1, 19)] ; [30*ones(1,6),30:-3:18 18:3:57]],...
        'extract2_animation',OptionZ)
    
    
    

end

%% plot the trajectories corresponding to the n picked points
mvarray = masterVecArray(marray, mai);
marrayOrd = mvarray(mi(1).paramMaps(mi(1).orderingIx, 2),:,:);
titls = {'E2 dG 10';'E2 dG 30';'E2 dG 60';};
lgds = {};
fhandle = mcmc_trajectories(mi(1).emo, di(2), mi(1), marrayOrd,...
    titls, lgds,...
    'SimMode', 'meanstd', 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstouse, 'extrafignamestring',...
    '_extract2');
% set(fhandle,'defaultLegendAutoUpdate','off')
% get the axes to plot the additional points into
cc2 = get(fhandle, 'Children');
ax_d10 = cc2(4);
ax_d30 = cc2(2);
ax_d60 = cc2(1);
legend_obj = cc2(3);
set(legend_obj, 'AutoUpdate','off');
marrayOrd_stacked = marrayOrd(:,:)';

[da, idxnotused] = simulatecurves(mi(1).emo,marrayOrd_stacked(paramid2,:), ...
    length(paramid2), mi(1).dosedVals', di(2).timeVector, mi(1).measuredSpecies);

% plot into each of the axes
for i = 1:length(paramid2)
    
    plot(ax_d10, di(2).timeVector, ...
        da(:,1,i,1)+randn(length(di(2).timeVector), 1)*50,...
        'k','LineStyle', ':', 'LineWidth', 0.02);
    axis(ax_d10,[0 7200 -500 10000])
    hold on
    plot(ax_d30, di(2).timeVector,...
        da(:,1,i,2)+randn(length(di(2).timeVector), 1)*100,...
        'k','LineStyle', ':', 'LineWidth', 0.02);
    axis(ax_d30,[0 7200 -500 10000])
    hold on
    
    plot(ax_d60, di(2).timeVector,...
        da(:,1,i,3)+randn(length(di(2).timeVector), 1)*200,...
        'k','LineStyle', ':', 'LineWidth', 0.02);
    axis(ax_d60,[0 7200 -500 10000])
    hold on
    
end



%%


pause(5)
%%

% then do extract 1

pToPlot1 = [ 2 4 1 ;];
for plotID = 1:size(pToPlot1, 1)
    figure
    XX1 = mstacked(1:end, pToPlot1(plotID,1));
    YY1 = mstacked(1:end, pToPlot1(plotID,2));
    ZZ1 = mstacked(1:end, pToPlot1(plotID,3));
    scatter3(XX1,YY1,ZZ1, 10)
    xlabel(labellist{pToPlot1(plotID,1)}, 'FontSize', 20)
    ylabel(labellist{pToPlot1(plotID,2)}, 'FontSize', 20)
    zlabel(labellist{pToPlot1(plotID,3)}, 'FontSize', 20)
    title('covariation in Extract 1', 'FontSize', 20)
    hold on
    
    XX11 = mstacked(paramid1, pToPlot1(plotID,1));
    YY11 = mstacked(paramid1, pToPlot1(plotID,2));
    ZZ11 = mstacked(paramid1, pToPlot1(plotID,3));
    scatter3(XX11,YY11,ZZ11, 100, 'green', 'filled')
    hold on
    XX12 = mstacked(paramid1, pToPlot1(plotID,1));
    YY12 = mstacked(paramid1, pToPlot1(plotID,2));
    ZZ12 = zeros(n, 1);
    ax1 = scatter3(XX12,YY12,ZZ12, 100, 'green', 'filled');
    view(-240,30)
    hold on
    scatter3(XX1,YY1,zeros(size(mstacked,1), 1), 10, 'blue', 'filled');
    line([XX11';XX12'], [YY11';YY12'], [ZZ11';ZZ12'], 'LineStyle', '--',...
        'LineWidth', 2, 'color', 'k');
    
    % also plot the points from extract 2, these are the ones that got used
    % to generate the correction
    ax1 = scatter3(XX11,YY11,ZZ21, 100, 'magenta', 'filled');
    
    
    % fit a surface to the scatter data 
    [xq,yq] = meshgrid(-5.25:.2:max(XX1), min(YY1):.2:max(YY1));
    vq = griddata(XX1,YY1,ZZ1,xq,yq);
    s1 = surf(xq,yq,vq, 0.2*ones(size(vq)));
    % make the surface translucent
    s1.FaceAlpha = 0.2;
    
    axlims = axis;
    axis([-5.25, axlims(2:end)]);
    %
    view(200, 20)
    saveas(gcf, [projdir '/simdata_' tstouse '/3dfig_ext1_'...
        num2str(plotID) '_' tstouse]);
     % take the whole thing and rotate - animate it and save the video

    OptionZ.FrameRate=10;OptionZ.Duration=5.5;OptionZ.Periodic=true;
    veiw_angle_list = [[260:-20:160 160*ones(1, 18)] ; [30*ones(1,6),30:6:72 72:-6:18]];
    CaptureFigVid(...
        veiw_angle_list,...
        'extract1_animation',OptionZ)

%     saveas(gcf, [projdir '/simdata_' tstouse '/3dfig_ext1_'...
%         num2str(plotID) '_' tstouse]);
end
% plot the curves corresponding to the ESPs picked from the E1 and the CSPs
% gotten from E2. 

titls = {'E1 dG 10';'E1 dG 30';'E1 dG 60';};

marrayOrd = mvarray(mi(1).paramMaps(mi(1).orderingIx, 1),:,:);

%%

fhandle = mcmc_trajectories(mi(1).emo, di(1), mi(1), marrayOrd,...
    titls, lgds,...
    'SimMode', 'meanstd', 'savematlabfig', false, 'savejpeg', false,...
    'projdir', projdir, 'tstamp', tstouse, 'extrafignamestring',...
    '_extract1');
% set(fhandle,'defaultLegendAutoUpdate','off')
% get the axes to plot the additional points into
cc1 = get(fhandle, 'Children');

%

ax_d10 = cc1(4);
ax_d30 = cc1(2);
ax_d60 = cc1(1);
legend_obj = cc1(3);
set(legend_obj, 'AutoUpdate','off');
marrayOrd_stacked = marrayOrd(:,:)';

[da, idxnotused] = simulatecurves(mi(1).emo,marrayOrd_stacked(paramid1,:), ...
    length(paramid1), mi(1).dosedVals', di(1).timeVector, mi(1).measuredSpecies);

% plot into each of the axes
for i = 1:length(paramid2)
    
    plot(ax_d10, di(1).timeVector,...
        da(:,1,i,1)+randn(length(di(1).timeVector), 1)*50,...
        'k','LineStyle', ':', 'LineWidth', 0.02);
    axis(ax_d10, [0 7200 -500 10000])
    hold on
    plot(ax_d30, di(1).timeVector,...
        da(:,1,i,2)+randn(length(di(1).timeVector), 1)*100,...
        'k','LineStyle',':', 'LineWidth', 0.02);
    axis(ax_d30,[0 7200 -500 10000])
    hold on,
    
    pp = plot(ax_d60, di(1).timeVector,...
        da(:,1,i,3)+randn(length(di(1).timeVector), 1)*200,...
        'k','LineStyle',':', 'LineWidth', 0.02);
    axis(ax_d60, [0 7200 -500 10000])
    hold on
    
end




