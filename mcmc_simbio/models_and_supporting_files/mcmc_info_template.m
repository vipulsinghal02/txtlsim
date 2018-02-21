function mcmc_info = mcmc_info
    % define the mcmc_info struct. Copy this file and change the respective fields. 
    %
    % The strust has fields: 
    % 
    % 'modelObj': The simbiology model object
    %
    % 'namesUnord': List of species and parameters that are to be estimated. These 
    % are strings naming things in the model object. 
    %
    % 'paramRanges': A length(mcmc_info.namesUnord) x 2 matrix of log transformed 
    % upper and lower bounds for the parameters and species concentrations. 
    %
    % 'dosedNames': A cell array of strings of species names for species that are 
    % dosed in the model. 
    %
    % 'dosedVals': A matrix of dose values of size # of dosed species by 
    % # of dose combinations. 
    %
    % 'measuredSpecies': A 1 x number of measured output variables. This is a 
    % cell array of cell arrays of the strings of species whose concentrations
    %  are to be added to get the measured variable. 
    %
    % 'stdev': MCMC likelihood function standard deviation
    %
    % 'tightening': A division factor for the standard deviation. 
    %
    % 'nW': Number of Walkers
    %
    % 'stepSize': MCMC step size
    %
    % 'nIter': Number of MCMC iterations. 
    %
    % 'nPoints': Number of MCMC points per iteration. 
    %   
    % 'thinning': Number of steps to skip before taking an MCMC sample. 
    %
    % 'parallel': Boolean variable specifying whether parallel computing is used. 
    %
    %

% Copyright (c) 2018, Vipul Singhal, Caltech
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:

% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.

% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.



    pcells = [{'TX_elong_glob',           5.1288                }   % 1 3
        {'AGTPdeg_time'                     7200      }             % 4 10
        {'TXTL_RNAdeg_kc'    0.0022382 }];                          %-7 -3

    estNames = [pcells(:,1)
        {'RNAP';... % 1.5 6
        'RNase'}]; % 2 7

    paramranges = [1 3
        4 10
        -10 -7
        1.5 6
        2 7];


    %% next we define the dosing strategy. 
    dosedNames = {'DNA p70--utr1--deGFP'};
    dosedVals = [0.5 2 5 20];

    measuredSpecies = {{'[RNA utr1--deGFP]',...
        '[Ribo:RNA utr1--deGFP]'}};

    %% setup the MCMC simulation parameters
    stdev = 1; % i have no idea what a good value is
    tightening = 1; % i have no idea what a good value is
    nW = 600; % actual: 200 - 600 ish
    stepsize = 1.2; % actual: 2 to 4 ish
    niter = 30; % actual: 2 - 20 ish,
    npoints = 4e4; % actual: 1e5 ish
    thinning = 10; % actual: 10 to 40 ish

    %% pull all this together into an output struct. 
    mcmc_info = struct(...
        'modelObj', {m}
        'namesUnord', {estNames_ver2}, ...
        'paramRanges', {paramranges_ver3},...
        'dosedNames', {dosedNames},...
        'dosedVals', {dosedVals},...
        'measuredSpecies', {measuredSpecies}, ...
        'stdev', {stdev}, ...
        'tightening', {tightening}, ...
        'nW', {nW}, ...
        'stepSize', {stepsize}, ...
        'nIter', {niter}, ...
        'nPoints', {npoints}, ...
        'thinning', {thinning}, ...
        'parallel', true);






end