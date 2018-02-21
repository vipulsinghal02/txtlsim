function mi = mcmc_info_basic
% This file contains the info on 
% - which parameters in the model get estimated
% - what the dosing strategy is for the model
% - and how the dosing strategy corresponds to the dataset
% - which species in the model are measured (multiple species might get
% summed)
% - how these species correspond to the dataset 
% what the initial distribution of the walkers is, and other mcmc
% parameters like how many steps, the thinning, the stdev, the number of
% sub simulations to break things up into, the ranges where the parameters
% are allowed to exist ie the prior distribution
% 


estNames = {'kPDr'
    'kTX'
    'kmRr'
    'kTL'
    'kGd'
    'kmd'
    'P' 
    'R'};
paramranges = log([0.5 50
    0.005 5
    0.5 50
    0.005 5
    0.005 5
    0.005 5
    0.1 500
    0.1 500]);

dosedNames = {'D'}; %to be really sneaky, can try to dose mrna as well. 
% Fairly intractable experimentally though.  

dosedVals = [1]; % variations include multiple concentrations: 
% [0.5, 1], [0.1, 1, 10], [0.1, 1, 10, 100] and a study of how 
% identifiability changes with these variations. 

measuredSpecies = {{'m', 'mR'}, 'G'}; % the first species is a sum of the 
% ribosome bound RNA and free RNA, and the second is just the GFP. 

stdev = 1; % the ideal value of this is investigated in the project file 
% titled proj_basic_model.m

tightening = 1; % i have no idea what a good value is
nW = 300; % actual: 200 - 600 ish
stepsize = 1.5; % actual: 2 to 4 ish
niter = 30; % actual: 2 - 20 ish,
npoints = 2e4; % actual: 1e5 ish
thinning = 10; % actual: 10 to 40 ish

mi = struct(...
    'names_unord', {estNames}, ...
    'paramranges', {paramranges},...
    'dosednames', {dosedNames},...
    'dosedvals', {dosedVals},...
    'measuredspecies', {measuredSpecies}, ...
    'stdev', {stdev}, ...
    'tightening', {tightening}, ...
    'nW', {nW}, ...
    'stepsize', {stepsize}, ...
    'niter', {niter}, ...
    'npoints', {npoints}, ...
    'thinning', {thinning}, ...
    'parallel', true);








end