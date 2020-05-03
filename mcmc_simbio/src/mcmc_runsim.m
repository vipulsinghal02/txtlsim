function mi = mcmc_runsim(tstamp, projdir,di, mobj, mi, varargin)
% mcmc_runsim: run the mcmc estimation using the affine invariant 
% ensemble sampler. 
% 
% INPUTS: 
%
% tstamp:       The time stamp string of the simulation generated by 
%               project_init. Format is 'yyyymmdd_HHMMSS'
%
% projdir:      Directory where the generated data subdirectory
%               (simdata_yyyymmdd_HHMMSS, where yyyymmdd_HHMMSS is 
%               the time stamp) will be created. 
%
% tv:           time vector in the units of seconds. 
%
% da:           A matlab array containing experimental data. This array 
%               has dimensions nTimePoints x nMS x nReplicates x nDoses
%               where 
%               -nTimePoints:    length(tv), i.e., the number of time points. 
%               -nMS:            The number of measured species. Corresponds 
%                               to values given in the mcmc_info and data_info 
%                               structs. 
%               -nReplicates
%               -nDoses:         Number of dose combinations (initial conditions)
% 
% mobj:         Simbiology model object. 
%
% mi:           mcmc_info struct. Type 'help mcmc_info_dsg2014_mrna' or 
%               'help mcmc_info_template' into the MATLAB command line to learn 
%               more. 
%               
% Optional name-value pair arguments:
% InitialDistribution:  Initial distribution of walker points. This can be 
%                       Latin hyprcube sampled (Value: 'LHS'), gaussian 
%                       distributed (Value: 'gaussian') about the midpoint of 
%                       mi.paramranges or uniformly distributed (Value: 'unifrand'). 
% 
% Width:                Applies to the width of the gaussian or uniform random
%                       parameter distribution around the midpoint given by 
%                       mi.paramranges. 
%
% UserInitialize:       The user provides a matrix of initial walker positions. 
%                       When this input is specified, 'InitialDistribution' and 
%                       'Width' are ignored. 
%
% FitOption:            Allows for fitting to data in 3 modes:
%               'FitMedian':    This mode computes the curvewise median (Default).
%                               of the data over the replicates, and fits the model 
%                               to this. 
%               'FitMean':      Compute the mean of the replicates, and fit to this 
%                               mean
%               'FitAll'        Fit all the curves. 

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

p = inputParser;
p.addParameter('InitialDistribution', 'LHS', @ischar); % LHS, gaussian, unifrand
p.addParameter('Width', 0.1, @isnumeric)
p.addParameter('UserInitialize', [], @isnumeric)
p.addParameter('FitOption', 'FitMedian', @ischar); % 'FitMean', 'FitAll'
p.parse(varargin{:});
p = p.Results;

% Transform Experimental data to the appropriate form for fitting
da = di.dataArray;
tv = di.timeVector;
switch p.FitOption
    case 'FitMedian'
        % Compute the curvewise median of the data. 
        [ix, mdvals] = medianIndex(sum(da, 1), 3); 
        da = medianReplicate(da, ix);
    case 'FitMean'
        da = mean(da, 3);
    case 'FitAll'
        % do nothing
%         da = da;
    otherwise
        error('Invalid fit option. Read the documentation for how to specify inputs.')
end

%% EXPORT MODEL object to get it ready for MCMC
% the resulting object is of class SimBiology.export.Model
% documentation: https://www.mathworks.com/help/simbio/ref/simbiology.export.model-class.html
% Sven Mesecke's blog post on using the exported model class for parameter inference applicaton. 
% http://sveme.org/how-to-use-global-optimization-toolbox-algorithms-for-simbiology-parameter-estimation-in-parallel-part-i.html

% export and accelerate simbiology model object using estimated species
% and dosing species names

% select the parameters and species objects using the name array
ep = sbioselect(mobj, 'Type', 'parameter', 'Name', ...
    mi.namesUnord);% est parameters

es = sbioselect(mobj, 'Type', 'species', 'Name', ...
    mi.namesUnord);% est species

aps = [ep; es]; % active parameters and species

% reorder the parameter and species so they are in the same order as that
% in the model. 
eno = cell(length(aps), 1);% est names ordered

for i = 1:length(aps)
    eno{i} = aps(i).Name;
end
% 
ds = sbioselect(mobj, 'Type', 'species', 'Name', mi.dosedNames);

emo = export(mobj, [ep; es; ds]); % exported model object, dosed species names. 
SI = emo.SimulationOptions;
SI.StopTime = tv(end);
accelerate(emo);

mi.names_ord = eno; % est names ordered. 
mi.emo = emo; % exported model object. 


%% COMPUTE INITIAL WALKER POSITIONS
ds = struct('names', {mi.dosedNames}, 'dosematrix', mi.dosedVals);
if isempty(p.UserInitialize)
    minit = integrableLHS(emo, mi.nW, mi.paramRanges, eno, ...
        ds, 'distribution', p.InitialDistribution, 'width', p.Width);
else
    minit = p.UserInitialize;
    % assume all the user defined points are integrable.
end

%% SETUP FUNCTIONS
% setup the log prior, log likelihood function and lognormvec functions
lognormvec=@(res,sig) -(res./sig).^2 -log(sqrt(2*pi)).*sig;

logprior = @(logp) all(mi.paramRanges(:, 1) < logp) &&...
    all(logp < mi.paramRanges(:,2));

sigg = mi.stdev/mi.tightening;



loglike = @(logp) gen_residuals_4(logp, emo, da, tv, ...
    mi.dosedVals, mi.measuredSpecies, lognormvec, sigg);


% BURN IN: run the burn in simulation
if isempty(p.UserInitialize)
    tic
    [m] =gwmcmc_vse(minit,{logprior loglike},...
        mi.npoints,...
        'StepSize',mi.stepsize , ...
        'ThinChain',mi.thinning,...
        'Parallel', mi.parallel);
    toc
    
    minit = m(:,:,end);
    clear m
else
    disp('User initialized intitial walker positions, skipping burn in phase')
end


% specify where to save things 
cfname = cell(mi.nIter, 1);
specificproj = [projdir '/simdata_' tstamp];

%% we save useful variables in a one off manner here (ie, outside the loops)
fname = ['full_variable_set_' tstamp]; % filename
save([specificproj '/' fname]);

% run the actual simuations, saving the data every iteration
for i = 1:mi.nIter %
    if ~mod(i, 3)
        fprintf('Pausing for 10 minutes before starting run number %d. \n', i);
        pause(6)        
    end
    
    tic
    fprintf('starting mcmc %d\n', i);
    [m] = gwmcmc_vse(minit,{logprior loglike},...
        mi.nPoints, ...
        'StepSize',mi.stepSize , ...
        'ThinChain',mi.thinning, 'Parallel', mi.parallel);
    
    fprintf('ending mcmc %d\n', i);
    toc
    fname = ['mcmc' tstamp '_ID' num2str(i)] ;
    cfname{i} = fname;
    save([specificproj '/' fname], 'm');
    % the only thing that is different in each run are the above
    %             pause(1)
    minit = m(:,:,end);% + 0.1*randn(size(m(:,:,end-1)));
    
    clear m
    
end

% generate log file
mcmc_log(tstamp, projdir,specificproj, mi, di)
end

