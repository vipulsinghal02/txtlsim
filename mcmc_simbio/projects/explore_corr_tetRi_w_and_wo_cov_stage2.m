
% Date: 2018 04 22
% Vipul Singhal, CIT
% DO NOT MODIFY THIS FILE.
%
% This file was copied form 
% 
% and then modified for the tetR1i (tetR1v) model. 
%For step can still use the calibration or the calibrations done with 
% constgfp3ii

% run logs
ts1 = '20180401_151716'; % nessa small i think
ts2 = '20180401_152046'; % lambda small
ts3 = '20180401_190738'; % nessa big 8e4 pts, 40 iter, 1.3 step size,
% 400 walkers, thinning 10
ts4 = '20180401_190814'; % big lambda run on april 1. ran till april 2 afternoon.
% 8e4 pts, 40 iter, 1.3 step size, 400 walkers, thinning 10. iter21 tool
% like 15 hours. everything else was fast
ts5 = '20180402_184027'; % big lambda run
%             nW: 400      stepSize: 1.1000%          nIter: 40
%        nPoints: 40000%       thinning: 10%       parallel: 1
ts6 = '20180402_160013';% nessa big
%          stdev: 1%     tightening: 1%             nW: 400
%       stepSize: 1.0500%          nIter: 40%        nPoints: 40000
%       thinning: 10%       parallel: 1

tstouse = ts6;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CHANGE THIS (step 1 of 2) %%
savestuffflag = false;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

specificprojdir = ['/Users/vipulsinghal/Dropbox/Documents/'...
    'toolbox/txtlsim_vsfork2017/'...
    'mcmc_simbio/projects/proj_protein_constgfp3ii_linux/simdata_' tstouse];

% load mcmc_info and the updated model_info
load([specificprojdir '/full_variable_set_' tstouse], 'mcmc_info', 'mi',...
    'data_info');

projdir = ['/Users/vipulsinghal/Dropbox/Documents/'...
    'toolbox/txtlsim_vsfork2017/'...
    'mcmc_simbio/projects/proj_protein_constgfp3ii_linux'];

ri = mcmc_info.runsim_info;
mai = mcmc_info.master_info;
di = data_info;
%  plot stuff
% tstouse =  tstouse;
marray = mcmc_get_walkers({tstouse}, {1:ri.nIter}, projdir);
marray = marray(:, :, ceil(end/3):end);
mstacked_calib = marray(:, :)';

%% Now we get an arbitrary point from E2 and use those to estimate the CSPs.
% Actually we get 2 points: a truly arbitrary point (with a random seed fixed?),
% and a human picked arbitrary point in one corner of the manifold for E2,
% so that the CSP values come out to one set, and the E1 point in the other
% corner of the corresponding manifold, so that the CSP values needed are
% very different. This should lead to poor performance of the correction
% algorithm.
%
% Can I think of a mean-variance tradeoff idea here? can try to
% see if this is true. Basically if the ESPs are "far" so that the CSP values
% are super different, then the ... nah. not a tradeoff. Thnk more about
% this in the gym later.
%
%

% Picking two truly arbitrary points
% The data is in '20180402_160013'.
RNGseed = rng(42);
mstacked_calib(randperm(length(mstacked_calib), 2), :)
%           {'krdG'}     {'kcp1'}     {'kcp2'}      {'pol1'}    {'pol2'}
% Point 1:   4.5756      -4.7084      -3.8785       4.4917       5.0232
% Point 2:   6.5635       -3.687      -3.4473       4.1489       5.3057
% pick ESP 1 from point 1, and ESP 2 from point 2.

% Picking two diametrically opposite points
% E2:
% "low point" <----- PICK THIS
% X = kcp2 = -3.465
% Y = pol2 = 4.022
% Z = krdG = 4.686
%
% "high point"
% X = kcp2 =-2.288
% Y = pol2 = 4.671
% Z = krdG = 7.764
%
% E1:
%
% "low point"
% X = kcp1 = -4.67
% Y = pol1 = 4.093
% Z = krdG = 4.664
%
% "high point" <----- Pick this
% X = kcp1 = -1.853
% Y = pol1 = 3.052
% Z = krdG = 7.697


% Picking two arbitrary points with CSP fixing. (used to show the
% "solution" of the problem.
% same as above, but no crossing this time:
%       {'krdG'}     {'kcp1'}     {'kcp2'}      {'pol1'}    {'pol2'}
%        4.5756      -4.7084      -3.8785       4.4917       5.0232
%        6.5635       -3.687      -3.4473       4.1489       5.3057 <---
%        actually led to some ill conditioning in the parent file. See
%        april 23 entry in the notability notebook - computational
%        logbook. 

% Pick ESP 1 and 2 from Point 1.
% Can repeat independently for point 2.

% so we build a array with these different parameter sets.
parameterPoints = [...
    4.5756      -4.7084      -3.8785       4.4917       5.0232
    6.5635       -3.687      -3.4473       4.1489       5.3057
    4.686       nan         -3.465          nan         4.022
    7.697       -1.853          nan         3.052       nan];
% {'krdG'}     {'kcp1'}     {'kcp2'}      {'pol1'}    {'pol2'}
% point 1
% point 2
% E2 "Low" point
% E1 "High" point
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CHANGE THIS (step 2 of 2) %%
runsimulation = false;
tstamp_corr_to_use_if_no_sim = '20180423_202018';
extrasavestr = '_tetR1v_st2_cs1_rndpt';
% CASE1
cpol2 = exp(parameterPoints(2, 5));
rkcp2 = exp(parameterPoints(2, 3));
cpol1 = exp(parameterPoints(1, 4));
rkcp1 = exp(parameterPoints(1, 2));

% CASE2
% cpol2 = exp(parameterPoints(3, 5));
% rkcp2 = exp(parameterPoints(3, 3));
% cpol1 = exp(parameterPoints(2, 4));
% rkcp1 = exp(parameterPoints(2, 2));

% CASE3
% cpol2 = exp(parameterPoints(2, 5));
% rkcp2 = exp(parameterPoints(2, 3));
% cpol1 = exp(parameterPoints(2, 4));
% rkcp1 = exp(parameterPoints(2, 2));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



describing_text = '';
% [handles] = helper_cov_gfp3ii_20180422(kcp2, pol2, kcp1, pol1, describing_text);

[tstamp_corr, projdir_corr1, st] = project_init;
mobj_corr1 = model_tetR_repression1; % changed from parent file


mcmc_info_corr1 = mcmc_info_tetR_1v(mobj_corr1, cpol2, rkcp2); % ESP2s

mi_corr1 = mcmc_info_corr1.model_info;

% data_info needs to be redefined, using the true parameters for ESP2s (not
% the ones used in the mcmc_info above)
% the next few lines are from proj_tetR1i.m
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

di = data_artificial_v2({mobj_corr1}, {0:180:7200}, {mi_corr1.measuredSpecies}, ...
    {mi_corr1.dosedNames}, {mi_corr1.dosedVals}, {mi_corr1.namesUnord},...
    {exp(masterVector), [exp(masterVector(1:end-2)); 0.024; 200]});

data_info_corr1 = di(2);

%     Run the MCMC
ri_corr1 = mcmc_info_corr1.runsim_info;
mai_corr1 = mcmc_info_corr1.master_info;
%%
if runsimulation
    mi2_corr1 = mcmc_runsim_v2(tstamp_corr, projdir_corr1, data_info_corr1,...
        mcmc_info_corr1,...
        'InitialDistribution', 'LHS');
    
else
    tstamp_corr = tstamp_corr_to_use_if_no_sim;
    
end


%% Now we plot the 3D distribution of the parameters from the sims above, and
% superimpose the newly computed CSPs on top in a second color.

 projdir_corr1 = ['/Users/vipulsinghal/Dropbox/Documents/toolbox/txtlsim_vsfork2017'...
        '/mcmc_simbio/projects/explore_corr_tetRi_w_and_wo_cov_stage2'];
    specificprojdir = [projdir_corr1 '/simdata_' tstamp_corr];
    
    % load mcmc_info and the updated model_info
    load([specificprojdir '/full_variable_set_' tstamp_corr], 'mcmc_info', 'mi',...
        'data_info');

mi2_corr1 = mi;
ri_corr1 = mcmc_info.runsim_info;
mai_corr1 = mcmc_info.master_info;
data_info_corr1 = data_info;

marray_corr1 = mcmc_get_walkers({tstamp_corr}, {1:ri_corr1.nIter}, projdir_corr1);
marray_corr1 = marray_corr1(:, :, ceil(end/3):end); % take the last 1/3 of the walkers.
% mcmc_plot(marray_corr1, mai.estNames,...
%     'savematlabfig', false, 'savejpeg', false,...
%     'projdir', projdir, 'tstamp', tstamp_corr,...
%     'extrafignamestring', '_extract1');

titls = {'E2 dT 0.5 dG 10';'E2 dT 0.5 dG 30';'E2 dT 0.5 dG 60'; 
'E2 dT 2 dG 10';'E2 dT 2 dG 30';'E2 dT 2 dG 60';
'E2 dT 8 dG 10';'E2 dT 8 dG 30';'E2 dT 8 dG 60';};
lgds = {};
mvarray_corr1 = masterVecArray(marray_corr1, mai_corr1);
marrayOrd_corr1 = mvarray_corr1(mi2_corr1(1).paramMaps(mi2_corr1(1).orderingIx, 1),:,:);
% fhandle = mcmc_trajectories(mi2_corr1(1).emo, data_info_corr1, mi2_corr1(1), marrayOrd_corr1,...
%     titls, lgds,...
%     'SimMode', 'meanstd', 'savematlabfig',savestuffflag, 'savejpeg', savestuffflag,...
%     'projdir', projdir_corr1, 'tstamp', tstamp_corr, 'extrafignamestring',...
%     ['_extract2' extrasavestr]);
fhandle = mcmc_trajectories(mi2_corr1(1).emo, data_info_corr1, mi2_corr1(1), marrayOrd_corr1,...
    titls, lgds,...
    'SimMode', 'meanstd', 'subplot_arrangement', [3, 3], 'savematlabfig',...
    savestuffflag, 'savejpeg', savestuffflag,...
    'projdir', projdir_corr1, 'tstamp', tstamp_corr, 'extrafignamestring',...
    ['_extract2' extrasavestr]);



%% plot the 3D fig, just like in
% explore_corr_gfp3ii_w_and_wo_cov.m
%  close all
% CMU colors by John Kitchin https://github.com/jkitchin
c = @cmucolors;



mstacked = marray(:,:)';
n = 40;
mstacked_corr1  = marray_corr1(:,:)';
nptstotal = size(mstacked_corr1, 1);
paramid2 = randperm(nptstotal, n); % extract 2 points
% 
%% plot the trajectories corresponding to the n picked points
mvarray_corr1 = masterVecArray(marray_corr1, mai_corr1);
marrayOrd_corr1 = mvarray_corr1(mi2_corr1(1).paramMaps(mi2_corr1(1).orderingIx, 1),:,:);

titls = {'E2 dT 0.5 dG 10';'E2 dT 0.5 dG 30';'E2 dT 0.5 dG 60'; 
'E2 dT 2 dG 10';'E2 dT 2 dG 30';'E2 dT 2 dG 60';
'E2 dT 8 dG 10';'E2 dT 8 dG 30';'E2 dT 8 dG 60';};

lgds = {};

fhandle = mcmc_trajectories(mi2_corr1(1).emo, data_info_corr1, mi2_corr1(1), marrayOrd_corr1,...
    titls, lgds,...
    'SimMode', 'meanstd', 'savematlabfig', savestuffflag, 'savejpeg', savestuffflag,...
    'projdir', projdir_corr1, 'subplot_arrangement', [3, 3],...
    'tstamp', tstamp_corr, 'extrafignamestring',...
    ['_extract2_resave' extrasavestr]);

%% Now we pick the Point in E1, and simulate the curves
c = @cmucolors;
mcmc_info_corr2 = mcmc_info_tetR_1v(mobj_corr1, cpol1, rkcp1);
ri_corr2 = mcmc_info_corr2.runsim_info;
mai_corr2 = mcmc_info_corr2.master_info;

mvarray_corr2 = masterVecArray(marray_corr1, mai_corr2);
marrayOrd_corr2 = mvarray_corr2(mi2_corr1(1).paramMaps(mi2_corr1(1).orderingIx, 1),:,:);
% we use mi2_corr1(1).paramMaps(mi2_corr1(1).orderingIx, 1)
% because we do not have mi2_corr2(1).paramMaps(mi2_corr2(1).orderingIx, 1)
% since cor step 2 does not have a runsim step. Hopefully the ordering is
% the same (since this is a constgfp3i and not constgfp3ii type, (corr step
% always is), it should be the same. 

figure

%% simulating this -- looks like the simulations are ill conditioned. 
% need to redo this, but with well conditioned numbers and simulations. 

% fhandle = mcmc_trajectories(mi2_corr1(1).emo, di(1), mi2_corr1(1), marrayOrd_corr2,...
%     titls, lgds,...
%     'SimMode', 'meanstd', 'savematlabfig', savestuffflag,...
%     'savejpeg', savestuffflag,...
%     'projdir', projdir_corr1, 'tstamp', tstamp_corr, 'extrafignamestring',...
%     ['_extract1' extrasavestr]);

titls = {'E1 dT 0.5 dG 10';'E1 dT 0.5 dG 30';'E1 dT 0.5 dG 60'; 
'E1 dT 2 dG 10';'E1 dT 2 dG 30';'E1 dT 2 dG 60';
'E1 dT 8 dG 10';'E1 dT 8 dG 30';'E1 dT 8 dG 60';};

fhandle = mcmc_trajectories(mi2_corr1(1).emo, di(1), mi2_corr1(1), marrayOrd_corr2,...
    titls, lgds,...
    'SimMode', 'meanstd', 'savematlabfig', savestuffflag,...
    'savejpeg', savestuffflag,'subplot_arrangement', [3, 3],...
    'projdir', projdir_corr1, 'tstamp', tstamp_corr, 'extrafignamestring',...
    ['_extract1' extrasavestr]);


hold on
% set(fhandle,'defaultLegendAutoUpdate','off')
% get the axes to plot the additional points into
cc1 = get(fhandle, 'Children');

%