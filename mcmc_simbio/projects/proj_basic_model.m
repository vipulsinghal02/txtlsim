%% MCMC toolbox demo - proj_basic_model.m
% Vipul Singhal, 
% California Institute of Technology
% December 2017
% 
% In this example, we demonstrate the use of the mcmc toolbox with a simple
% simbiology model of gene expression. In particular, we generate
% artificial data from the model itself, and then use this data to
% investigate a few properties: 
% - Structural identifiability of the model, and how it is a function of
% both the degree of 'excitation' (in this case just how many different DNA
% intial conditions) and observation (in this case which species are
% directly observed. We can do this both with the usual MCMC which uses the
% likelihood function and probabilistic acceptance, and the co opted
% deterministic MCMC, that rejects if the trajectory falls outside some
% distance of the data (L1, L2 or Linfty)
% - The effect of adding noise to the data, and repeating the MCMC
% investication (no longer with the deterministic MCMC. In particular,
% exploring the effect of changing the noise model in MCMC and how the data
% / measurement noise relates to the noise model. 
% - We also use this model to understand a little about the marginal/hyperplane-cut
% shapes of the parameter covariation, especially when some global
% parameters like Ribosome and RNAP conc change. 
% - model reduction - how lit affects all or some of the things above. in
% particular, using hill functions or protein only models. 
% 
% The MCMC Metropolis Hastings routine we use is based on Aslak Grinsted's MATLAB
% implementation of the Goodman and Weare Affine Invariant Ensemble MCMC
% method. More info:
% Goodman and Weare's paper can be found using the DOI: 10.2140/camcos.2010.5.65
% Aslak Grinsted's code: https://github.com/grinsted/gwmcmc
% 
% This work is licensed under the modified BSD license.
%
% The deta
%% initialize the directory where things are stored.
[tstamp, projdir, st] = project_init;

%% We first define the model. This model will be used to generate the data. 

% here we just use a single DNA conc, measure both mRNA and protein, and
% specify the 
% mi = mcmc_info_basic1;


[m, em, mi] = model_basic;

%% import data as a 4D matlab array, along with a time vector
% and the associated dosing information
%
% the 4D data array has dimensions:
% dim 1: has length (#timepoints)
% dim 2: dosing / ICs
% dim 3: extract
% dim 4: species
%
%
% dosed_names is a cell array of strings of size 1 x # dosed species
% dosevals is a # dosed species x # of dosing combinations array of the
% initial values of the doesed variables.

% remove this, and use artificial data in one version and the DSG data 
% in the other. 
[tv , da, dv] = data_basic_model; %import grouped data object

%% specify parameters and species ICs to estimate
% identities of the parameters and species ICs to estimate, and the
% initinal distribution info (= limits in log space, and how to sample the
% initial distribution of the walkers), what the dosing strategy is, what
% the measured species are, what the mcmc parameters are.
mi = mcmc_info_dsg2014;

%% construct simbiology model object(s)
[m, emo ,mi] = model_dsg2014(mi, tv);
%%
load mcmc20171128_130412_ID10
% whos
logp = [ones(14,1); 2;5;5];

figure
[res, residuals, scaledsimdata, scaleddata] = ...
    gen_residuals_3_debug(mstacked(1, :)', em, da, tv, ...
    mi.dosedvals, mi.measuredspecies);
ccol = 2;
rrow = 4;
%         for ccol = 1:2
%             for rrow = 1:4
%                 subplot(4, 2, (rrow-1)*2+ccol)
ssd = scaledsimdata(:,ccol, rrow);
plot(tv, ssd, 'b');
hold on
sdd = scaleddata(:,ccol, rrow);
plot(tv, sdd, ':b');
hold on
rs = residuals(:,ccol, rrow);
plot(tv, rs, 'k');
%             end
%         end

linkdata on
mm = mstacked(1:100:2000, :);
for p = 2:size(mm, 1)
    
    [res, residuals, scaledsimdata, scaleddata] = ...
        gen_residuals_3_debug(mm(p, :)', em, da, tv, ...
        mi.dosedvals, mi.measuredspecies);
    ssd = scaledsimdata(:,ccol, rrow);
    sdd = scaleddata(:,ccol, rrow);
    rs = residuals(:,ccol, rrow);
    tv = tv;
    pause(0.01)
    %         for ccol = 1:2
    %             for rrow = 1:4
    %                 subplot(4, 2, (rrow-1)*2+ccol)
    %                 plot(tv, scaledsimdata(:,ccol, rrow), 'b');
    %                 hold on
    %                 plot(tv, scaleddata(:,ccol, rrow), ':b');
    %                 hold on
    %                 plot(tv, residuals(:,ccol, rrow), 'k');
    %             end
    %         end
    
end
%%
close all
mm = mstacked(1:100:4000, :);
figure
[res, residuals, scaledsimdata, scaleddata] = ...
    gen_residuals_3_debug(mm(1, :)', em, da, tv, ...
    mi.dosedvals, mi.measuredspecies);
ccol = 2;
rrow = 4;

ssd = scaledsimdata(:,ccol, rrow);
plot1 = plot(tv, ssd, 'b');
hold on
sdd = scaleddata(:,ccol, rrow);
plot2 = plot(tv, sdd, ':b');
hold on
rs = residuals(:,ccol, rrow);
plot3 = plot(tv, rs, 'k');

set(plot1, 'XDataSource', 'tv')
set(plot2, 'XDataSource', 'tv')
set(plot3, 'XDataSource', 'tv')

set(plot1, 'YDataSource', 'ssd')
set(plot2, 'YDataSource', 'sdd')
set(plot3, 'YDataSource', 'rs')

for p = 2:size(mm, 1)
    p
    [res, residuals, scaledsimdata, scaleddata] = ...
        gen_residuals_3_debug(mm(p, :)', em, da, tv, ...
        mi.dosedvals, mi.measuredspecies);
    ssd = scaledsimdata(:,ccol, rrow);
    sdd = scaleddata(:,ccol, rrow);
    rs = residuals(:,ccol, rrow);
    tv = tv;
    refreshdata
    drawnow
    pause(0.01)
 
end
%% set up the MCMC estimation
% mcmc_results is a mcmc_results class object.
% mcmc_runsim(tstamp, projdir, tv,da, emo, mi);

%%




