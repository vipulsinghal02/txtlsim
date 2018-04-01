function mcmc_info = mcmc_info_constgfp3iv(modelObj)
% % model_protein3: Constitutive gene expression model using a single
% enzymatic step.
%
% The estimation problem here is data in a single topology and two geometries, 
% with the CSPs shared across extracts. The CSP is the kr, and is estimated 
% jointly between the extracts. The value used to generate the data in the 
% nominal case is 100. 
%
% ~~~ MODEL ~~~
% D + pol <-> D__pol  (k_f, k_r  )
% D__pol -> D + pol + protien (kc)
%
% Fix kf = 0.5.
% The rest of the params: k_r, pol and kc are to be estimated.
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

% User readable description of the circuit. Will be used in the log file generated
% from the MCMC inference procedure.
circuitInfo = ...
    [' D + pol <-> D__pol  (k_f, k_r \n'... )
    'D__pol -> D + pol + protien (kc)\n'...
    'single topology, single geometry.'];

activeNames = ...
    {'kf'
    'kr'
    'kc'
    'pol'};


estParams = {'kf'
    'kr'
    'kc1'
    'pol1'
    'kc2'
    'pol2'};

% fixedParams vector
fixedParams = [];

% master vector
logp =  zeros(6,1);

masterVector = [logp]; % log transformed.

paramMap = [1 2 3 4; 1 2 5 6]';

paramRanges = [-3 7
    -3 7
    -3 7
    -3 7
    -3 7
    -3 7];
% data indices tell us which data set to use for each topology - geometry pair
% from the data_info struct array.
dataIndices = [1, 2];

%% next we define the dosing strategy.
dosedNames = {'D'};
dosedVals = [1 2 5];

measuredSpecies = {{'protein'}};
msIx = 1; %


%% setup the MCMC simulation parameters
stdev = 1; % i have no idea what a good value is
tightening = 1; % i have no idea what a good value is
nW = 400; % actual: 200 - 600 ish
stepsize = 1.3; % actual: 1.1 to 4 ish
niter = 30; % actual: 2 - 30 ish,
npoints = 4e4; % actual: 2e4 to 2e5 ish (or even 1e6 of the number of
%                        params is small)
thinning = 1; % actual: 10 to 40 ish

%% pull all this together into an output struct.
% the mcmc info struct now is an array struct, the way struct should be used!

runsim_info = struct('stdev', {stdev}, ...
    'tightening', {tightening}, ...
    'nW', {nW}, ...
    'stepSize', {stepsize}, ...
    'nIter', {niter}, ...
    'nPoints', {npoints}, ...
    'thinning', {thinning}, ...
    'parallel', true);

% for now we simply make the model_info have just one model (topology).
% But the code will be written in a way such that multiple models can be used.

model_info = struct(...
    'circuitInfo',{circuitInfo},...
    'modelObj', {modelObj},... % array of model objects (different topologies)
    'modelName', {modelObj.name},...; % model names.
    'namesUnord', {activeNames}, ... % names of parameters per model, unordered.
    'paramMaps', {paramMap}, ... % paramMap: matrix mapping models to master vector.
    'dosedNames', {dosedNames},... % cell arrays of species. cell array corresponds
    ...                               % to a model.
    'dosedVals', {dosedVals},...  % matrices of dose vals
    'measuredSpecies', {measuredSpecies}, ... % cell array of cell arrays of
    ...                  % species names. the elements of the inner
    ...                  % cell array get summed.
    'measuredSpeciesIndex', {msIx},...
    'dataToMapTo', dataIndices); % each dataToMapTo property within an 
% element of the model_info array is a vector of length # of geometries.


semanticGroups = {1, 2, 3, 4, 5,6};

%num2cell((1:5)'); 
%arrayfun(@num2str, 1:10, 'UniformOutput', false);



estParamsIx = setdiff((1:length(masterVector))', fixedParams);

%% master parameter vector, param ranges,
master_info = struct(...
    'estNames', {estParams},...
    'masterVector', {masterVector},...
    'paramRanges', {paramRanges},...
    'fixedParams', {fixedParams},...
    'semanticGroups', {semanticGroups});


mcmc_info = struct('runsim_info', runsim_info, ...
    'model_info', model_info,...
    'master_info', master_info);

end