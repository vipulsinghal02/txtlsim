function mcmc_info = mcmc_info_example
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

%% Specify the parameters and species to estimate
% estNames is a cell array of the names of parameter and species that are
% estimated
% note that we have added AGTPdeg_time, and AGTPdegrate
estNames = {'TX_elong_glob'
    'TL_elong_glob'
    'AGTPdeg_time'
    'AGTPdeg_rate'
    'TXTL_PROT_deGFP_MATURATION'
    'TXTL_UTR_UTR1_Kd'
    'TXTL_P70_RNAPbound_Kd'
    'TXTL_RNAPBOUND_TERMINATION_RATE'
    'TXTL_NTP_RNAP_1_Kd'
    'TXTL_NTP_RNAP_2_Kd'
    'TL_AA_Kd'
    'TL_AGTP_Kd'
    'TXTL_RIBOBOUND_TERMINATION_RATE'
    'TXTL_RNAdeg_Kd'
    'RNAP'
    'Ribo'
    'RNase'};

% set parameter ranges. The numbers here are being log transformed, since
% they must always be positive. 
paramranges = log([0.01, 100;... %
    0.01, 100;... %
    600 57600;... %
    0.00001 0.001;... %
    0.001 0.1;... %
    0.001 100;... %
    0.001 100;... % RNAP and promoterbinding Kd
    0.001 10;... % termination rate for transcription
    0.001 100;... % NTP Kd1
    0.001 100;... % NTP Kd2
    0.001 100;... % AA Kd
    0.001 100;... % AGTP for TL Kd
    0.001 10;... % TL termination rate
    0.001 100;... %  RNAse Kd
    0.1 5000;... % RNAP conc
    0.1 5000;... % ribosome conc
    0.1 5000;... % RNAse conc
    ]);


%% next we define the dosing strategy. 
dosedNames = {'DNA p70--utr1--deGFP'};
dosedVals = [0.5 2 5 20];


%% create the measured species cell array
% this is a 1x2 cell array. each element of this cell array contains
% further cell arrays. The first such cell array is a list of all the bound
% and free versions of the RNA. The second cell array contains a single
% cell, which contains the GFP string. 
% all the species in the inner cell arrays get summed, and compared to the
% corresponding column (dimension 2) of the experimental data array. 
measuredSpecies = {{'[RNA utr1--deGFP]',...
    '[Ribo:RNA utr1--deGFP]',...
    '[AA:2AGTP:Ribo:RNA utr1--deGFP]', ...
    '[term_Ribo:RNA utr1--deGFP]',...
    '[AA:Ribo:RNA utr1--deGFP]'...
    '[RNA utr1--deGFP:RNase]',...
    '[Ribo:RNA utr1--deGFP:RNase]',...
    '[AA:2AGTP:Ribo:RNA utr1--deGFP:RNase]', ...
    '[term_Ribo:RNA utr1--deGFP:RNase]',...
    '[AA:Ribo:RNA utr1--deGFP:RNase]'}, {'protein deGFP*'}};

%% setup the MCMC simulation parameters
stdev = 1; % i have no idea what a good value is
tightening = 1; % i have no idea what a good value is
nW = 40; % actual: 200 - 600 ish
stepsize = 2.1; % actual: 2 to 4 ish
niter = 2; % actual: 2 - 20 ish,
npoints = 1e3; % actual: 1e5 ish
thinning = 4; % actual: 10 to 40 ish



%% pull all this together into an output struct. 
mcmc_info = struct(...
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
    'parallel', false);






end