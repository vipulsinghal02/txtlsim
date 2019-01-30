function [mi,mai, ri, tstamp, projdir, di]  = proj_acs_dsg2014_regen_A(varargin)
% notes: 
% - the first run on this is on lambda, with timestamp simdata_20180419_212516
% step size is 2, and stdev is 5. 
% - and in parallel there is a nessa run 20180419_213851 step size is 1.05,
% and stdev is 2. 
% so these two runs are a bit different. 
% April 19 - 20: once these are done, compare the cornerplots to each other
% to see if the results you get are the same. This will give stationarity.
% Otherwise, we need to run longer. this is a 20 dimensional search, so not
% super trivial. need to probably do a lot of iterations. 

%% MCMC toolbox fits using ACS DSG data, with VNPRL 2011 for some extra info,
% and the new regeneration system for ATP management. There are 4 parts to
% this fitting. 
% A: Fitting the mRNA degradation and mRNA transcription data
% B: Fit the protien data with the TX and degradation parameters set to 10
% random points from A, B. 
% C: Fit the major parameters from rna deg, tx and tl, (but not stuff like
% NTP binding rates, AA binding rates, AGTP deg rate etc. 

% Vipul Singhal, 
% California Institute of Technology
% 2018

p = inputParser;
p.addParameter('prevtstamp', []); 
p.addParameter('stepSize', 1.4); 
p.addParameter('nW', 1000); 
p.addParameter('nPoints', 4e4); 
p.addParameter('thinning', 4); 
p.addParameter('nIter', 3);
p.addParameter('parallel', true);
p.addParameter('stdev', 1); 
p.addParameter('poolsize', []);
p.addParameter('multiplier', 2);
p.parse(varargin{:});
p = p.Results;
%% initialize the directory where things are stored.
[tstamp, projdir, st] = project_init;
% data_init

%% construct simbiology model object(s)
mobj = model_dsg2014_regen;

%% setup the mcmc_info struct
mcmc_info = mcmc_info_dsg2014_regen_A(mobj);

mi = mcmc_info.model_info;

%% setup the data_info struct
di = data_dsg2014_full 
% modify di to only contain the mRNA data. 
% di.dataArray = di.dataArray(:, 1, :, :); % pick out only the mrna
% di.measuredNames = di.measuredNames(1);
% di.dataUnits = di.dataUnits(1);
% di.dataInfo = ['Modified to only have mRNA data. \n',...
% di.dataInfo];

if ~isempty(p.poolsize)
    delete(gcp('nocreate'))
    parpool(p.poolsize)
end

%     Run the MCMC 
if ~isempty(p.stepSize)
    mcmc_info.runsim_info.stepSize = p.stepSize; 
end

if ~isempty(p.nW)
    mcmc_info.runsim_info.nW = p.nW; 
end

if ~isempty(p.nPoints)
    mcmc_info.runsim_info.nPoints = p.nPoints; 
end

if ~isempty(p.thinning)
    mcmc_info.runsim_info.thinning = p.thinning; 
end

if ~isempty(p.nIter)
    mcmc_info.runsim_info.nIter = p.nIter; 
end

if ~isempty(p.parallel)
    mcmc_info.runsim_info.parallel = p.parallel; 
end

if ~isempty(p.stdev)
    mcmc_info.runsim_info.stdev = p.stdev; 
end
ri = mcmc_info.runsim_info;
mai = mcmc_info.master_info;
%% run the mcmc simulations 
% prevtstamp = {'20180120_172922'};
% simID = {'1'};
% marray = mcmc_get_walkers(prevtstamp, {simID}, projdir); 
% mtemp = marray(:,:);
if isempty(p.prevtstamp)
mi = mcmc_runsim_v2(tstamp, projdir, di, mcmc_info,...
    'InitialDistribution', 'gaussian', 'multiplier', p.multiplier);
else

    specificprojdir = [projdir '/simdata_' p.prevtstamp];

    % load mcmc_info    and the updated model_info
    SS = load([specificprojdir '/full_variable_set_' p.prevtstamp], 'mcmc_info');

    marray = mcmc_get_walkers({p.prevtstamp}, {SS.mcmc_info.runsim_info.nIter},...
        projdir); 
    % assume the projdir where this data is stored is the same one as the
    % one created at the start of this file
    
    
    pID = 1:length(mai.estNames);
    marray_cut = mcmc_cut(marray, pID, flipud((mai.paramRanges)'));
    if size(marray_cut, 2) < ri.nW
        error('too few initial points');
    elseif size(marray_cut, 2) > ri.nW
        marray_cut = marray_cut(:,1:ri.nW, :);
    end

        mi = mcmc_runsim_v2(tstamp, projdir, di, mcmc_info,...
        'UserInitialize', marray_cut(:,:,end), 'multiplier', p.multiplier);
    
    
%     
%     [mi,mai, ri, tstamp, projdir, di] = proj_acs_dsg2014_regen_A(...
% 'stepSize', 1.05, 'nW', 400, 'nPoints', 4e4, 'thinning', 20,...
% 'nIter', 80, 'parallel', true, 'multiplier', 2, 'stdev', 2);

end

