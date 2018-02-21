%% MCMC toolbox demo - proj_enzymatic_model.m
% Vipul Singhal, 
% California Institute of Technology
% Jan 2018
% 
% In this model we demonstrate the toolbox for the simplest of reactions: 
% 
% E + S <-> C -> E + P
% 
% with simulated data and known true parameters and show that MCMC is able
% to recover these parameters. 
% 

%% initialize the directory where things are stored.
close all
[tstamp, projdir, st] = project_init;

%% We first define the model. This model will be used to generate the data. 
[m, em, mi] = model_enzymatic;

%% import data as a 4D matlab array, along with a time vector
% and the associated dosing information
%
% the data array is of dimensions: 
%
% dim 1: has length (#timepoints)
% dim 2: species
% dim 3: replicates
% dim 4: dosing / ICs
% dim 5: extract (optional)
% NOT a dimension, but separate cells containing similar 5D arrays of data
% corresponding to other models. 

% the following fuction actually generates the artificial data. 
tv =  0:10:1000;
[da] = data_artificial(em, mi,tv, 'replicates', round(3), 'params', [.005; 0.05; 4; 10]);

figure 

    subplot(1,2,1)
    p11 = plot(tv, mean(da(:, 1, :, 1), 3));hold on
    p21 = plot(tv, mean(da(:, 1, :, 2), 3));hold on
    p31 = plot(tv, mean(da(:, 1, :, 3), 3));hold on
    title('P')
    subplot(1,2,2)
    p12 = plot(tv, mean(da(:, 2, :, 1), 3));hold on
    p22 = plot(tv, mean(da(:, 2, :, 2), 3));hold on
    p32 = plot(tv, mean(da(:, 2, :, 3), 3));hold on
    title('E')

%% Set up the MCMC estimation 
% grab the final set of walker positions from the previous run to be the intial points for this run
prevtstamp = '20180116_191759';
finalsimID = '2';
load([pwd '/mcmc_simbio/projects/proj_enzymatic_model/simdata_' prevtstamp '/mcmc' prevtstamp '_ID' finalsimID '.mat'], 'm');
minit = cat(2, m(:,:,end-3),m(:,:,end-2),m(:,:,end-1),m(:,:,end) );

mcmc_runsim_4(tstamp, projdir, tv,da, em, mi, 'userinitialize', minit); %, 'distribution', 'LHS', ', 'width', 0.1width', 0.1, 'userinitialize', minit
%  !TODO what is this: "[tstamps, mfinal] = " ?

%% plot things from the saved files.
tstamp = '20180116_201500'
% load the estimated parameter points. 
finalsimID = '4';
load([pwd ...
    '/mcmc_simbio/projects/proj_enzymatic_model/simdata_' tstamp '/mcmc' tstamp '_ID1.mat'], 'm');

% load(['mcmc' tstamp '_ID' num2str(1)], 'm');
mcat = m;
for i = 2:str2double(finalsimID)
    load([pwd ...
    '/mcmc_simbio/projects/proj_enzymatic_model/simdata_' tstamp '/mcmc' tstamp '_ID' num2str(i)], 'm');
    mcat = cat(3, mcat, m);
end

mstacked = mcat(:,:)';

legendz = {'kf', 'kr', 'kc', 'E_{init}'};
plotChains(mcat, 40, legendz);

figure
ecornerplot_vse(mstacked(1:10:end,:),'scatter', true,...
    'transparency',0.1,...
    'color',[.6 .35 .3], 'names', legendz);
figure
ecornerplot_vse(mstacked(1:10:end,:),...
    'ess', 80,...
    'color',[.6 .35 .3],...
    'names', legendz);
%%




dosingStrat = struct('species', mi.dosednames,...
    'concentrations', {mi.dosedvals});
addpath(genpath(...
    ['/Users/vipulsinghal/Dropbox/Documents/toolbox/txtlsim_vsfork2017/'...
    'mcmc_simbio/projects/']));

load(['full_variable_set_' tstamp]);

fig = plotEstimTraces_ver201801(mcat,em,tv, da,...
   dosingStrat , mi.measuredspecies, 'Visible','on');

% load gong.mat;
% sound(y);
