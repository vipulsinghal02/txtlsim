%% MCMC toolbox demo
% Vipul Singhal, California Institute of Technology
% 2017
% We demonstrate the use of the MCMC estimation capabilities of the txtl
% modeling toolbox here. We set up an estimation problem with
% constitutively expressed GFP in TXTL at different DNA concentrations. 
% 
% 
% The MCMC Metropolis Hastings routine based on Aslak Grinsted's MATLAB
% implementation of the Goodman and Weare Affine Invariant Ensemble MCMC
% method. More info: 
% Goodman and Weare's paper can be found using the DOI: 10.2140/camcos.2010.5.65 
% Aslak Grinsted's code: https://github.com/grinsted/gwmcmc

%% initialize the directory where things are stored. 
fn = mfilename;
mcmc_init(fn);
clear fn
%% import data as a grouped data object, and get the experiment map
% data_info is a data_info class obect. 
% grouped data has info on the independent variable, the dependent
% variable, and the doses. 
gd= mcmc_import_data('dsg2014_d1'); %import grouped data object
% !TODO add a data_info class with matadata info about the data. like
% platereader, date, gain settings, normalization, input output data etc. 

%% construct simbiology model object(s)
m = mcmc_import_model('dsg2014_m1');
%% specify parameters and species ICs to estimate
% identities of the parameters and species ICs to estimate, and the
% initinal distribution info (= limits in log space, and how to sample the 
% initial distribution of the walkers)
est_info = mcmc_est_info('dsg2014_m1_est1');
% est_info class object, along with the parameters to estimate, it also
% specifies what the mcmc hyper parameters like stepsize, number of
% walkers, number of samples, chain thinning, parallelization info, how
% much to break the simulation up, the pause times between breaks (to help
% the machine stay cool, simulation tolerance info)
%% Define SimBiology model components' roles
% setup the response map, the dose map, the parameters to be estimated
model_map = mcmc_model_map('dsg2014_map1');

%% set up the prior and the likelihood functions
logprior = mcmc_logprior(est_info);
loglike = mcmc_loglike(est_info, m, gd, model_map);

%% set up the MCMC estimation
% mcmc_results is a mcmc_results class object. 
mcmcResults = mcmc_runsim(est_info, {logprior, loglike});

%% plot things and save the data. 
mcmc_plot(mcmcResults);
mcmc_save(mcmcResults);

