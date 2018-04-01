% constgfp3 and tetRrepression1 simulations to explore some parameter ranges manually
% Did some back of the envelope calculations in notability (FebMar
% computational logbook)
close all
clc
% Parameters:
cpol = 100; % nM
cribo = 50; %nM

rkfdG = 5; % nM-1s-1
rkrdG = 300; % s-1
rkcmG = 0.001; %s-1

rkfdT = 5;
rkrdT = 300;
rkcmT = 0.001; %s-1

rkfpG = 10; % nM-1s-1
rkrpG = 300; % s-1
rkcpG = 1/36;

rkfpT = 10;
rkrpT = 300;
rkcpT = 1/36;

rkfdimTet = 200; % nM-1s-1
rkrdimTet = 100; % s-1

rkfseqTet = 200; % nM-1s-1
rkrseqTet = 100; % s-1

rdel_mT = log(2)/720; % 12 min half life of mrna
rdel_mG = log(2)/720; % 12 min half life of mrna

% create datasets
mobj1 = model_protein5;
mobj2 = model_tetR_repression2;

mcmc_info = mcmc_info_constgfp5tetR2(mobj1, mobj2);

mi = mcmc_info.model_info;

mastervec = [...
    rkfdG
    rkrdG
    rkcmG
    rkfpG
    rkrpG
    rkcpG
    rdel_mG
    cpol
    cribo
    rkfdT
    rkrdT
    rkcmT
    rkfpT
    rkrpT
    rkcpT
    rdel_mT
    rkfdimTet
    rkrdimTet
    rkfseqTet
    rkrseqTet];
ms1 = {mi(1).measuredSpecies{1}, {'mG'}};
ms2 = {mi(2).measuredSpecies{1}, {'mG'},{'pT'}, {'pT2'}, {'mT'}};
di = data_artificial_v2(...
    {mi(1).modelObj, mi(2).modelObj},...
    {0:60:7200},...
    {ms1, ms2}, ...
    {mi(1).dosedNames, mi(2).dosedNames},...
    {mi(1).dosedVals, mi(2).dosedVals},...
    {mi(1).namesUnord, mi(2).namesUnord},...
    {mastervec(mi(1).paramMaps), mastervec(mi(2).paramMaps)});

da_extract1 = di(1).dataArray;
da_extract2 = di(2).dataArray;
tv = di(1).timeVector;


% plot stuff

% [da, mi, tv] = exportmobj(mi, data_info);
fh = mcmc_trajectories([], di, [], [], [], [], 'just_data_info', true);














