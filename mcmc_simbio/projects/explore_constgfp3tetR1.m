% constgfp3 and tetRrepression1 simulations to explore some parameter ranges manually
% Did some back of the envelope calculations in notability (FebMar
% computational logbook)
% close all
% Parameters:
cpol = 100; % nM
rkfdG = 5; % nM-1s-1
rkrdG = 300; % s-1
rkfdT = 5;
rkrdT = 300;
rkcp = 0.012; %s-1
rkfdimTet = 20; % nM-1s-1
rkrdimTet = 10; % s-1
rkfseqTet = 20; % nM-1s-1
rkrseqTet = 10; % s-1

% create datasets
mobj1 = model_protein3;
mobj2 = model_tetR_repression1;

mcmc_info = mcmc_info_constgfp3tetR1(mobj1, mobj2);

mi = mcmc_info.model_info;
mastervec = [rkfdG;rkrdG;rkfdT;rkrdT;rkcp;rkfdimTet;rkrdimTet;rkfseqTet;rkrseqTet;cpol]';
activeNames = {'kfdG'
    'krdG'
    'kfdT'
    'krdT'
    'kcp'
    'kfdimTet'
    'krdimTet'
    'kfseqTet'
    'krseqTet'
    'pol'};
di = data_artificial_v2(...
    {mi(1).modelObj, mi(2).modelObj},...
    {0:60:7200},...
    {mi(1).measuredSpecies, mi(2).measuredSpecies}, ...
    {mi(1).dosedNames, mi(2).dosedNames},...
    {mi(1).dosedVals, mi(2).dosedVals},...
    {mi(1).namesUnord, mi(2).namesUnord},...
    {mastervec(mi(1).paramMaps), mastervec(mi(2).paramMaps)});

da_extract1 = di(1).dataArray;
da_extract2 = di(2).dataArray;
tv = di(1).timeVector;


% plot stuff

% [da, mi, tv] = exportmobj(mi, data_info);
mcmc_trajectories([], di, [], [], [], [], 'just_data_info', true);













