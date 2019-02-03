function [mi,mai, ri, tstamp, projdir, di]  = proj_acs_dsg2014_regen_A(varargin)
% proj_acs_dsg2014
% In this project, we fit RNA degradation and mRNA expression to data from
% the paper
% Gene Circuit Performance Characterization and Resource Usage in a Cell-Free “Breadboard”
% ACS Synth. Biol., 2014, 3 (6), pp 416–425, DOI: 10.1021/sb400203p,

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
p.addParameter('multiplier', 1);
p.addParameter('temperatureLadder', false);
p.parse(varargin{:});
p = p.Results;

% data_init
% proj_acs_dsg2014_regen_A('nW', 50, 'nPoints', 50*10*5, 'nIter', 5, 'parallel', false, 'multiplier', 2, 'thinning', 10)
% proj_acs_dsg2014_regen_A('nW', 6400, 'nPoints', 6400*10*20, 'nIter', 20, 'poolsize', 36, 'multiplier', 3, 'thinning', 10)
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
if mcmc_info.runsim_info.parallel
    if ~isempty(p.poolsize)
        delete(gcp('nocreate'))
        parpool(p.poolsize)
    else
        delete(gcp('nocreate'))
        parpool
    end
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
if ~p.temperatureLadder
    %% initialize the directory where things are stored.
    [tstamp, projdir, st] = project_init;
    if isempty(p.prevtstamp)
        mi = mcmc_runsim_v2(tstamp, projdir, di, mcmc_info,...
            'InitialDistribution', 'LHS', 'multiplier', p.multiplier);
    else
        specificprojdir = [projdir '/simdata_' prevtstamp];
        SS = load([specificprojdir '/full_variable_set_' prevtstamp], 'mcmc_info');
        marray = mcmc_get_walkers({prevtstamp}, {SS.mcmc_info.runsim_info.nIter},...
            projdir);
        % assume the projdir where this data is stored is the same one as the
        % one created at the start of this file
        
        pID = 1:length(mai.estNames);
        marray_cut = mcmc_cut(marray, pID, flipud((mai.paramRanges)'));
        if size(marray_cut, 2) < ri.nW
            warning('too few initial points, using a few timesteps from previous runs to create initial walker positions.');
            walker_timepoints = ceil(linspace(ceil(size(marray_cut,3))/2, size(marray_cut,3), ceil(ri.nW/size(marray_cut, 2))))
            minit = marray_cut(:,:, walker_timepoints(1));
            for i = 2:length(walker_timepoints)
                minit = [minit marray_cut(:,:,walker_timepoints(i)) ];
            end
            minit = minit(:, 1:ri.nW);
        else % there are enough points, just pick the number needed.
            minit = marray_cut(:,1:ri.nW,end);
        end
        % now run the simulation.
        
        mi = mcmc_runsim_v2(tstamp, projdir, di, mcmc_info,...
            'UserInitialize', minit, 'multiplier', 2,...
            'pausemode', false);
        
        
    end
    
else
    % begin temperature ladder: Initial temp is 10% of the total signal
    % then we do 0.1%, then finally 0.001%
    
    % compute total signal for the data of interest, taking dose and
    % topology weighting into account.
    tsig = 0; % total signal.
    for kk = 1:length(mi)
        
        currda = di(mi(kk).dataToMapTo).dataArray; % current data array
        
        % renormalize the data to make the weight of the measured
        % species the same.
        meanVals = mean(mean(mean(currda, 1), 3), 4);
        wt = sum(meanVals)./meanVals; %hight mean = lower wt
        relWt = wt/sum(wt);
        for jj = 1:size(currda, 2)
            currda(:, jj, :, :) = relWt(jj)*currda(:, jj, :, :);
        end
        dv = mi(kk).dosedVals;
        % reweight data by dose and experient.
        if isfield(mi(kk), 'experimentWeighting')
            if ~isempty(mi(kk).experimentWeighting)
                if isfield(mi(kk), 'doseWeighting')
                    if ~isempty(mi(kk).doseWeighting)
                        if isequal(size(mi(kk).doseWeighting), [1 size(dv,2)])
                            for ii = 1:size(dv,2)
                                currda(:, :, :, ii) = ...
                                    mi(kk).doseWeighting(ii)...
                                    *currda(:, :, :, ii)...
                                    *mi(kk).experimentWeighting;
                            end
                        else
                            error('Doses weights must be the same length as the number of doses')
                        end
                    end
                else
                    currda = ...
                        currda(:, :, :, ii)...
                        *mi(kk).experimentWeighting;
                end
            end
        elseif isfield(mi(kk), 'doseWeighting')
            if ~isempty(mi(kk).doseWeighting)
                if isequal(size(mi(kk).doseWeighting), [1 size(dv,2)])
                    for ii = 1:size(dv,2)
                        currda(:, :, :, ii) = ...
                            mi(kk).doseWeighting(ii)...
                            *currda(:, :, :, ii);
                    end
                else
                    error('Doses weights must be the same length as the number of doses')
                end
            end
        end
        tsig = tsig + sum(sum(sum(sum(currda))));
    end
    disp('Using temperature ladder for MCMC at the following temperatures.');
    tladder = tsig*[0.1 0.001, 0.00001]
    
    percentLadder = {'10pct_', 'pt1pct_', 'pt001pct_'};
    tstamp = datestr(now, 'yyyymmdd_HHMMSS');
    for ll = 1:length(tladder)
        %         tLaddStr = num2str(tladder(ll));
        %         if ~isempty(regexp(tLaddStr, '\.', 'ONCE'))
        %             dotLoc = regexp(tLaddStr, '\.');
        %             tLaddStr(dotLoc) = 'p';
        %         end
        
        tstamp_appended = [percentLadder{ll} tstamp];
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%% Set the standard deviation %%%
        mcmc_info.runsim_info.stdev = tladder(ll);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        [~, projdir, ~] = project_init('saveStr', tstamp_appended);
        if ll ==1
            if isempty(p.prevtstamp)
                mi = mcmc_runsim_v2(tstamp_appended, projdir, di, mcmc_info,...
                    'InitialDistribution', 'LHS', 'multiplier', p.multiplier);
            else
                specificprojdir = [projdir '/simdata_' prevtstamp];
                SS = load([specificprojdir '/full_variable_set_' prevtstamp], 'mcmc_info');
                marray = mcmc_get_walkers({prevtstamp}, {SS.mcmc_info.runsim_info.nIter},...
                    projdir);
                % assume the projdir where this data is stored is the same one as the
                % one created at the start of this file
                
                pID = 1:length(mai.estNames);
                marray_cut = mcmc_cut(marray, pID, flipud((mai.paramRanges)'));
                if size(marray_cut, 2) < ri.nW
                    warning('too few initial points, using a few timesteps from previous runs to create initial walker positions.');
                    walker_timepoints = ceil(linspace(ceil(size(marray_cut,3))/2, size(marray_cut,3), ceil(ri.nW/size(marray_cut, 2))))
                    minit = marray_cut(:,:, walker_timepoints(1));
                    for i = 2:length(walker_timepoints)
                        minit = [minit marray_cut(:,:,walker_timepoints(i)) ];
                    end
                    minit = minit(:, 1:ri.nW);
                else % there are enough points, just pick the number needed.
                    minit = marray_cut(:,1:ri.nW,end);
                end
                % now run the simulation.
                mi = mcmc_runsim_v2(tstamp_appended, projdir, di, mcmc_info,...
                    'UserInitialize', minit, 'multiplier', 2);
            end
        else
            prevtstamp = [percentLadder{ll-1} tstamp];
            specificprojdir = [projdir '/simdata_' prevtstamp];
            SS = load([specificprojdir '/full_variable_set_' prevtstamp], 'mcmc_info');
            marray = mcmc_get_walkers({prevtstamp}, {SS.mcmc_info.runsim_info.nIter},...
                projdir);
            % assume the projdir where this data is stored is the same one as the
            % one created at the start of this file
            
            pID = 1:length(mai.estNames);
            marray_cut = mcmc_cut(marray, pID, flipud((mai.paramRanges)'));
            minit = marray_cut(:,1:ri.nW,end);
            % now run the simulation.
            mi = mcmc_runsim_v2(tstamp_appended, projdir, di, mcmc_info,...
                'UserInitialize', minit, 'multiplier', 2);
        end
        
        %
        
        
    end
end
% copy paste into the terminal if using matlab with no display.
% proj_acs_dsg2014_regen_A('stepSize', 1.3, 'nW', 100, 'nPoints', 100*10,...
%     'thinning', 2, 'nIter', 2, 'parallel', true, 'poolsize', 4, 'temperatureLadder', true)
end

