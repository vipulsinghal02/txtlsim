%% MCMC toolbox demo
% Vipul Singhal, California Institute of Technology
% 2017
% We demonstrate the use of the MCMC estimation capabilities of the txtl
% modeling toolbox here. We set up an estimation problem with
% constitutively expressed GFP in TXTL at different DNA concentrations. 
% 
% The MCMC Metropolis Hastings routine based on Aslak Grinsted's MATLAB
% implementation of the Goodman and Weare Affine Invariant Ensemble MCMC
% method. More info: 
% Goodman and Weare's paper can be found using the DOI: 10.2140/camcos.2010.5.65 
% Aslak Grinsted's code: https://github.com/grinsted/gwmcmc

%% initialize the directory where things are stored. 
[tstamp, projdir, st] = project_init;

%% import data as a 4D matalb array, along with a time vector
% and the associated dosing information
%
% the 4D data array has dimensions:
% dim 1: has length (#timepoints) 
% dim 2: dosing / ICs
% dim 3: extract
% dim 4: species 
%
% the time vector has units seconds
% 
% dosed_names is a cell array of strings of size 1 x # dosed species
% dosevals is a # dosed species x # of dosing combinations array of the
% initial values of the doesed variables. 
[tv , da, dv] = data_dsg2014; %import grouped data object


%% specify parameters and species ICs to estimate
% identities of the parameters and species ICs to estimate, and the
% initinal distribution info (= limits in log space, and how to sample the 
% initial distribution of the walkers), what the dosing strategy is, what
% the measured species are, what the mcmc parameters are. 
mi = mcmc_info_dsg2014;

%% construct simbiology model object(s)
[m, emo ,mi] = model_dsg2014(mi, tv);

%% set up the MCMC estimation
% mcmc_results is a mcmc_results class object. 
[tstamps, mfinal] = mcmc_runsim(tstamp, projdir, tv,da, emo, mi);

%% 




