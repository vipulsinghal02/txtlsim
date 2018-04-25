

% We start with importing data and visualizing it.
% the first runs I did on nessa and lambda were timestamps:
close all
clear all
clc

% run logs (important! -- need a better way to log this)
% LAMBDA RUNS (continuous, plot together) <----- BUG in measuredSpecies in
% mcmc_info
% simdata_20180419_212516 50
% simdata_20180420_131657 80
% simdata_20180421_003808 80
% simdata_20180421_113714 80

% NESSA RUNS (continuous, plot together) <----- BUG in measuredSpecies in
% mcmc_info
% simdata_20180419_213851 80
% simdata_20180420_084047 120
% simdata_20180421_003308 120


%%%%%%%%%%%%%%%% RESTARTING RUNS
% LAMBDA:
% 'stepSize', 2.25,'nW', 400,'nPoints',4e4,'thinning', 20,'nIter', 60, 'stdev', 2
% 'simdata_20180421_224847'
% Simulation Parameters are: 
% path: /home/vsinghal/MBCMCMC/txtlsim_vsfork2017/mcmc_simbio/projects/proj_acs_dsg2014_regen_A 
% stdev: 2.0 
% number of walkers: 400 
% step size:2.25 
% tightening: 1.00 
% number of repeats: 60 
% thinning: 20 
% points per iter: 40000 

% NESSA:
% 'stepSize', 1.60, 'nW', 400, 'nPoints', 4e4, 'thinning', 20,'nIter', 120,
% 'multiplier', 2, 'stdev', 3 'simdata_20180421_212747'
% Simulation Parameters are: 
% path: /home/vsinghal/mcmc/txtlsim/mcmc_simbio/projects/proj_acs_dsg2014_regen_A 
% stdev: 3.0 
% number of walkers: 400 
% step size:1.60 
% tightening: 1.00 
% number of repeats: 120 
% thinning: 20 
% points per iter: 40000 


 tstouse_cell = {'20180421_212747'};

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
marray_unord = mcmc_get_walkers(tstouse_cell, {1:120}, projdir);
marray_end_unord = marray_unord(:, :, ((end-30):5:end));
marray_end_thinned_unord = marray_end_unord(:, 1:10:end,:);
marray_initial_unord = marray_unord(:, :, 1:2);

pnamelist_unord = {'X_e', '\tau', 'p_{Kd}', 'p_F', 'X_{ter}', 'N_{K1}',...
    'N_{F1}',  'N_{K2}' 'N_{F2}', '\delta_{K}', ' \delta_F', '\delta_{c}', ...
    'pol', '\delta', 'L_e', 'UTR_{K}', 'UTR_F', 'AA_{K}', 'AA_F', 'Latp_{K}', ...
    'Latp_{F}', 'L_{ter}', 'rib'};
[num2cell((1:23)') pnamelist_unord']
reordering = [13 1 3 4 6 7 8 9 5 23 15 16 17 18 19 20 21 22 14 10 11 12 2];
pnamelist = pnamelist_unord(reordering);


marray = marray_unord(reordering, :,:);
marray_end = marray_end_unord(reordering, :,:);
marray_end_thinned = marray_end_thinned_unord(reordering, :,:);
marray_initial = marray_initial_unord(reordering, :,:);
marray_thinned = marray(:,1:40:end, :);
%
    %% plot the first 12 parameters, for the final distributions
    pIXtoPlot = [{1:9};
        {10:18};
        {19:23};];
    pIX_saveNames = {'TXonly', 'TLonly', 'RNAdeg_tau'};
    
    svflag = true;
    %%
    close all
    for ii = 1:size(pIXtoPlot, 1)
        % final distributions
        mcmc_plot(marray_end(pIXtoPlot{ii}, :, :), pnamelist(pIXtoPlot{ii})',...
            'savematlabfig', svflag, 'savejpeg', svflag,...
            'projdir', projdir, 'tstamp', tstouse_cell{1},...
            'extrafignamestring', [pIX_saveNames{ii} '_final'],...
            'support', mai.paramRanges(reordering(pIXtoPlot{ii}), :)');
%         
%         % initial distributions
        mcmc_plot(marray_initial(pIXtoPlot{ii}, :, :), pnamelist(pIXtoPlot{ii})',...
            'savematlabfig', svflag, 'savejpeg', svflag,...
            'projdir', projdir, 'tstamp', tstouse_cell{1},...
            'extrafignamestring', [pIX_saveNames{ii} 'initial'],...
            'support', mai.paramRanges(reordering(pIXtoPlot{ii}), :)');
%         
%         % plot the whole chain, but a bit thinned out (~100X less points)
        mcmc_plot(marray(pIXtoPlot{ii}, 1:10:end, 1:10:end), pnamelist(pIXtoPlot{ii})',...
            'savematlabfig', svflag, 'savejpeg', svflag,...
            'projdir', projdir, 'tstamp', tstouse_cell{1},...
            'extrafignamestring', [pIX_saveNames{ii} 'wholechain_thinned'],...
            'support', mai.paramRanges(reordering(pIXtoPlot{ii}), :)');
    end
%     
%%
mcmc_plot(marray_thinned, pnamelist',...
    'savematlabfig', svflag, 'savejpeg', svflag,...
    'projdir', projdir, 'tstamp', tstouse_cell{1},...
    'extrafignamestring', 'all_txtl_params_wholecahin_thinned',...
    'support', mai.paramRanges(reordering, :)');

% 
% %%
%%
mcmc_plot(marray_end_thinned, pnamelist',...
    'savematlabfig', svflag, 'savejpeg', svflag,...
    'projdir', projdir, 'tstamp', tstouse_cell{1},...
    'extrafignamestring', 'all_txtl_params_final',...
    'support', mai.paramRanges(reordering, :)');
%%
figure
mcmc_plot(marray_initial, pnamelist,...
    'savematlabfig', svflag, 'savejpeg', svflag,...
    'projdir', projdir, 'tstamp', tstouse_cell{1},...
    'extrafignamestring', 'all_txtl_params_initial',...
    'support', mai.paramRanges(reordering, :)');

%% now we plot the trajectories

lgds = {};
mvarray = masterVecArray(marray_unord, mai); 
% be sure to use the unordered marray here. the ordering above is purely 
% for visually grouping parameters

% first we plot the RNA deg data (purified MG aptamer). ie, model_info(1)
marrayOrd = mvarray(mi(1).paramMaps(mi(1).orderingIx, 1),:,:);
%
titlz = {};
dn = mi(1).dosedNames;
dv = mi(1).dosedVals;
% clear newcell
newcell = '';
lgds = {};
for i = 1:size(mi(1).dosedVals, 2) % dose combos, each combo is a title
    
    for j = 1:size(mi(1).dosedVals, 1)-1 % dosed species, all the species inform each title
        newcell= [newcell dn{j} ' = ' num2str(dv(j, i)) ', '];
    end
    if size(mi(1).dosedVals, 1) == 1
        newcell = [dn{1} ' = ' num2str(dv(1, i))];
    else
        newcell= [newcell dn{j+1} ' = ' num2str(dv(j+1, i))];
    end
    
    titlz = [titlz; {newcell}];
end
%
fhandle = mcmc_trajectories(mi(1).emo, di(mi(1).dataToMapTo), mi(1), marrayOrd,...
    titlz, lgds,...
    'SimMode', 'meanstd', 'savematlabfig', false, 'savejpeg', false,...
    'projdir', projdir, 'tstamp', tstouse_cell{1}, 'extrafignamestring',...
    '_rnadeg_ACSDSG2014');
%
% next we plot the mg aptamer and protein data  ie, model_info(2)
mvarray = masterVecArray(marray_unord, mai); 
% be sure to use the unordered marray here. the ordering above is purely 
% for visually grouping parameters

% first we plot the RNA deg data (purified MG aptamer). ie, model_info(1)
marrayOrd = mvarray(mi(2).paramMaps(mi(2).orderingIx, 1),:,:);
%

dn = mi(2).dosedNames;
dv = mi(2).dosedVals;
titlz = cell(size(dv, 2), 1, length(mi(2).measuredSpecies));
% clear newcell
newcell = '';
lgds = {};
for i = 1:size(dv, 2) % dose combos, each combo is a title
    
    for j = 1:size(dv, 1)-1 % dosed species, all the species inform each title
        newcell= [newcell dn{j} ' = ' num2str(dv(j, i)) ', '];
    end
    if size(dv, 1) == 1
        newcell = [dn{1} ' = ' num2str(dv(1, i))];
    else
        newcell= [newcell dn{j+1} ' = ' num2str(dv(j+1, i))];
    end
    
    titlz{i, 1, 1} = ['MGa conc (nM), ' newcell];
    titlz{i, 1, 2} = ['deGFP conc (nM), ' newcell];
end

%
fhandle = mcmc_trajectories(mi(2).emo, di(mi(2).dataToMapTo), mi(2), marrayOrd,...
    titlz, lgds,...
    'SimMode', 'meanstd', 'savematlabfig', false, 'savejpeg', false,...
    'projdir', projdir, 'tstamp', tstouse_cell{1}, 'extrafignamestring',...
    '_mga_deGFP_ACSDSG2014');
