function mcmc_info = mcmc_info_constgfp5tetR2(constmobj, tetRmobj)
% two topologies, one geometry each. CSPs and ESPs shared.
%
% ~~~ MODEL1 constitutive gfp 5 ~~~
%
% D + pol <-> D__pol  (k_fd, k_rd)
% D__pol -> D + pol + mrna (kcm)
%
% mrna + ribo <-> mrna__ribo (k_fm, k_rm)
% mrna__ribo <-> mrna + ribo + protein (kcp)
%
% mrna -> null (kcx)
%
%
% MODEL 2: tetRrepression 2.
% dT + pol <-> dT_pol -> dT + pol + mT
% mT + ribo <-> mT_ribo -> mT + ribo + pT
% mT -> null
%
% dG + pol <-> dG_pol -> dG + pol + mG
% mG + ribo <-> mG_ribo -> mG + ribo + pG
% mG -> null
%
% 2 pT <-> pT2
% dG + pT2 <-> dG_pT2


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
circuitInfo1 = ...
    ['D + pol <-> D__pol  (k_fd, k_rd)  \n'...
    'D__pol -> D + pol + mrna (kcm)  \n'...
    'mrna + ribo <-> mrna__ribo (k_fm, k_rm) \n'...
    'mrna__ribo <-> mrna + ribo + protein (kcp) \n'...
    'mrna -> null (kcx)\n' ];



circuitInfo2 = ...
    ['dT + pol <-> dT_pol -> dT + pol + mT  \n'...
    'mT + ribo <-> mT_ribo -> mT + ribo + pT  \n'...
    'mT -> null  \n'...
    'dG + pol <-> dG_pol -> dG + pol + mG  \n'...
    'mG + ribo <-> mG_ribo -> mG + ribo + pG  \n'...
    'mG -> null  \n'...
    '2 pT <-> pT2  \n'...
    'dG + pT2 <-> dG_pT2  \n'];
cpol = 100; % nM
cribo = 50; %nM

rkfdG = 5; % nM-1s-1
rkrdG = 300; % s-1

rkfdT = 5;
rkrdT = 300;

rkcm = 0.001; %s-1

rkfpG = 10; % nM-1s-1
rkrpG = 300; % s-1


rkfpT = 10;
rkrpT = 300;

rkcp = 1/36;

rkfdimTet = 200; % nM-1s-1
rkrdimTet = 100; % s-1

rkfseqTet = 200; % nM-1s-1
rkrseqTet = 100; % s-1

rdel_m = log(2)/720; % 12 min half life of mrna

activeNames1 = {...
    'kfdG'
    'krdG'
    'kfpG'
    'krpG'
    'kcm'
    'kcp'
    'del_m'
    'pol'
    'ribo'};
activeNames2 = ...
    {'kfdG'
    'krdG'
    'kfpG'
    'krpG'
    'kfdT'
    'krdT'
    'kfpT'
    'krpT'
    'kfdimTet'
    'krdimTet'
    'kfseqTet'
    'krseqTet'
    'kcm'
    'kcp'
    'del_m'
    'pol'
    'ribo'};
% master vector

mastervec = log([...
    rkfdG
    rkrdG
    rkfpG
    rkrpG
    rkfdT
    rkrdT
    rkfpT
    rkrpT
    rkfdimTet
    rkrdimTet
    rkfseqTet
    rkrseqTet
    rkcm
    rkcp
    rdel_m
    cpol
    cribo]);

% logp =  log([10 600 0.001 10 300 1/36 log(2)/720...
%              100 50 ...
%              10 600 0.001 10 300 1/36 log(2)/720...
%              200 100 200 100]);

% fixedParams vector
fixedParams = [1 3 5 7 9 11]; % all the kf

% this is the order in which the parameters will be output in.
estParamsIx = setdiff((1:length(mastervec))', fixedParams);  

estParams = activeNames2(estParamsIx);

paramMap1 = [1 2 3 4 13:17]';
paramMap2 = (1:length(mastervec))';

% this is the order in which the parameters will be output in.
paramRanges =  [mastervec(estParamsIx)-3 mastervec(estParamsIx)+3];

% data indices tell us which data set to use for each topology - geometry pair
% from the data_info struct array.
dataIndices1 = 1;
dataIndices2 = 2;

%% next we define the dosing strategy.
dosedNames1 = {'dG'};
dosedVals1 = [10 30 60];
dosedNames2 = {'dT', 'dG'};
dosedVals2 = [0.1 0.1  2 2  8 8  ;
    10 30 10 30 10 30];


measuredSpecies1 = {{'pG'}};
measuredSpecies2 = {{'pG'}};
msIx1 = 1; %
msIx2 = 1;

%% setup the MCMC simulation parameters
stdev = 1; % i have no idea what a good value is
tightening = 1; % i have no idea what a good value is
nW = 40; % actual: 200 - 600 ish
stepsize = 3; % actual: 1.1 to 4 ish
niter = 4; % actual: 2 - 30 ish,
npoints = 4e2; % actual: 2e4 to 2e5 ish (or even 1e6 of the number of
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
    'parallel', false);

% for now we simply make the model_info have just one model (topology).
% But the code will be written in a way such that multiple models can be used.

model_info = struct(...
    'circuitInfo',{circuitInfo1, circuitInfo2},...
    'modelObj', {constmobj, tetRmobj},... % array of model objects (different topologies)
    'modelName', {constmobj.name, tetRmobj.name},...; % model names.
    'namesUnord', {activeNames1, activeNames2}, ... % names of parameters per model, unordered.
    'paramMaps', {paramMap1, paramMap2}, ... % paramMap: matrix mapping models to master vector.
    'dosedNames', {dosedNames1, dosedNames2},... % cell arrays of species. cell array corresponds
    ...                               % to a model.
    'dosedVals', {dosedVals1, dosedVals2},...  % matrices of dose vals
    'measuredSpecies', {measuredSpecies1, measuredSpecies2}, ... % cell array of cell arrays of
    ...                  % species names. the elements of the inner
    ...                  % cell array get summed.
    'measuredSpeciesIndex', {msIx1, msIx2},...
    'dataToMapTo', {dataIndices1, dataIndices2}); % each dataToMapTo property within an
% element of the model_info array is a vector of length # of geometries.


semanticGroups = num2cell((1:length(activeNames2))');
%arrayfun(@num2str, 1:10, 'UniformOutput', false);


estParamsIx = setdiff((1:length(mastervec))', fixedParams);

%% master parameter vector, param ranges,
master_info = struct(...
    'estNames', {estParams},...
    'masterVector', {mastervec},...
    'paramRanges', {paramRanges},...
    'fixedParams', {fixedParams},...
    'semanticGroups', {semanticGroups});

mcmc_info = struct('runsim_info', runsim_info, ...
    'model_info', model_info,...
    'master_info', master_info);

end