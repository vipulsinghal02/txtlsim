function mcmc_info = mcmc_info_constgfp3iii(modelObj)
    % Share CSPs, Estimate ESPs. 1 topology, 2 geometries. kf not estimated. 

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
    circuitInfo = ['Enzymatic one step protein production. kf fixed at 0.5. \n' ...
    'Share CSPs, Estimate ESPs. 1 topology, 2 geometries. kf not estimated. \n' ...
    'CSPs: kr. ESPs: pol, kc']

    activeNames = {'kr'
                   'kc'
                   'pol'};
    estParams = activeNames;
    masterVector = zeros(3, 1);
    fixedParams = [];
    paramMap = (1:3)';
    
    paramRanges = log([0.5 500
                        0.5 500
                        1 100]);


% data indices tell us which data set to use for each topology (model) - geometry pair
% from the data_info struct array. 
% Here we have 1 model, and 10 geometries, all pointing to the same data: 
% at data index 1 in the data_info array created by data_dsg2014.m
dataIndices = 1;

%% next we define the dosing strategy. 
dosedNames = {'D'};
dosedVals = [1 2 5];


%% create the measured species cell array
measuredSpecies = ({'protein'}}; 
msIx = 1; % this is the index of the measured species in the data array 

%% setup the MCMC simulation parameters
stdev = 1; % i have no idea what a good value is
tightening = 1; % i have no idea what a good value is
nW = 400; % actual: 200 - 600 ish
stepsize = 1.3; % actual: 1.1 to 4 ish
niter = 20; % actual: 2 - 30 ish,
npoints = 4e4; % actual: 2e4 to 2e5 ish (or even 1e6 of the number of 
%                        params is small)
thinning = 4; % actual: 10 to 40 ish

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
    'paramMaps', {paramMap}, ... % each paramMap is a matrix mapping models to the master vector. 
    'dosedNames', {dosedNames},... % cell arrays of species. cell array corresponds
     ...                               % to a model.
    'dosedVals', {dosedVals},...  % matrices of dose vals 
    'measuredSpecies', {measuredSpecies}, ... % cell array of cell arrays of 
                      ...                  % species names. the elements of the inner
                      ...                  % cell array get summed. 
    'measuredSpeciesIndex', {msIx},...                                    
    'dataToMapTo', dataIndices); % each dataToMapTo property within an element of the 
                            % model_info array is a vector of length # of geometries. 
                            
                            
semanticGroups = num2cell((1:3)'); %arrayfun(@num2str, 1:10, 'UniformOutput', false);


estParamsIx = setdiff((1:length(masterVector))', fixedParams);

%% master parameter vector, param ranges, 
master_info = struct(...
    'estNames', {estParams},...
    'masterVector', {masterVector},...
    'paramRanges', {paramRanges},... % 
    'fixedParams', {fixedParams},...   % indexes of the parameters that are fixed (withing master vector)
    'semanticGroups', {semanticGroups}); % EITHER EMPTY OR
                                        % a cell array of vectors specifying parameter 
                                        % groupings. 
                                        % The vectors contain indices to the 
                                        % parameters in (non fixed subset of) the master 
                                        % vector that need to be grouped.  
                                        % I.e., They contain indexes of the subvector 
                                        % logp =  
                                        % master_info.mastervector(~master_info.fixedParams)
                                        % and to the rows of the paramRanges matrix and the
                                        % estNames cell array of strings. 
                                        % 
                                        % parameter grouping so that these parameters 
                                        % get INITIALIZED to the same values.
                                        %  
                                        % every parameter index must show up in at least 
                                        % one group, even if that is the only parameter in 
                                        % that group. If the semanticGroups field is empty, 
                                        % then all parameters are assumed to be in their distinct
                                        % groups. 


% how the parameter distribution flow works: 
% WALKER INITIALIZATION
% reduced master vector -- semanticGroups --> 
% master vector -- paramMaps --> 
% full parameter vector for each topo-geom pair -- orderingIx --> 
% reordered vector for exported model simulation. 
% 
% param ranges: reduced param ranges matrix (by sematicGroups)
% compute initial parameter distributons 
% then expand in the same way as above. 
% once the parameters have been estimated, there is no need to 
% reorder them, since the master vector was never reordered. 
% can use the master_info.estNames for the names and 
% master_info.mastervector(~master_info.fixedParams) for the 
% parameter values. 
% sematic


mcmc_info = struct('runsim_info', runsim_info, ...
    'model_info', model_info,...
    'master_info', master_info);

end