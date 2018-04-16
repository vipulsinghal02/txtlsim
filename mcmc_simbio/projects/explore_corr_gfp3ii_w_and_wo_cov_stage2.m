

%% Actually before we conclude that this is not sufficiently informative to 
% make the variance blow up point, lets try just picking an arbitrary point
% (just 1) from the E2 ESP, or even the median (need to verify that the median 
% sits inside the ESP projection set and is pickable in the first place, 
% like we did in the test015, and then actually doing a CSP ESTIMATION. I
% think in general that should cause a bad effect. 

%% part 1: First we do the median version. See stage 3 file for part 3, which 
% deals with an arbitrary point. 

%% Fix ESP medians
[tstamp1, projdir, st] = project_init;
mobj = model_protein3;

% The MCMC info here is for fixing the ESP values to the median of the
% estimates in E2
mcmc_info = mcmc_info_constgfp3v(mobj); 

mi = mcmc_info.model_info;

rkfdG = 5; % nM-1s-1
rkrdG = 300; % s-1

% get the median values from the constgfp3ii simulation


masterVector = log([rkfdG 
                    rkrdG
                    rkcp
                    cpol]);

di = data_artificial_v2({mobj}, {0:180:7200}, {mi.measuredSpecies}, ...
    {mi.dosedNames}, {mi.dosedVals}, {mi.namesUnord},...
    {exp(masterVector), [exp(masterVector(1:end-2)); 0.024; 200]});

da_extract1 = di(1).dataArray;
da_extract2 = di(2).dataArray;
tv = di(1).timeVector;
%% convert this section into a data visualization function. 

mcmc_trajectories([], di, [], [], [], [], 'just_data_info', true);


%     Run the MCMC 
ri = mcmc_info.runsim_info;
mai = mcmc_info.master_info;

% marray = mcmc_get_walkers({'20180311_223247'}, {10}, projdir);
% marray_cut = mcmc_cut(marray, (1:10), flipud((mai.paramRanges)'));
% if size(marray_cut, 2) < ri.nW
%     error('too few initial points');
% elseif size(marray_cut, 2) > ri.nW
%     marray_cut = marray_cut(:,1:ri.nW, :);
% end
%%

mi1 = mcmc_runsim_v2(tstamp1, projdir, di(1), mcmc_info,...
   'InitialDistribution', 'LHS'); % 'InitialDistribution', 'gaussian'
%  'UserInitialize', marray_cut(:,:,end)












%% Estimate CSPs in E2

%% plug into E1 and simulate

%% part 2: then we do the arbitrary point version. 


%% well it looks like this model is pretty identifiable, and so there is really no problem
% I need to find another example, where there is clear non identifiability
% and covariation between esps and csps. 
