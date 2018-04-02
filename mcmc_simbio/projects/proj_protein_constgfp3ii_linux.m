function mi = proj_protein_constgfp3ii_linux(varargin)

%% MCMC toolbox demo - proj_protein_constgfp3i.m
%
% const gfp 3, artificial data, separate, 2 extracts. Check if the CSPs line up exactly. 
% 
% Vipul Singhal, 
% California Institute of Technology
% 2018

%% initialize the directory where things are stored.
% close all
% clear all
% clc
p = inputParser;
p.addOptional('prevtstamp', []); 
p.addParameter('stepSize', []); 
p.addParameter('nW', []); 
p.addParameter('nPoints', []); 
p.addParameter('thinning', []); 
p.addParameter('nIter', []);
p.addParameter('parallel', []);

p.addParameter('multiplier', 1);
p.parse(varargin{:});
p = p.Results;

[tstamp, projdir, st] = project_init;

%% We first define the model, mcmc_info struct, and the data_info struct. 

mobj = model_protein3;

mcmc_info = mcmc_info_constgfp3ii(mobj);

mi = mcmc_info.model_info;


rkfdG = 5; % nM-1s-1
rkrdG = 300; % s-1
rkcp1 = 0.012; %s-1
rkcp2 = 0.024; %s-1
cpol1 = 100; % nM
cpol2 = 200; % nM


masterVector = log([...
rkfdG 
rkrdG
rkcp1
rkcp2
cpol1
cpol2]);

% supply parameter vectors to this function to generate simulated data. 
di = data_artificial_v2({mobj}, {0:180:7200}, {mi.measuredSpecies}, ...
    {mi.dosedNames}, {mi.dosedVals}, {mi.namesUnord},...
     {exp(masterVector([1:2 3 5])), exp(masterVector([1:2 4 6]))});

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


%%

if isempty(p.prevtstamp)
    mi = mcmc_runsim_v2(tstamp, projdir, di, mcmc_info,...
    'InitialDistribution', 'LHS', 'multiplier', p.multiplier);
else
    ri = mcmc_info.runsim_info;
    marray = mcmc_get_walkers({p.prevtstamp}, {ri.nIter},...
        projdir); 
    % assume the projdir where this data is stored is the same one as the
    % one created at the start of this file
    mai = mcmc_info.master_info;
    
    pID = 1:length(mai.estNames);
    marray_cut = mcmc_cut(marray, pID, flipud((mai.paramRanges)'));
    if size(marray_cut, 2) < ri.nW
        error('too few initial points');
    elseif size(marray_cut, 2) > ri.nW
        marray_cut = marray_cut(:,1:ri.nW, :);
    end

        mi = mcmc_runsim_v2(tstamp, projdir, di, mcmc_info,...
        'UserInitialize', marray_cut(:,:,end), 'multiplier', p.multiplier);
end

end




