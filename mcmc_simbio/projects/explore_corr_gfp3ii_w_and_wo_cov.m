% in this file we demonstrate the effects of covariaion on the
% correction problem.

% We start with importing data and visualizing it.
% the first runs I did on nessa and lambda were timestamps:
close all
clear all
clc

ts1 = '20180401_151716'; % nessa small i think 
ts2 = '20180401_152046'; % lambda small
ts3 = '20180401_190738'; % nessa big 8e4 pts, 40 iter, 1.3 step size, 
% 400 walkers, thinning 10
ts4 = '20180401_190814'; % big lambda run on april 1. ran till april 2 afternoon. 
% 8e4 pts, 40 iter, 1.3 step size, 400 walkers, thinning 10. iter21 tool
% like 15 hours. everything else was fast
ts5 = '20180402_184027'; % big lambda run on april 1. ran till april 2 afternoon. 
% 8e4 pts, 40 iter, 1.3 step size, 400 walkers, thinning 10. iter21 tool
% like 15 hours. everything else was fast
tstouse = ts5;

 mi = proj_protein_constgfp3ii_linux('prevtstamp', '20180402_184027',...
     'stepSize', 1.1, 'nW', 400, 'nPoints', 2e4, 'thinning', 10,...
     'nIter', 80, 'parallel', true, 'multiplier', 2);

specificprojdir = ['/Users/vipulsinghal/Dropbox/Documents/'...
    'toolbox/txtlsim_vsfork2017/'...
    'mcmc_simbio/projects/proj_protein_constgfp3ii_linux/simdata_' tstouse];

% load mcmc_info and the updated model_info
load([specificprojdir '/full_variable_set_' tstouse], 'mcmc_info', 'mi',...
    'data_info');
%%
projdir = ['/Users/vipulsinghal/Dropbox/Documents/'...
    'toolbox/txtlsim_vsfork2017/'...
    'mcmc_simbio/projects/proj_protein_constgfp3ii_linux'];
ri = mcmc_info.runsim_info;
mai = mcmc_info.master_info;
di = data_info;
%%  plot stuff
tstamptouse = ts1;
marray = mcmc_get_walkers({tstouse}, {1:ri.nIter}, projdir);
marray = marray(:, :, ceil(end/4):end);
mcmc_plot(marray([1 2 4], :,:), mai.estNames([1 2 4]),...
    'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse,...
    'extrafignamestring', '_extract1');

figure
mcmc_plot(marray([1 3 5], :,:), mai.estNames([1 3 5]),...
    'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse,...
    'extrafignamestring', '_extract2');

titls = {'E1 dG 10';'E1 dG 30';'E1 dG 60';};
lgds = {};
mvarray = masterVecArray(marray, mai);
marrayOrd = mvarray(mi(1).paramMaps(mi(1).orderingIx, 1),:,:);
fhandle = mcmc_trajectories(mi(1).emo, di(1), mi(1), marrayOrd,...
    titls, lgds,...
    'SimMode', 'curves', 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse, 'extrafignamestring',...
    '_extract1');
marrayOrd = mvarray(mi(1).paramMaps(mi(1).orderingIx, 2),:,:);
titls = {'E2 dG 10';'E2 dG 30';'E2 dG 60';};
fhandle = mcmc_trajectories(mi(1).emo, di(2), mi(1), marrayOrd,...
    titls, lgds,...
    'SimMode', 'curves', 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse, 'extrafignamestring',...
    '_extract2');

mstacked = marray(:,:)';

pToPlot = [ 2 4 1 ;];
% CSP on the vertical axis to conform to schematics in presentations.

labellist = mai.estNames;
for plotID = 1:size(pToPlot, 1)
    figure
    XX = mstacked(1:end, pToPlot(plotID,1));
    YY = mstacked(1:end, pToPlot(plotID,2));
    ZZ = mstacked(1:end, pToPlot(plotID,3));
    scatter3(XX,YY,ZZ)
    xlabel(labellist{pToPlot(plotID,1)}, 'FontSize', 20)
    ylabel(labellist{pToPlot(plotID,2)}, 'FontSize', 20)
    zlabel(labellist{pToPlot(plotID,3)}, 'FontSize', 20)
    title('covariation in Extract 1', 'FontSize', 20)
    saveas(gcf, [projdir '/simdata_' tstamptouse '/3dfig_ext1_'...
        num2str(plotID) '_' tstamptouse]);
end
%
pToPlot = [3 5 1];
for plotID = 1:size(pToPlot, 1)
    figure
    XX = mstacked(1:end, pToPlot(plotID,1));
    YY = mstacked(1:end, pToPlot(plotID,2));
    ZZ = mstacked(1:end, pToPlot(plotID,3));
    scatter3(XX,YY,ZZ)
    xlabel(labellist{pToPlot(plotID,1)}, 'FontSize', 20)
    ylabel(labellist{pToPlot(plotID,2)}, 'FontSize', 20)
    zlabel(labellist{pToPlot(plotID,3)}, 'FontSize', 20)
    title('covariation in Extract 2', 'FontSize', 20)
    saveas(gcf, [projdir '/simdata_' tstamptouse '/3dfig_ext2_'...
        num2str(plotID) '_' tstamptouse]);
end


%% Now we shall perform a correction of the calibration data itself,
% with and without the parameter fixing. 

%% First without the parameter fixing
% 1. project the ESPs 
% 2. pick arbitrary points in the ESP 2 set, and estimate the CSP
% 3. pick arbitrary point in ESP1 set and arbitrary point in CSP set and 
% generate prediction. 
% 4. 




