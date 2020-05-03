function data_info_tierra2018
% This file uses the data frem Tierra Biosciences to construct the data
% info object for the calibration correction method. 
% 
% 
% The Tierra Biosciences datasets
% Construct data info objects. Since we only have endpoints, we will assume
% two time points in the whole time trace: the 0 time, and the, say, 1000
% time point (arbitrary units, since the fluorescence data is also in
% arbitrary units). The mcmc_simbio toolbox is directly applicable to
% endpoint data. 
% 
% Oct 20 2018

% The raw data: 

eEC4_s70 = [1.001	2030.244
1.992	2547.673
4.012	4918.893
8.003	8710.281];
    
eEC5_s70 = [1.024	1087.147
2.018	2438.090
4.021	3963.571
8.003	7852.908];

eEC4_pTet = [1.011	2345.755
2.014	5745.380
3.993	12383.330
8.015	26176.006];

eEC5_pTet = [0.991	623.238
2.033	1915.124
3.988	4907.605
7.996	19090.186];

eEC4_aTc = [9.758e-4	2678.741
0.010	4059.145
0.097	8453.616
1.002	13724.319
10.009	11898.379];
    
eEC5_aTc = [9.824e-4	3543.253
0.009	3854.348
0.100	5932.774
0.993	6286.081
10.272	5904.640];


end


