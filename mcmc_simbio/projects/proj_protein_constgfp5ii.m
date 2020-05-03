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
[tstamp, projdir, st] = project_init;

%% We first define the model, mcmc_info struct, and the data_info struct. 

mobj = model_protein5;

mcmc_info = mcmc_info_constgfp5ii(mobj);

mi = mcmc_info.model_info;



rkfdG = 1; % nM-1s-1
rkrdG = 60; % s-1

rkfpG = 2; % nM-1s-1
rkrpG = 60; % s-1

cpol1 = 100; % nM
cribo1 = 50; %nM
rkcm1 = 0.001; %s-1
rkcp1 = 1/36;
rdel_m1 = log(2)/720; % 12 min half life of mrna
cpol2 = cpol1*2;
cribo2 = cribo1*2;
rkcm2 = rkcm1*2;
rkcp2 = rkcp1*2;
rdel_m2 = rdel_m1*2;

masterVector = log([...
    rkfdG;rkrdG;rkfpG;rkrpG;rkcm1;rkcp1;rdel_m1;cpol1;cribo1;rkcm2;...
    rkcp2;rdel_m2;cpol2;cribo2]);

di = data_artificial_v2({mobj}, {0:180:7200}, {mi.measuredSpecies}, ...
    {mi.dosedNames}, {mi.dosedVals}, {mi.namesUnord},...
    {exp(masterVector([1:4 5:9])), exp(masterVector([1:4 10:14]))});

da_extract1 = di(1).dataArray;
da_extract2 = di(2).dataArray;
tv = di(1).timeVector;
mcmc_trajectories([], di, [], [], [], [], 'just_data_info', true);
%     Run the MCMC 
ri = mcmc_info.runsim_info;
mai = mcmc_info.master_info;

marray = mcmc_get_walkers({'20180322_155221'}, {20}, projdir);
pID = 1:length(mai.estNames);
marray_cut = mcmc_cut(marray, pID, flipud((mai.paramRanges)'));
if size(marray_cut, 2) < ri.nW
    error('too few initial points');
elseif size(marray_cut, 2) > ri.nW
    marray_cut = marray_cut(:,1:ri.nW, :);
end
%%
mi = mcmc_runsim_v2(tstamp, projdir, di, mcmc_info,...
     'UserInitialize', marray_cut(:,:,end), 'multiplier', 2); 
% 'UserInitialize', marray_cut(:,:,end)
% 'InitialDistribution', 'LHS'

%%  plot stuff 
tstamptouse = tstamp; 
close all
marray = mcmc_get_walkers({tstamptouse}, {1:ri.nIter}, projdir);

mcmc_plot(marray([1:2 3:7], :,1:6:end), mai.estNames([1:2 3:7]),...
 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse, 'extrafignamestring', '_extract1');
figure
mcmc_plot(marray([1:2 8:12], :,1:6:end), mai.estNames([1:2 8:12]),...
 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse, 'extrafignamestring', '_extract2');

titls = {'E1 dG 10';'E1 dG 30';'E1 dG 60'};

lgds = {};
mvarray = masterVecArray(marray, mai);
marrayOrd = mvarray(mi(1).paramMaps(mi(1).orderingIx, 1),:,:);
fhandle = mcmc_trajectories(mi(1).emo, di(1), mi(1), marrayOrd, titls, lgds,...
    'SimMode', 'curves', 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse, 'extrafignamestring', '_extract1');
marrayOrd = mvarray(mi(1).paramMaps(mi(1).orderingIx, 2),:,:);
titls = {'E2 dG 10';'E2 dG 30';'E2 dG 60'};
fhandle = mcmc_trajectories(mi(1).emo, di(2), mi(1), marrayOrd, titls, lgds,...
    'SimMode', 'curves', 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse, 'extrafignamestring', '_extract2');

