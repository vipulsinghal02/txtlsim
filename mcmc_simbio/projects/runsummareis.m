 proj_ZSIFFL_trainingC_v6('stepSize', 1.1,...
'nW', 500,...
'nPoints', 100*500,...
'thinning', 10,...
'nIter', 100,...
'parallel', true, ...
'stepLadder', [],...
'poolsize', 16,...
'pausemode', true,...
'temperatureLadder', [0.00015 0.000125 0.0001],...
'prevtstamp', '20200716_111111_2_1107',...
'prevtstampID', 60)

 proj_ZSIFFL_trainingC_v6('stepSize', 1.1,...
'nW', 500,...
'nPoints', 100*500,...
'thinning', 10,...
'nIter', 100,...
'parallel', true, ...
'stepLadder', [],...
'poolsize', 15,...
'pausemode', true,...
'temperatureLadder', [0.000175 0.00015],...
'prevtstamp', '20200710_230144_2_1292',...
'prevtstampID', 21)



 proj_ZSIFFL_trainingC_v6('stepSize', 1.1,...
'nW', 500,...
'nPoints', 100*500,...
'thinning', 10,...
'nIter', 100,...
'parallel', true, ...
'stepLadder', [],...
'poolsize', 14,...
'pausemode', true,...
'temperatureLadder', [0.0002 0.000175],...
'prevtstamp', '20200703_000710_4_1476',...
'prevtstampID', 40)



 proj_ZSIFFL_trainingC_v6('stepSize', 1.1,...
'nW', 500,...
'nPoints', 100*500,...
'thinning', 10,...
'nIter', 40,...
'parallel', true, ...
'stepLadder', [],...
'poolsize', 15,...
'pausemode', true,...
'temperatureLadder', [0.000275 0.00025 0.000225 0.0002],...
'prevtstamp', '20200627_132326_4_2214',...
'prevtstampID', 29)


tladder =

   1.0e+03 *

    2.0299    1.8454    1.6608    1.4763

Current temperature: 2030 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingC_v6' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingC_v6' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200703_000710' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200703_000710_1_2030'). 

############################################ 
% ----------------------------------------------------------------

 proj_ZSIFFL_trainingC_v6('stepSize', 1.15,...
'nW', 500,...
'nPoints', 100*500,...
'thinning', 10,...
'nIter', 40,...
'parallel', true, ...
'stepLadder', [],...
'poolsize', 15,...
'pausemode', true,...
'temperatureLadder', [0.0005 0.0004 0.00035 0.0003 0.00025 0.0002],...
'prevtstamp', '20200623_175503_1_4429',...
'prevtstampID', 100)

 proj_ZSIFFL_trainingC_v6('stepSize', 1.15,...
'nW', 500,...
'nPoints', 100*500,...
'thinning', 10,...
'nIter', 100,...
'parallel', true, ...
'stepLadder', [],...
'poolsize', 15,...
'pausemode', true,...
'temperatureLadder', [0.0006],...
'prevtstamp', '20200622_121135_1_4429',...
'prevtstampID', 36)



 proj_ZSIFFL_trainingC_v6('stepSize', 1.15,...
'nW', 500,...
'nPoints', 100*500,...
'thinning', 10,...
'nIter', 100,...
'parallel', true, ...
'stepLadder', [],...
'poolsize', 15,...
'pausemode', false,...
'temperatureLadder', [0.0006],...
'prevtstamp', '20200621_100025_1_4429',...
'prevtstampID', 10)


%  need to run 0.0005 or 0.0006 for a while, because the 3oc12 Kd is not going to its correct region. 
% this is an example of reannealing. I looked at the 3OC12 trace plots at 
% ts35 = '20200614_005043_4_3691';%100  %%cumulativefrom17 2950 + 130
% which used 0.0005. 
% Can probably raise the step size to 1.25 or 1.3 for this one. 
 proj_ZSIFFL_trainingC_v6('stepSize', 1.15,...
'nW', 500,...
'nPoints', 100*500,...
'thinning', 10,...
'nIter', 100,...
'parallel', true, ...
'stepLadder', [],...
'poolsize', 14,...
'pausemode', false,...
'temperatureLadder', [0.0006],...
'prevtstamp', '20200619_213706_2_1476',...
'prevtstampID', 2)




% ---------------------------------------------------------------------------

 proj_ZSIFFL_trainingC_v6('stepSize', 1.15,...
'nW', 500,...
'nPoints', 100*500,...
'thinning', 10,...
'nIter', 40,...
'parallel', true, ...
'stepLadder', [],...
'poolsize', 14,...
'pausemode', false,...
'temperatureLadder', [0.0003 0.0002 0.0002 0.000175 0.00015 0.000125],...
'prevtstamp', '20200616_183409_2_2214',...
'prevtstampID', 39)

tladder =

   1.0e+03 *

    2.2144    1.4763    1.4763    1.2917    1.1072    0.9227

Current temperature: 2214 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingC_v6' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingC_v6' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200619_213706' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200619_213706_1_2214'). 

############################################ 


% -----------------------------------------------------






 % made step size a bit smaller too. since rejection rate was like 85% in the prev step size. at the first temp. 
 proj_ZSIFFL_trainingC_v6('stepSize', 1.15,...
'nW', 500,...
'nPoints', 100*500,...
'thinning', 10,...
'nIter', 40,...
'parallel', true, ...
'stepLadder', [],...
'poolsize', 16,...
'pausemode', true,...
'temperatureLadder', [0.0004 0.0003 0.0002],...
'prevtstamp', '20200615_233435_1_2953',...
'prevtstampID', 22) %20200615_233435_1_2953_ID22
tladder =

   1.0e+03 *

    2.9526    2.2144    1.4763

Current temperature: 2953 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingC_v6' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingC_v6' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200616_183409' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200616_183409_1_2953'). 

############################################ 

 
 % 20200614_005043_5_2953 iter 5
 proj_ZSIFFL_trainingC_v6('stepSize', 1.25,...
'nW', 500,...
'nPoints', 100*500,...
'thinning', 10,...
'nIter', 40,...
'parallel', true, ...
'stepLadder', [],...
'poolsize', 16,...
'pausemode', true,...
'temperatureLadder', [0.0004 0.0003 0.0002],...
'prevtstamp', '20200614_005043_5_2953',...
'prevtstampID', 5)% terminated because i accidentally unplugged the PC. Lol.

 proj_ZSIFFL_trainingC_v6('stepSize', 1.1,...
'nW', 500,...
'nPoints', 100*500,...
'thinning', 10,...
'nIter', 10,...
'parallel', true, ...
'stepLadder', [],...
'poolsize', 16,...
'pausemode', true,...
'temperatureLadder', [0.0002 0.0003 0.0004 0.0005 0.0004 0.0003 0.0002],...
'prevtstamp', '20200612_214710_1_1476',...
'prevtstampID', 3)
tladder =

   1.0e+03 *

    1.4763    2.2144    2.9526    3.6907    2.9526    2.2144    1.4763

Current temperature: 1476 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingC_v6' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingC_v6' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200614_005043' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200614_005043_1_1476'). 

############################################ 



 
% ---------------------------------------------------------------
% windows update stopped the run

 proj_ZSIFFL_trainingC_v6('stepSize', 1.1,...
'nW', 500,...
'nPoints', 100*500,...
'thinning', 10,...
'nIter', 10,...
'parallel', true, ...
'stepLadder', [],...
'poolsize', 16,...
'pausemode', true,...
'temperatureLadder', [0.0002 0.0003 0.0004 0.0005 0.0004 0.0003 0.0002],...
'prevtstamp', '20200610_000545_2_738',...
'prevtstampID', 28)

tladder =

   1.0e+03 *

    1.4763    2.2144    2.9526    3.6907    2.9526    2.2144    1.4763

Current temperature: 1476 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingC_v6' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingC_v6' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200612_214710' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200612_214710_1_1476'). 

############################################ 









 
% ---------------------------------------------------------------
 
% ---------------------------------------------------------------
 
% ---------------------------------------------------------------
 
% ---------------------------------------------------------------
 
% ---------------------------------------------------------------
 
% ---------------------------------------------------------------
 
% ---------------------------------------------------------------

% ---------------------------------------------------------------
% the 3OC12KD was moving towards 0 too slowly. going to raise the temp and have it converge at
% that higher temp first. then anneal to lower temps. Plot:
        % ts17 = '20200603_044203_1_2214'; %200, changed to 500 walkers. %%cumulativefrom17 200
        % ts18 = '20200603_044203_2_1845';%70 %%cumulativefrom17 270
        % ts19 = '20200604_073858_1_1845'; %200 %%cumulativefrom17 470
        % ts20 = '20200604_073858_2_1476'; % 50  %%cumulativefrom17 520
        % ts21 = '20200605_045501_1_1476';% 200  %%cumulativefrom17 720
        % ts22 = '20200605_045501_2_1181';% 200 %%cumulativefrom17 920
        % ts23 = '20200605_045501_3_1033';% 200 %%cumulativefrom17 1120
        % ts24 = '20200605_045501_4_886';% 200 %%cumulativefrom17 1320
        % ts25 = '20200605_045501_5_738';% 200 %%cumulativefrom17 1520
        % ts26 = '20200605_045501_6_591';% 200  %%cumulativefrom17 1590
        % ts27 = '20200605_045501_7_443';% 200
        % ts28 = '20200609_190458_1_1033'; %50
        % ts29 = '20200610_000545_1_1033';
        % ts30 = '20200610_000545_2_738';
        % tstamp = {ts17 ...
        %      ts18 ts19 ts20 ts21 ts22 ts23 ts24 ts25 ts26 ts27 ts28 ts29 ts30};
        % nIterID = {1:20 1:7 1:20 1:5  1:20  1:20  1:20  1:20 1:20 1:20 1:20 1:5 1:40 1:28};

        % to see!
proj_ZSIFFL_trainingC_v5('stepSize', 1.1,...
'nW', 500,...
'nPoints', 100*500,...
'thinning', 10,...
'nIter', 40,...
'parallel', true, ...
'stepLadder', [],...
'poolsize', 16,...
'pausemode', true,...
'temperatureLadder', [0.00014 0.0001 0.00014 0.0001 0.00014 0.0001 0.00014 0.0001 ],...
'prevtstamp', '20200609_190458_1_1033',...
'prevtstampID', 5)

tladder =

   1.0e+03 *

    1.0334    0.7381    1.0334    0.7381    1.0334    0.7381    1.0334    0.7381

Current temperature: 1033 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingC_v5' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingC_v5' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200610_000545' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200610_000545_1_1033'). 
%---------------------------------------------------------------

% current
%relax the parameter ranges!
 proj_ZSIFFL_trainingC_v5('stepSize', 1.2,...
'nW', 500,...
'nPoints', 100*500,...
'thinning', 10,...
'nIter', 40,...
'parallel', true, ...
'stepLadder', [],...
'poolsize', 15,...
'pausemode', true,...
'temperatureLadder', [0.00014 0.0001 0.00014 0.0001 0.00014 0.0001 0.00014 0.0001 ],...
'prevtstamp', '20200605_045501_7_443',...
'prevtstampID', 20)

tladder =

   1.0e+03 *

    1.0334    0.7381    1.0334    0.7381    1.0334    0.7381    1.0334    0.7381

Current temperature: 1033 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingC_v5' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingC_v5' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200609_190458' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200609_190458_1_1033'). 

############################################ 






% -----------------------------------------------------------------
% -----------------------------------------------------------------
% -----------------------------------------------------------------
% -----------------------------------------------------------------
% -----------------------------------------------------------------
% -----------------------------------------------------------------
% -----------------------------------------------------------------
% -----------------------------------------------------------------
% -----------------------------------------------------------------
% -----------------------------------------------------------------
% -----------------------------------------------------------------
% -----------------------------------------------------------------
% -----------------------------------------------------------------
% -----------------------------------------------------------------
% -----------------------------------------------------------------
% -----------------------------------------------------------------
% -----------------------------------------------------------------
% -----------------------------------------------------------------
% -----------------------------------------------------------------
% -----------------------------------------------------------------
% -----------------------------------------------------------------
% -----------------------------------------------------------------
% -----------------------------------------------------------------
% -----------------------------------------------------------------
% -----------------------------------------------------------------
 proj_ZSIFFL_trainingC_v4('stepSize', 1.2,...
'nW', 500,...
'nPoints', 100*500,...
'thinning', 10,...
'nIter', 20,...
'parallel', true, ...
'stepLadder', [],...
'poolsize', 15,...
'pausemode', true,...
'temperatureLadder', [0.0002 0.00016 0.00014 0.00012 0.0001 0.00008 0.00006],...
'prevtstamp', '20200604_073858_2_1476',...
'prevtstampID', 5)
 tladder =

   1.0e+03 *

    1.4763    1.1810    1.0334    0.8858    0.7381    0.5905    0.4429

% -------------------------------------------------------
 proj_ZSIFFL_trainingC_v4('stepSize', 1.2,...
'nW', 500,...
'nPoints', 100*500,...
'thinning', 10,...
'nIter', 20,...
'parallel', true, ...
'stepLadder', [],...
'poolsize', 15,...
'pausemode', true,...
'temperatureLadder', [0.00025 0.0002 0.00016 0.00014 0.00012 0.0001 0.00008 0.00006],...
'prevtstamp', '20200603_044203_2_1845',...
'prevtstampID', 7)
% -----------------------------------------------------------------------
 proj_ZSIFFL_trainingC_v4('stepSize', 1.2,...
'nW', 500,...
'nPoints', 100*500,...
'thinning', 10,...
'nIter', 20,...
'parallel', true, ...
'stepLadder', [],...
'poolsize', 15,...
'pausemode', true,...
'temperatureLadder', [0.0003 0.00025 0.0002 0.00016 0.00014 0.00012 0.0001 0.00008 0.00006],...
'prevtstamp', '20200525_114752_1_1329',...
'prevtstampID', 2)
tladder =

   1.0e+03 *

    2.2144    1.8454    1.4763    1.1810    1.0334    0.8858    0.7381    0.5905    0.4429

Current temperature: 2214 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingC_v4' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingC_v4' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200603_044203' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200603_044203_1_2214'). 


% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
% ---------------------------------------------------------
proj_ZSIFFL_trainingF_v4('stepSize', 1.2,...
'nW', 200,...
'nPoints', 100*200,...
'thinning', 10,...
'nIter', 30,...
'parallel', true, ...
'poolsize', 15,...
'pausemode', true,...
'temperatureLadder', [0.00001 0.000015 0.00001],...
'stepLadder', [1], ...
'prevtstamp', '20200530_163844_3_37',...
 'prevtstampID', 20)

% just continuing from v4. 
proj_ZSIFFL_trainingF_v4('stepSize', 1.2,...
'nW', 200,...
'nPoints', 100*200,...
'thinning', 10,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 15,...
'pausemode', true,...
'temperatureLadder', [0.00001 0.0000075 0.000005],...
'stepLadder', [1], ...
'prevtstamp', '20200530_033747_2_74',...
 'prevtstampID', 7)

% just continuing from v4. 
proj_ZSIFFL_trainingF_v4('stepSize', 1.2,...
'nW', 200,...
'nPoints', 100*200,...
'thinning', 10,...
'nIter', 15,...
'parallel', true, ...
'poolsize', 16,...
'pausemode', true,...
'temperatureLadder', [0.00002 0.00001 0.0000075 0.000005],...
'stepLadder', [1], ...
'prevtstamp', '20200529_040611_3_148',...
 'prevtstampID', 5)





% ---------------------------------------------------------

proj_ZSIFFL_trainingF_v5('stepSize', 1.2,...
'nW', 200,...
'nPoints', 100*200,...
'thinning', 10,...
'nIter', 10,...
'parallel', true, ...
'poolsize', 16,...
'pausemode', true,...
'temperatureLadder', [0.00002 0.00001 0.0000075 0.000005],...
'stepLadder', [1], ...
'prevtstamp', '20200529_040611_3_148',...
 'prevtstampID', 5)
% ran the first two of this to full. but acutally I dont think i want to expand the ranges. 
% the previous ranges are ok. 
tladder =

  147.6283   73.8141   55.3606   36.9071

Current temperature: 148 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingF_v5' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingF_v5' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200529_171720' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200529_171720_1_148'). 

############################################ 

User initialized intitial walker positions, skipping burn in phase
Iteration number 1.
starting mcmc 1
current step size: 1.200000e+00
ending mcmc 1
Elapsed time is 1733.255869 seconds.
Iteration number 2.
Pausing for 5 minutes to cool the CPU before starting run number 2. 
starting mcmc 2
current step size: 1.200000e+00
ending mcmc 2
Elapsed time is 1714.860324 seconds.
Iteration number 3.
starting mcmc 3
current step size: 1.200000e+00
ending mcmc 3
Elapsed time is 1716.809535 seconds.
Iteration number 4.
Pausing for 5 minutes to cool the CPU before starting run number 4. 
starting mcmc 4
current step size: 1.200000e+00
ending mcmc 4
Elapsed time is 1724.710128 seconds.
Iteration number 5.
Parallel pool using the 'local' profile is shutting down.
Starting parallel pool (parpool) using the 'local' profile ...
Connected to the parallel pool (number of workers: 16).

ans = 

 ProcessPool with properties: 

            Connected: true
           NumWorkers: 16
              Cluster: local
        AttachedFiles: {}
    AutoAddClientPath: true
          IdleTimeout: 30 minutes (30 minutes remaining)
          SpmdEnabled: true

starting mcmc 5
current step size: 1.200000e+00
ending mcmc 5
Elapsed time is 1701.854840 seconds.
Iteration number 6.
Pausing for 5 minutes to cool the CPU before starting run number 6. 
starting mcmc 6
current step size: 1.200000e+00
ending mcmc 6
Elapsed time is 1712.434500 seconds.
Iteration number 7.
starting mcmc 7
current step size: 1.200000e+00
ending mcmc 7
Elapsed time is 1685.503761 seconds.
Iteration number 8.
Pausing for 5 minutes to cool the CPU before starting run number 8. 
starting mcmc 8
current step size: 1.200000e+00
ending mcmc 8
Elapsed time is 1691.480490 seconds.
Iteration number 9.
starting mcmc 9
current step size: 1.200000e+00
ending mcmc 9
Elapsed time is 1673.494287 seconds.
Iteration number 10.
Pausing for 5 minutes to cool the CPU before starting run number 10. 
Parallel pool using the 'local' profile is shutting down.
Starting parallel pool (parpool) using the 'local' profile ...
Connected to the parallel pool (number of workers: 16).

ans = 

 ProcessPool with properties: 

            Connected: true
           NumWorkers: 16
              Cluster: local
        AttachedFiles: {}
    AutoAddClientPath: true
          IdleTimeout: 30 minutes (30 minutes remaining)
          SpmdEnabled: true

starting mcmc 10
current step size: 1.200000e+00
ending mcmc 10
Elapsed time is 1658.910324 seconds.

initialization_used =

    'User_initialized'

Current temperature: 74 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingF_v5' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingF_v5' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200529_222651' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200529_171720_2_74'). 

############################################ 

User initialized intitial walker positions, skipping burn in phase
Iteration number 1.
starting mcmc 1
current step size: 1.200000e+00
ending mcmc 1
Elapsed time is 1666.573252 seconds.
Iteration number 2.
Pausing for 5 minutes to cool the CPU before starting run number 2. 
starting mcmc 2
current step size: 1.200000e+00
ending mcmc 2
Elapsed time is 1689.891939 seconds.
Iteration number 3.
starting mcmc 3
current step size: 1.200000e+00
ending mcmc 3
Elapsed time is 1679.672888 seconds.
Iteration number 4.
Pausing for 5 minutes to cool the CPU before starting run number 4. 
starting mcmc 4
current step size: 1.200000e+00
ending mcmc 4
Elapsed time is 1679.763085 seconds.
Iteration number 5.
Parallel pool using the 'local' profile is shutting down.
Starting parallel pool (parpool) using the 'local' profile ...
Connected to the parallel pool (number of workers: 16).

ans = 

 ProcessPool with properties: 

            Connected: true
           NumWorkers: 16
              Cluster: local
        AttachedFiles: {}
    AutoAddClientPath: true
          IdleTimeout: 30 minutes (30 minutes remaining)
          SpmdEnabled: true

starting mcmc 5
current step size: 1.200000e+00
ending mcmc 5
Elapsed time is 1716.745386 seconds.
Iteration number 6.
Pausing for 5 minutes to cool the CPU before starting run number 6. 
starting mcmc 6
current step size: 1.200000e+00
ending mcmc 6
Elapsed time is 1662.689971 seconds.
Iteration number 7.
starting mcmc 7
current step size: 1.200000e+00
ending mcmc 7
Elapsed time is 1593.271627 seconds.
Iteration number 8.
Pausing for 5 minutes to cool the CPU before starting run number 8. 
starting mcmc 8
current step size: 1.200000e+00
ending mcmc 8
Elapsed time is 1560.813107 seconds.
Iteration number 9.
starting mcmc 9
current step size: 1.200000e+00
ending mcmc 9
Elapsed time is 1574.856654 seconds.
Iteration number 10.
Pausing for 5 minutes to cool the CPU before starting run number 10. 
Parallel pool using the 'local' profile is shutting down.
Starting parallel pool (parpool) using the 'local' profile ...
Connected to the parallel pool (number of workers: 16).

ans = 

 ProcessPool with properties: 

            Connected: true
           NumWorkers: 16
              Cluster: local
        AttachedFiles: {}
    AutoAddClientPath: true
          IdleTimeout: 30 minutes (30 minutes remaining)
          SpmdEnabled: true

starting mcmc 10
current step size: 1.200000e+00
ending mcmc 10
Elapsed time is 1589.653241 seconds.

% --------------------------------------------------
% the pol upper limit was limiting things. also, 100 iters at 200 walkers is perfect. 
proj_ZSIFFL_trainingF_v4('stepSize', 1.2,...
'nW', 200,...
'nPoints', 100*200,...
'thinning', 10,...
'nIter', 10,...
'parallel', true, ...
'poolsize', 16,...
'pausemode', true,...
'temperatureLadder', [0.0001 0.000075 0.00005 0.000035 0.00002],...
'stepLadder', [1])
tladder =

  738.1415  553.6061  369.0707  258.3495  147.6283

Current temperature: 738 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingF_v4' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingF_v4' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200528_165131' 

Project directory does not exist. Creating it, and using this to store data
 (in a subdirectory named 'simdata_20200528_165131_1_738'). 


% --------------------------------------------------------
% the pol upper limit was limiting things. also, 100 iters at 200 walkers is perfect. 
proj_ZSIFFL_trainingF_v3('stepSize', 1.2,...
'nW', 200,...
'nPoints', 100*200,...
'thinning', 10,...
'nIter', 10,...
'parallel', true, ...
'poolsize', 16,...
'pausemode', true,...
'temperatureLadder', [0.0002 0.0001 0.000075 0.00005 0.000035 0.00002],...
'stepLadder', [1])
tladder =

   1.0e+03 *

    1.4763    0.7381    0.5536    0.3691    0.2583    0.1476

Current temperature: 1476 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingF_v3' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingF_v3' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200527_224901' 

Project directory does not exist. Creating it, and using this to store data
 (in a subdirectory named 'simdata_20200527_224901_1_1476'). 

############################################ 

Testing integrability for dose number 1.
Testing integrability for dose number 2.
Testing integrability for dose number 3.
Testing integrability for dose number 4.
Testing integrability for dose number 5.
Testing integrability for dose number 6.
Testing integrability for dose number 7.
Elapsed time is 14.195716 seconds.
Testing integrability for dose number 1.
Testing integrability for dose number 2.
Testing integrability for dose number 3.
Testing integrability for dose number 4.
Testing integrability for dose number 5.
Testing integrability for dose number 6.
Testing integrability for dose number 7.
Elapsed time is 14.557499 seconds.
Testing integrability for dose number 1.
Testing integrability for dose number 2.
Testing integrability for dose number 3.
Testing integrability for dose number 4.
Testing integrability for dose number 5.
Testing integrability for dose number 6.
Testing integrability for dose number 7.
Elapsed time is 15.305348 seconds.
Testing integrability for dose number 1.
Testing integrability for dose number 2.
Testing integrability for dose number 3.
Testing integrability for dose number 4.
Testing integrability for dose number 5.
Testing integrability for dose number 6.
Testing integrability for dose number 7.
Elapsed time is 11.417738 seconds.
Testing integrability for dose number 1.
Testing integrability for dose number 2.
Testing integrability for dose number 3.
Testing integrability for dose number 4.
Testing integrability for dose number 5.
Testing integrability for dose number 6.
Testing integrability for dose number 7.
Elapsed time is 13.707813 seconds.
600 points out of 600 are integrable. Need 200 walkers.
Step size ladder being used, skipping burn in phase

ans =

     1

Iteration number 1.
starting mcmc 1
current step size: 1.200000e+00
ending mcmc 1
Elapsed time is 1541.497343 seconds.
Iteration number 2.
Pausing for 5 minutes to cool the CPU before starting run number 2. 
starting mcmc 2
current step size: 1.200000e+00
ending mcmc 2
Elapsed time is 1576.963598 seconds.
Iteration number 3.
starting mcmc 3
current step size: 1.200000e+00
ending mcmc 3
Elapsed time is 1607.745375 seconds.
Iteration number 4.
Pausing for 5 minutes to cool the CPU before starting run number 4. 
starting mcmc 4
current step size: 1.200000e+00
ending mcmc 4
Elapsed time is 1585.472600 seconds.
Iteration number 5.
starting mcmc 5
current step size: 1.200000e+00
ending mcmc 5
Elapsed time is 1584.316339 seconds.
Iteration number 6.
Pausing for 5 minutes to cool the CPU before starting run number 6. 
starting mcmc 6
current step size: 1.200000e+00
ending mcmc 6
Elapsed time is 1608.715737 seconds.
Iteration number 7.
starting mcmc 7
current step size: 1.200000e+00
ending mcmc 7
Elapsed time is 1561.542199 seconds.
Iteration number 8.
Pausing for 5 minutes to cool the CPU before starting run number 8. 
starting mcmc 8
current step size: 1.200000e+00
ending mcmc 8
Elapsed time is 1609.173530 seconds.
Iteration number 9.
starting mcmc 9
current step size: 1.200000e+00
ending mcmc 9
Elapsed time is 1610.572522 seconds.
Iteration number 10.
Pausing for 5 minutes to cool the CPU before starting run number 10. 
starting mcmc 10
current step size: 1.200000e+00
ending mcmc 10
Elapsed time is 1615.652927 seconds.

initialization_used =

    'LHS'

Current temperature: 738 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingF_v3' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingF_v3' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200528_034033' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200527_224901_2_738'). 

############################################ 

User initialized intitial walker positions, skipping burn in phase
Iteration number 1.
starting mcmc 1
current step size: 1.200000e+00
ending mcmc 1
Elapsed time is 1687.816284 seconds.
Iteration number 2.
Pausing for 5 minutes to cool the CPU before starting run number 2. 
starting mcmc 2
current step size: 1.200000e+00
ending mcmc 2
Elapsed time is 1650.268113 seconds.
Iteration number 3.
starting mcmc 3
current step size: 1.200000e+00
ending mcmc 3
Elapsed time is 1670.410327 seconds.
Iteration number 4.
Pausing for 5 minutes to cool the CPU before starting run number 4. 
starting mcmc 4
current step size: 1.200000e+00
ending mcmc 4
Elapsed time is 1671.276670 seconds.
Iteration number 5.
starting mcmc 5
current step size: 1.200000e+00
ending mcmc 5
Elapsed time is 1643.537627 seconds.
Iteration number 6.
Pausing for 5 minutes to cool the CPU before starting run number 6. 
starting mcmc 6
current step size: 1.200000e+00
ending mcmc 6
Elapsed time is 1668.498196 seconds.
Iteration number 7.
starting mcmc 7
current step size: 1.200000e+00
ending mcmc 7
Elapsed time is 1683.241815 seconds.
Iteration number 8.
Pausing for 5 minutes to cool the CPU before starting run number 8. 
starting mcmc 8
current step size: 1.200000e+00
ending mcmc 8
Elapsed time is 1727.843888 seconds.
Iteration number 9.
starting mcmc 9
current step size: 1.200000e+00
ending mcmc 9
Elapsed time is 1752.417364 seconds.
Iteration number 10.
Pausing for 5 minutes to cool the CPU before starting run number 10. 
starting mcmc 10
current step size: 1.200000e+00
ending mcmc 10
Elapsed time is 1761.394344 seconds.

initialization_used =

    'User_initialized'

Current temperature: 554 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingF_v3' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingF_v3' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200528_084732' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200527_224901_3_554'). 

############################################ 

User initialized intitial walker positions, skipping burn in phase
Iteration number 1.
starting mcmc 1
current step size: 1.200000e+00
ending mcmc 1
Elapsed time is 1830.269250 seconds.
Iteration number 2.
Pausing for 5 minutes to cool the CPU before starting run number 2. 
starting mcmc 2
current step size: 1.200000e+00
ending mcmc 2
Elapsed time is 1860.361478 seconds.
Iteration number 3.
starting mcmc 3
current step size: 1.200000e+00
ending mcmc 3
Elapsed time is 1975.606293 seconds.
Iteration number 4.
Pausing for 5 minutes to cool the CPU before starting run number 4. 
starting mcmc 4
current step size: 1.200000e+00
ending mcmc 4
Elapsed time is 1930.130077 seconds.
Iteration number 5.
starting mcmc 5
current step size: 1.200000e+00
ending mcmc 5
Elapsed time is 1943.453326 seconds.
Iteration number 6.
Pausing for 5 minutes to cool the CPU before starting run number 6. 
starting mcmc 6
current step size: 1.200000e+00
ending mcmc 6
Elapsed time is 2021.022547 seconds.
Iteration number 7.
starting mcmc 7
current step size: 1.200000e+00
ending mcmc 7
Elapsed time is 2104.785617 seconds.
Iteration number 8.
Pausing for 5 minutes to cool the CPU before starting run number 8. 
starting mcmc 8
current step size: 1.200000e+00
ending mcmc 8
Elapsed time is 2220.351267 seconds.
Iteration number 9.
starting mcmc 9
current step size: 1.200000e+00
ending mcmc 9
Elapsed time is 2374.974797 seconds.
Iteration number 10.
Pausing for 5 minutes to cool the CPU before starting run number 10. 
starting mcmc 10
current step size: 1.200000e+00
ending mcmc 10
Elapsed time is 2699.324960 seconds.

initialization_used =

    'User_initialized'

Current temperature: 369 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingF_v3' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingF_v3' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200528_150155' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200527_224901_4_369'). 

############################################ 

User initialized intitial walker positions, skipping burn in phase
Iteration number 1.
starting mcmc 1
current step size: 1.200000e+00
ending mcmc 1
Elapsed time is 2619.929782 seconds.
Iteration number 2.
Pausing for 5 minutes to cool the CPU before starting run number 2. 
starting mcmc 2
current step size: 1.200000e+00
ending mcmc 2
Elapsed time is 2950.872142 seconds.
Iteration number 3.
starting mcmc 3
current step size: 1.200000e+00

GWMCMC  11.0% [****····································] 00:00:40
 73% rejected
       25
     24.9
     4.18
      8.6
     10.9
     10.1
     28.9
      5.9
       15


% this has both 9.7 as the tau and the las limits relaxed to 20. see evernote. 
proj_ZSIFFL_trainingF_v2('stepSize', 1.2,...
'nW', 200,...
'nPoints', 100*200,...
'thinning', 10,...
'nIter', 10,...
'parallel', true, ...
'poolsize', 16,...
'pausemode', true,...
'temperatureLadder', [0.0002 0.0001 0.0001 0.00005 0.00005 0.000025],...
'stepLadder', [1])

tladder =

   1.0e+03 *

    1.4763    0.7381    0.7381    0.3691    0.3691    0.1845

Current temperature: 1476 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingF_v2' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingF_v2' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200527_151014' 

Project directory does not exist. Creating it, and using this to store data
 (in a subdirectory named 'simdata_20200527_151014_1_1476'). 

############################################ 

Testing integrability for dose number 1.
Testing integrability for dose number 2.
Testing integrability for dose number 3.
Testing integrability for dose number 4.
Testing integrability for dose number 5.
Testing integrability for dose number 6.
Testing integrability for dose number 7.
Elapsed time is 13.442223 seconds.
Testing integrability for dose number 1.
Testing integrability for dose number 2.
Testing integrability for dose number 3.
Testing integrability for dose number 4.
Testing integrability for dose number 5.
Testing integrability for dose number 6.
Testing integrability for dose number 7.
Elapsed time is 13.517321 seconds.
Testing integrability for dose number 1.
Testing integrability for dose number 2.
Testing integrability for dose number 3.
Testing integrability for dose number 4.
Testing integrability for dose number 5.
Testing integrability for dose number 6.
Testing integrability for dose number 7.
Elapsed time is 14.067345 seconds.
Testing integrability for dose number 1.
Testing integrability for dose number 2.
Testing integrability for dose number 3.
Testing integrability for dose number 4.
Testing integrability for dose number 5.
Testing integrability for dose number 6.
Testing integrability for dose number 7.
Elapsed time is 11.149971 seconds.
Testing integrability for dose number 1.
Testing integrability for dose number 2.
Testing integrability for dose number 3.
Testing integrability for dose number 4.
Testing integrability for dose number 5.
Testing integrability for dose number 6.
Testing integrability for dose number 7.
Elapsed time is 13.229422 seconds.
600 points out of 600 are integrable. Need 200 walkers.
Step size ladder being used, skipping burn in phase

ans =

     1

Iteration number 1.
starting mcmc 1
current step size: 1.200000e+00
ending mcmc 1
Elapsed time is 1579.520505 seconds.
Iteration number 2.
Pausing for 5 minutes to cool the CPU before starting run number 2. 
starting mcmc 2
current step size: 1.200000e+00
ending mcmc 2
Elapsed time is 1723.842851 seconds.
Iteration number 3.
starting mcmc 3
current step size: 1.200000e+00
ending mcmc 3
Elapsed time is 1778.020447 seconds.
Iteration number 4.
Pausing for 5 minutes to cool the CPU before starting run number 4. 
starting mcmc 4
current step size: 1.200000e+00
ending mcmc 4
Elapsed time is 1753.187650 seconds.
Iteration number 5.
starting mcmc 5
current step size: 1.200000e+00
ending mcmc 5
Elapsed time is 1728.074410 seconds.
Iteration number 6.
Pausing for 5 minutes to cool the CPU before starting run number 6. 
starting mcmc 6
current step size: 1.200000e+00
ending mcmc 6
Elapsed time is 1693.210388 seconds.
Iteration number 7.
starting mcmc 7
current step size: 1.200000e+00
ending mcmc 7
Elapsed time is 1677.295291 seconds.
Iteration number 8.
Pausing for 5 minutes to cool the CPU before starting run number 8. 
starting mcmc 8
current step size: 1.200000e+00
ending mcmc 8
Elapsed time is 1630.838864 seconds.
Iteration number 9.
starting mcmc 9
current step size: 1.200000e+00
ending mcmc 9
Elapsed time is 1635.793370 seconds.
Iteration number 10.
Pausing for 5 minutes to cool the CPU before starting run number 10. 
starting mcmc 10
current step size: 1.200000e+00
ending mcmc 10
Elapsed time is 1583.805603 seconds.

initialization_used =

    'LHS'

Current temperature: 738 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingF_v2' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingF_v2' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200527_201627' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200527_151014_2_738'). 

############################################ 

User initialized intitial walker positions, skipping burn in phase
Iteration number 1.
starting mcmc 1
current step size: 1.200000e+00
ending mcmc 1
Elapsed time is 1644.988380 seconds.
Iteration number 2.
Pausing for 5 minutes to cool the CPU before starting run number 2. 
starting mcmc 2
current step size: 1.200000e+00
ending mcmc 2
Elapsed time is 1638.944014 seconds.
Iteration number 3.
starting mcmc 3
current step size: 1.200000e+00
ending mcmc 3
Elapsed time is 1644.486967 seconds.
Iteration number 4.
Pausing for 5 minutes to cool the CPU before starting run number 4. 
starting mcmc 4
current step size: 1.200000e+00
ending mcmc 4
Elapsed time is 1661.804370 seconds.
Iteration number 5.
starting mcmc 5
current step size: 1.200000e+00
ending mcmc 5
Elapsed time is 1696.801386 seconds.


%------------------------------------------------------------

%------------------------------------------------------------

%------------------------------------------------------------

%------------------------------------------------------------

%------------------------------------------------------------

%------------------------------------------------------------

%------------------------------------------------------------

%------------------------------------------------------------

%------------------------------------------------------------

%------------------------------------------------------------

%------------------------------------------------------------

%------------------------------------------------------------
% TODO
% these are not done.. idk if i will have the time. maybe sneak these in sometim. 
% check if LHS comes to the same solution:
proj_ZSIFFL_trainingE_v2('stepSize', 1.2,...
'nW', 480,...
'nPoints', 50*480,...
'thinning', 10,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 20,...
'temperatureLadder', [0.0002 0.0001 0.00005],...
'stepLadder', [1])

% check if the stuck chains and the chains in the other line move to the main line at high temps. 
proj_ZSIFFL_trainingE_v2('stepSize', 1.04,...
'nW', 480,...
'nPoints', 100*480,...
'thinning', 10,...
'nIter', 30,...
'parallel', true, ...
'poolsize', 26,...
'temperatureLadder', [0.001 0.0002 0.0001 0.00005],...
'stepLadder', [1], ...
'prevtstamp', '20200527_033000_1_37',...
 'prevtstampID', 1)





%------------------------------------------------------------

%------------------------------------------------------------

%------------------------------------------------------------

%------------------------------------------------------------

%------------------------------------------------------------

%------------------------------------------------------------

%------------------------------------------------------------

%------------------------------------------------------------

%------------------------------------------------------------

%------------------------------------------------------------

%------------------------------------------------------------

%------------------------------------------------------------

%------------------------------------------------------------

%------------------------------------------------------------

%------------------------------------------------------------

%------------------------------------------------------------

%------------------------------------------------------------














%------------------------------------------------------------
proj_ZSIFFL_trainingE_v2('stepSize', 1.04,...
'nW', 480,...
'nPoints', 100*480,...
'thinning', 10,...
'nIter', 4,...
'parallel', true, ...
'poolsize', 26,...
'temperatureLadder', [0.00001 0.000007 0.00001 0.00003 0.00003 0.00003 0.00003],...
'stepLadder', [1], ...
'prevtstamp', '20200527_033000_1_37',...
 'prevtstampID', 1)

tladder =

   73.8141   51.6699   73.8141  221.4424  221.4424  221.4424  221.4424

Current temperature: 74 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingE_v2' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingE_v2' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200527_045239' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200527_045239_1_74'). 
.
.
.
.
.
.
.
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingE_v2' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingE_v2' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200527_132349' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200527_045239_3_74'). 

############################################ 

User initialized intitial walker positions, skipping burn in phase
Iteration number 1.
starting mcmc 1
current step size: 1.040000e+00
ending mcmc 1
Elapsed time is 3798.456496 seconds.
Iteration number 2.
starting mcmc 2
current step size: 1.040000e+00

GWMCMC  43.0% [*****************·······················] 00:00:49
 82% rejected
     22.6
     9.16
     3.98
     2.77
     9.66
     8.53
     31.5
     4.47
     13.1










%------------------------------------------------------------

proj_ZSIFFL_trainingE_v2('stepSize', 1.05,...
'nW', 480,...
'nPoints', 100*480,...
'thinning', 10,...
'nIter', 4,...
'parallel', true, ...
'poolsize', 16,...
'temperatureLadder', [0.000005 0.000007 0.00001 0.00003 0.00003 0.00003 0.00003],...
'stepLadder', [1], ...
'prevtstamp', '20200526_204312_1_258',...
 'prevtstampID', 6)
tladder =

   36.9071   51.6699   73.8141  221.4424  221.4424  221.4424  221.4424

Current temperature: 37 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingE_v2' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingE_v2' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200527_033000' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200527_033000_1_37'). 

############################################ 

User initialized intitial walker positions, skipping burn in phase
Iteration number 1.
starting mcmc 1
current step size: 1.050000e+00
ending mcmc 1
Elapsed time is 3992.590295 seconds.


%------------------------------------











proj_ZSIFFL_trainingE_v2('stepSize', 1.07,...
'nW', 480,...
'nPoints', 100*480,...
'thinning', 10,...
'nIter', 10,...
'parallel', true, ...
'poolsize', 26,...
'temperatureLadder', [0.000035 0.00002 0.00001],...
'stepLadder', [1], ...
'prevtstamp', '20200526_033216_2_369',...
 'prevtstampID', 6)
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingE_v2' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingE_v2' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200526_204312' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200526_204312_1_258'). 

############################################ 

User initialized intitial walker positions, skipping burn in phase
Iteration number 1.
starting mcmc 1
current step size: 1.070000e+00
ending mcmc 1
Elapsed time is 3608.104743 seconds.
Iteration number 2.
starting mcmc 2
current step size: 1.070000e+00
ending mcmc 2
Elapsed time is 3671.618699 seconds.
Iteration number 3.
starting mcmc 3
current step size: 1.070000e+00
ending mcmc 3
Elapsed time is 3716.979950 seconds.
Iteration number 4.
starting mcmc 4
current step size: 1.070000e+00
ending mcmc 4
Elapsed time is 3670.435221 seconds.
Iteration number 5.
starting mcmc 5
current step size: 1.070000e+00
ending mcmc 5
Elapsed time is 3623.805290 seconds.

% ----------------------------------------------------------

proj_ZSIFFL_trainingE_v2('stepSize', 1.07,...
'nW', 480,...
'nPoints', 100*480,...
'thinning', 10,...
'nIter', 10,...
'parallel', true, ...
'poolsize', 22,...
'temperatureLadder', [0.0001 0.00005 0.00002 0.00001],...
'stepLadder', [1], ...
'prevtstamp', '20200525_201859_2_1476',...
 'prevtstampID', 2)


tladder =

  738.1415  369.0707  147.6283   73.8141

Current temperature: 738 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingE_v2' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingE_v2' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200526_033216' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200526_033216_1_738'). 

############################################ 

User initialized intitial walker positions, skipping burn in phase
Iteration number 1.
starting mcmc 1
current step size: 1.070000e+00
ending mcmc 1
Elapsed time is 3764.578412 seconds.
Iteration number 2.
starting mcmc 2
current step size: 1.070000e+00
ending mcmc 2
Elapsed time is 3776.959224 seconds.
Iteration number 3.
starting mcmc 3
current step size: 1.070000e+00
ending mcmc 3
Elapsed time is 3791.021571 seconds.
Iteration number 4.
starting mcmc 4
current step size: 1.070000e+00
ending mcmc 4
Elapsed time is 3811.608027 seconds.
Iteration number 5.
starting mcmc 5
current step size: 1.070000e+00
ending mcmc 5
Elapsed time is 3784.770744 seconds.
Iteration number 6.
starting mcmc 6
current step size: 1.070000e+00
ending mcmc 6
Elapsed time is 3796.370411 seconds.
Iteration number 7.
starting mcmc 7
current step size: 1.070000e+00
ending mcmc 7
Elapsed time is 3800.666527 seconds.
Iteration number 8.
starting mcmc 8
current step size: 1.070000e+00
ending mcmc 8
Elapsed time is 3774.052860 seconds.
Iteration number 9.
starting mcmc 9
current step size: 1.070000e+00
ending mcmc 9
Elapsed time is 3755.500666 seconds.
Iteration number 10.
starting mcmc 10
current step size: 1.070000e+00
ending mcmc 10
Elapsed time is 3690.292679 seconds.

initialization_used =

    'User_initialized'

Current temperature: 369 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingE_v2' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingE_v2' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200526_140215' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200526_033216_2_369'). 

############################################ 

User initialized intitial walker positions, skipping burn in phase
Iteration number 1.
starting mcmc 1
current step size: 1.070000e+00
ending mcmc 1
Elapsed time is 3695.899260 seconds.
Iteration number 2.
starting mcmc 2
current step size: 1.070000e+00
ending mcmc 2
Elapsed time is 3854.531759 seconds.
Iteration number 3.
starting mcmc 3
current step size: 1.070000e+00
ending mcmc 3
Elapsed time is 3891.521085 seconds.
Iteration number 4.
starting mcmc 4
current step size: 1.070000e+00
ending mcmc 4
Elapsed time is 3852.394801 seconds.
Iteration number 5.
starting mcmc 5
current step size: 1.070000e+00
ending mcmc 5
Elapsed time is 3893.928171 seconds.
Iteration number 6.
starting mcmc 6
current step size: 1.070000e+00
ending mcmc 6
Elapsed time is 3765.807443 seconds.


% --------------------------------------------------------------

proj_ZSIFFL_trainingE_v2('stepSize', 1.1,...
'nW', 480,...
'nPoints', 100*480,...
'thinning', 10,...
'nIter', 5,...
'parallel', true, ...
'poolsize', 22,...
'temperatureLadder', [ 0.00025 0.0002 0.00015 0.0001 0.00008 0.00005 0.00002 0.00001],...
'stepLadder', [1], ...
'prevtstamp', '20200525_181748_1_1845',...
 'prevtstampID', 2)


Using temperature ladder for MCMC at the following temperatures.

tladder =

   1.0e+03 *

    1.8454    1.4763    1.1072    0.7381    0.5905    0.3691    0.1476    0.0738

Current temperature: 1845 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingE_v2' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingE_v2' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200525_201859' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200525_201859_1_1845'). 

############################################ 

User initialized intitial walker positions, skipping burn in phase
Iteration number 1.
starting mcmc 1
current step size: 1.100000e+00
ending mcmc 1
Elapsed time is 3524.319948 seconds.
Iteration number 2.
starting mcmc 2
current step size: 1.100000e+00
ending mcmc 2
Elapsed time is 3561.751503 seconds.
Iteration number 3.
starting mcmc 3
current step size: 1.100000e+00
ending mcmc 3
Elapsed time is 3375.998114 seconds.
Iteration number 4.
starting mcmc 4
current step size: 1.100000e+00
ending mcmc 4
Elapsed time is 3449.591700 seconds.
Iteration number 5.
starting mcmc 5
current step size: 1.100000e+00
ending mcmc 5
Elapsed time is 3404.951576 seconds.

initialization_used =

    'User_initialized'

Current temperature: 1476 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingE_v2' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingE_v2' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200526_010804' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200525_201859_2_1476'). 

############################################ 

User initialized intitial walker positions, skipping burn in phase
Iteration number 1.
starting mcmc 1
current step size: 1.100000e+00
ending mcmc 1
Elapsed time is 3504.807797 seconds.
Iteration number 2.
starting mcmc 2
current step size: 1.100000e+00
ending mcmc 2
Elapsed time is 3588.091873 seconds.

% -----------------------------------------------------------------------


proj_ZSIFFL_trainingE_v2('stepSize', 1.1,...
'nW', 480,...
'nPoints', 100*480,...
'thinning', 10,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 24,...
'temperatureLadder', [ 0.00025 0.0001],...
'stepLadder', [1], ...
'prevtstamp', '20190512_155207_1_1845',...
 'prevtstampID', 7)

Current temperature: 1845 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingE_v2' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingE_v2' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200525_181748' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200525_181748_1_1845'). 

############################################ 
User initialized intitial walker positions, skipping burn in phase
Iteration number 1.
starting mcmc 1
current step size: 1.100000e+00
ending mcmc 1
Elapsed time is 3549.535720 seconds.
Iteration number 2.
starting mcmc 2
current step size: 1.100000e+00
ending mcmc 2
Elapsed time is 3489.609662 seconds.



% -----------------------------------------------------------------------


% -----------------------------------------------------------------------


% -----------------------------------------------------------------------




% -----------------------------------------------------------------------

% running on the default profile! temps sitting at 70 - 75C. seems to do a run in 3825 seconds. 
% with 24 coes in eco mode, this time is: 3900. so not really a significant increase.
 % and temperature wise eco mode is a lot better




% -----------------------------------------------------------------------
proj_ZSIFFL_trainingC_v3('stepSize', 1.2,...
'nW', 1000,...
'nPoints', 100*1000,...
'thinning', 10,...
'nIter', 10,...
'parallel', true, ...
'stepLadder', [],...
'poolsize', 20,...
'pausemode', false,...
'temperatureLadder', [0.00018 0.00012 0.00008 0.00004 0.00002],...
'prevtstamp', '20200524_233515_1_2214',...
'prevtstampID', 10)



Parallel pool using the 'local' profile is shutting down.
Starting parallel pool (parpool) using the 'local' profile ...
Connected to the parallel pool (number of workers: 20).

ans = 

 ProcessPool with properties: 

            Connected: true
           NumWorkers: 20
              Cluster: local
        AttachedFiles: {}
    AutoAddClientPath: true
          IdleTimeout: 30 minutes (30 minutes remaining)
          SpmdEnabled: true

Using temperature ladder for MCMC at the following temperatures.

tladder =

   1.0e+03 *

    1.3287    0.8858    0.5905    0.2953    0.1476

Current temperature: 1329 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingC_v3' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingC_v3' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200525_114752' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200525_114752_1_1329'). 
User initialized intitial walker positions, skipping burn in phase
Iteration number 1.
starting mcmc 1
current step size: 1.200000e+00
ending mcmc 1
Elapsed time is 4139.217076 seconds.
Iteration number 2.
starting mcmc 2
current step size: 1.200000e+00
ending mcmc 2
Elapsed time is 4251.798351 seconds.
% -----------------------------------------------------------------------



% 16 threads, eco mode
proj_ZSIFFL_trainingC_v3('stepSize', 1.2,...
'nW', 1000,...
'nPoints', 100*1000,...
'thinning', 10,...
'nIter', 20,...
'parallel', true, ...
'stepLadder', [],...
'poolsize', 16,...
'pausemode', false,...
'temperatureLadder', [0.0003 0.0003],...
'prevtstamp', '20200524_185508_1_2214',...
'prevtstampID', 4)
% run 1: 4303 seconds, 
% run 2: 4419  seconds
% instantaneous ensemble average effective clock speed: 1950 MHz (instantaneous averages over 32 threads)
% time average of ensemble average effective clock speed: 1823


 ProcessPool with properties: 

            Connected: true
           NumWorkers: 16
              Cluster: local
        AttachedFiles: {}
    AutoAddClientPath: true
          IdleTimeout: 30 minutes (30 minutes remaining)
          SpmdEnabled: true

Using temperature ladder for MCMC at the following temperatures.

tladder =

   1.0e+03 *

    2.2144    2.2144

Current temperature: 2214 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingC_v3' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingC_v3' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200524_233515' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200524_233515_1_2214'). 


Iteration number 1.
starting mcmc 1
current step size: 1.200000e+00
ending mcmc 1
Elapsed time is 4303.465326 seconds.
Iteration number 2.
starting mcmc 2
current step size: 1.200000e+00
ending mcmc 2
Elapsed time is 4392.309262 seconds.
Iteration number 3.
starting mcmc 3
current step size: 1.200000e+00
ending mcmc 3
Elapsed time is 4291.811187 seconds.
Iteration number 4.
starting mcmc 4
current step size: 1.200000e+00
ending mcmc 4
Elapsed time is 4258.890747 seconds.
Iteration number 5.
Mixup round! The step size for this iteration is set to 
 1 * 1.200000e+00 = 1.200000e+00.
starting mcmc 5
current step size: 1.200000e+00
ending mcmc 5
Elapsed time is 4419.825923 seconds.
Iteration number 6.
starting mcmc 6
current step size: 1.200000e+00
ending mcmc 6
Elapsed time is 4370.744514 seconds.
Iteration number 7.
starting mcmc 7
current step size: 1.200000e+00
ending mcmc 7
Elapsed time is 4395.382659 seconds.
Iteration number 8.
starting mcmc 8
current step size: 1.200000e+00
ending mcmc 8
Elapsed time is 4422.488004 seconds.

% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------



% 20 threads, eco mode
proj_ZSIFFL_trainingC_v3('stepSize', 1.2,...
'nW', 1000,...
'nPoints', 100*1000,...
'thinning', 10,...
'nIter', 20,...
'parallel', true, ...
'stepLadder', [],...
'poolsize', 20,...
'pausemode', false,...
'temperatureLadder', [0.0003 0.0003],...
'prevtstamp', '20200524_163232_1_2214',...
'prevtstampID', 2)
% time per run: 4122  seconds, run 2: 3917, run 3: 4019
% instantaneous ensemble average effective clock speed: 2350 MHz (instantaneous averages over 32 threads)
% time average of ensemble average effective clock speed: 2250, 2216


 ProcessPool with properties: 

            Connected: true
           NumWorkers: 20
              Cluster: local
        AttachedFiles: {}
    AutoAddClientPath: true
          IdleTimeout: 30 minutes (30 minutes remaining)
          SpmdEnabled: true

Using temperature ladder for MCMC at the following temperatures.

tladder =

   1.0e+03 *

    2.2144    2.2144

Current temperature: 2214 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingC_v3' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingC_v3' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200524_185508' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200524_185508_1_2214'). 


% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% 22 threads, eco mode

proj_ZSIFFL_trainingC_v3('stepSize', 1.2,...
'nW', 1000,...
'nPoints', 100*1000,...
'thinning', 10,...
'nIter', 20,...
'parallel', true, ...
'stepLadder', [],...
'poolsize', 22,...
'pausemode', false,...
'temperatureLadder', [0.0003 0.0003],...
'prevtstamp', '20200524_140951_1_2214',...
'prevtstampID', 2)

% time per run: 4076 seconds, run 2: 4066 seconds
% instantaneous ensemble average effective clock speed: 2500 MHz (instantaneous averages over 32 threads)
% time average of ensemble average effective clock speed: 2401

User initialized intitial walker positions, skipping burn in phase
Iteration number 1.
starting mcmc 1
current step size: 1.200000e+00
ending mcmc 1
Elapsed time is 4076.818058 seconds.

############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingC_v3' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingC_v3' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200524_163232' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200524_163232_1_2214'). 

############################################ 








% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
%--------------------------------------------------------------------



% 30 cores eco mode
proj_ZSIFFL_trainingC_v3('stepSize', 1.2,...
'nW', 1000,...
'nPoints', 100*1000,...
'thinning', 10,...
'nIter', 20,...
'parallel', true, ...
'stepLadder', [],...
'poolsize', 30,...
'pausemode', false,...
'temperatureLadder', [0.0003 0.0003],...
'prevtstamp', '20200524_123605_1_2214',...
'prevtstampID', 1)

% 30 threads. lets see how this goes. 
% time per run: 4120 seconds, run 2: 4082
% average effective clock speed: 2700-3200
% average of average effective clock speed: 2975

############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingC_v3' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingC_v3' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200524_140951' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200524_140951_1_2214'). 

############################################ 

User initialized intitial walker positions, skipping burn in phase
Iteration number 1.
starting mcmc 1
current step size: 1.200000e+00
ending mcmc 1
Elapsed time is 4120.322531 seconds.
Iteration number 2.
starting mcmc 2
current step size: 1.200000e+00
ending mcmc 2
Elapsed time is 4082.624658 seconds.

############################################ 











% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -------------------------------------------------
proj_ZSIFFL_trainingC_v3('stepSize', 1.2,...
'nW', 1000,...
'nPoints', 100*1000,...
'thinning', 10,...
'nIter', 20,...
'parallel', true, ...
'stepLadder', [],...
'poolsize', 16,...
'pausemode', false,...
'temperatureLadder', [0.0003 0.0002],...
'prevtstamp', '20200523_200855_2_2214',...
'prevtstampID', 4)
%   QUESTION IS IF THE TIME TAKEN WILL BE MORE OR LESS WITH 16 CORES. ALSO TRY 
% 20 CORES, AND 32 CORES. THEN WE WILL HAVE A NICE SET OF DATA POINTS. 
% time for a run = 4500 seconds
% effective clock speed: 1900MHz (all 32 threads)


 ProcessPool with properties: 

            Connected: true
           NumWorkers: 16
              Cluster: local
        AttachedFiles: {}
    AutoAddClientPath: true
          IdleTimeout: 30 minutes (30 minutes remaining)
          SpmdEnabled: true

Using temperature ladder for MCMC at the following temperatures.

tladder =

   1.0e+03 *

    2.2144    1.4763

Current temperature: 2214 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingC_v3' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingC_v3' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200524_123605' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200524_123605_1_2214'). 

############################################ 

%---------% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% ----------------------------------------------------------------


proj_ZSIFFL_trainingC_v3('stepSize', 1.2,...
'nW', 1000,...
'nPoints', 100*1000,...
'thinning', 10,...
'nIter', 10,...
'parallel', true, ...
'stepLadder', [],...
'poolsize', 24,...
'pausemode', true,...
'temperatureLadder', [0.0005 0.0003 0.0002],...
'prevtstamp', '20200523_135237_1_5536',...
'prevtstampID', 5)

% NOTE THE 24 THREADS: time for a run: 4000 seconds
% Effecti=ve clock speed: 2700MHz. all 32threads
% time averaged is probably around 2600?

Using temperature ladder for MCMC at the following temperatures.

tladder =

   1.0e+03 *

    3.6907    2.2144    1.4763


Parallel pool using the 'local' profile is shutting down.
Starting parallel pool (parpool) using the 'local' profile ...
Connected to the parallel pool (number of workers: 24).

ans = 

 ProcessPool with properties: 

            Connected: true
           NumWorkers: 24
              Cluster: local
        AttachedFiles: {}
    AutoAddClientPath: true
          IdleTimeout: 30 minutes (30 minutes remaining)
          SpmdEnabled: true

Using temperature ladder for MCMC at the following temperatures.

tladder =

   1.0e+03 *

    3.6907    2.2144    1.4763

Current temperature: 3691 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingC_v3' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingC_v3' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200523_200855' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200523_200855_1_3691'). 

############################################ 

User initialized intitial walker positions, skipping burn in phase
Iteration number 1.
starting mcmc 1
current step size: 1.200000e+00
ending mcmc 1
Elapsed time is 3948.928533 seconds.
Iteration number 2.
Pausing for 5 minutes to cool the CPU before starting run number 2. 
starting mcmc 2
current step size: 1.200000e+00
ending mcmc 2
Elapsed time is 3948.995872 seconds.
Iteration number 3.
starting mcmc 3
current step size: 1.200000e+00
ending mcmc 3
Elapsed time is 3989.391465 seconds.
Iteration number 4.
Pausing for 5 minutes to cool the CPU before starting run number 4. 
starting mcmc 4
current step size: 1.200000e+00
ending mcmc 4
Elapsed time is 4038.652555 seconds.
Iteration number 5.
Mixup round! The step size for this iteration is set to 
 1 * 1.200000e+00 = 1.200000e+00.
starting mcmc 5
current step size: 1.200000e+00
ending mcmc 5
Elapsed time is 4075.281491 seconds.
Iteration number 6.
Pausing for 5 minutes to cool the CPU before starting run number 6. 
starting mcmc 6
current step size: 1.200000e+00
ending mcmc 6
Elapsed time is 4170.121697 seconds.
Iteration number 7.
starting mcmc 7
current step size: 1.200000e+00
ending mcmc 7
Elapsed time is 4125.102159 seconds.
Iteration number 8.
Pausing for 5 minutes to cool the CPU before starting run number 8. 
starting mcmc 8
current step size: 1.200000e+00
ending mcmc 8
Elapsed time is 3963.097530 seconds.
Iteration number 9.
starting mcmc 9
current step size: 1.200000e+00
ending mcmc 9
Elapsed time is 3954.981484 seconds.
Iteration number 10.
Pausing for 5 minutes to cool the CPU before starting run number 10. 
Mixup round! The step size for this iteration is set to 
 1 * 1.200000e+00 = 1.200000e+00.
starting mcmc 10
current step size: 1.200000e+00
ending mcmc 10
Elapsed time is 3957.902806 seconds.

initialization_used =

    'User_initialized'

Current temperature: 2214 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingC_v3' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingC_v3' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200524_074349' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200523_200855_2_2214'). 

############################################ 

Parallel pool using the 'local' profile is shutting down.
Starting parallel pool (parpool) using the 'local' profile ...
Connected to the parallel pool (number of workers: 24).

ans = 

 ProcessPool with properties: 

            Connected: true
           NumWorkers: 24
              Cluster: local
        AttachedFiles: {}
    AutoAddClientPath: true
          IdleTimeout: 30 minutes (30 minutes remaining)
          SpmdEnabled: true

User initialized intitial walker positions, skipping burn in phase
Iteration number 1.
starting mcmc 1
current step size: 1.200000e+00
ending mcmc 1
Elapsed time is 3999.003327 seconds.
Iteration number 2.
Pausing for 5 minutes to cool the CPU before starting run number 2. 
starting mcmc 2
current step size: 1.200000e+00
ending mcmc 2
Elapsed time is 4055.004786 seconds.
Iteration number 3.
starting mcmc 3
current step size: 1.200000e+00
ending mcmc 3
Elapsed time is 4036.793049 seconds.
Iteration number 4.
Pausing for 5 minutes to cool the CPU before starting run number 4. 
starting mcmc 4
current step size: 1.200000e+00
ending mcmc 4
Elapsed time is 4078.355643 seconds.
Iteration number 5.
Mixup round! The step size for this iteration is set to 
 1 * 1.200000e+00 = 1.200000e+00.
starting mcmc 5
current step size: 1.200000e+00



% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
%----------------------------------------------------------------------------------------


proj_ZSIFFL_trainingC_v3('stepSize', 1.2,...
'nW', 1000,...
'nPoints', 100*1000,...
'thinning', 10,...
'nIter', 5,...
'parallel', true, ...
'poolsize', 16,...
'pausemode', true,...
'temperatureLadder', [0.00075 0.0005 0.0005 0.00025 0.00025],...
'prevtstamp', '20200523_044512_2_5536',...
'prevtstampID', 3)



Starting parallel pool (parpool) using the 'local' profile ...
Connected to the parallel pool (number of workers: 16).

ans = 

 ProcessPool with properties: 

            Connected: true
           NumWorkers: 16
              Cluster: local
        AttachedFiles: {}
    AutoAddClientPath: true
          IdleTimeout: 30 minutes (30 minutes remaining)
          SpmdEnabled: true

Using temperature ladder for MCMC at the following temperatures.

tladder =

   1.0e+03 *

    5.5361    3.6907    3.6907    1.8454    1.8454

Current temperature: 5536 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingC_v3' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingC_v3' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200523_135237' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200523_135237_1_5536'). 

############################################ 



User initialized intitial walker positions, skipping burn in phase
Iteration number 1.
starting mcmc 1
current step size: 1.320000e+00
ending mcmc 1
Elapsed time is 3319.830474 seconds.
Iteration number 2.
Pausing for 5 minutes to cool the CPU before starting run number 2. 
starting mcmc 2
current step size: 1.280000e+00
ending mcmc 2
Elapsed time is 3544.020435 seconds.
Iteration number 3.
starting mcmc 3
current step size: 1.240000e+00
ending mcmc 3
Elapsed time is 3835.236316 seconds.
Iteration number 4.
Pausing for 5 minutes to cool the CPU before starting run number 4. 
starting mcmc 4
current step size: 1.200000e+00
ending mcmc 4
Elapsed time is 4269.744037 seconds.
Iteration number 5.
starting mcmc 5
current step size: 1.200000e+00
ending mcmc 5
Elapsed time is 4283.711301 seconds.


--------------------------------------------------------






proj_ZSIFFL_trainingC_v3('stepSize', 1.2,...
'nW', 1000,...
'nPoints', 100*1000,...
'thinning', 10,...
'nIter', 5,...
'parallel', true, ...
'poolsize', 16,...
'pausemode', true,...
'temperatureLadder', [0.001 0.00075 0.00075 0.0005 0.0005 0.00025 0.00025],...
'prevtstamp', '20200522_224032_1_7381',...
'prevtstampID', 5)




Using temperature ladder for MCMC at the following temperatures.

tladder =

   1.0e+03 *

    7.3814    5.5361    5.5361    3.6907    3.6907    1.8454    1.8454

Current temperature: 7381 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingC_v3' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingC_v3' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200523_044512' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200523_044512_1_7381'). 

############################################ 



############################################ 

User initialized intitial walker positions, skipping burn in phase
Iteration number 1.
starting mcmc 1
current step size: 1.320000e+00
ending mcmc 1
Elapsed time is 3477.701745 seconds.
Iteration number 2.
Pausing for 5 minutes to cool the CPU before starting run number 2. 
starting mcmc 2
current step size: 1.280000e+00
ending mcmc 2
Elapsed time is 3779.390779 seconds.
Iteration number 3.
starting mcmc 3
current step size: 1.240000e+00
ending mcmc 3
Elapsed time is 3912.653680 seconds.
Iteration number 4.
Pausing for 5 minutes to cool the CPU before starting run number 4. 
starting mcmc 4
current step size: 1.200000e+00
ending mcmc 4
Elapsed time is 4289.022254 seconds.
Iteration number 5.
starting mcmc 5
current step size: 1.200000e+00
ending mcmc 5
Elapsed time is 4315.906966 seconds.

initialization_used =

    'User_initialized'

Current temperature: 5536 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingC_v3' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingC_v3' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200523_102506' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200523_044512_2_5536'). 

############################################ 

User initialized intitial walker positions, skipping burn in phase
Iteration number 1.
starting mcmc 1
current step size: 1.320000e+00
ending mcmc 1
Elapsed time is 3410.332140 seconds.
Iteration number 2.
Pausing for 5 minutes to cool the CPU before starting run number 2. 
starting mcmc 2
current step size: 1.280000e+00
ending mcmc 2
Elapsed time is 3666.679864 seconds.
Iteration number 3.
starting mcmc 3
current step size: 1.240000e+00
ending mcmc 3
Elapsed time is 3937.126962 seconds.
Iteration number 4.
Pausing for 5 minutes to cool the CPU before starting run number 4. 
starting mcmc 4
current step size: 1.200000e+00


-----------------------------------------

proj_ZSIFFL_trainingC_v3('stepSize', 1.2,...
'nW', 1000,...
'nPoints', 100*1000,...
'thinning', 10,...
'nIter', 10,...
'parallel', true, ...
'poolsize', 15,...
'pausemode', true,...
'temperatureLadder', [0.001 0.00075 0.0005 0.0002 0.0001],...
'prevtstamp', '20200521_154748_3_14763',...
'prevtstampID', 8)

ans = 

 ProcessPool with properties: 

            Connected: true
           NumWorkers: 15
              Cluster: local
        AttachedFiles: {}
    AutoAddClientPath: true
          IdleTimeout: 30 minutes (30 minutes remaining)
          SpmdEnabled: true

Using temperature ladder for MCMC at the following temperatures.

tladder =

   1.0e+03 *

    7.3814    5.5361    3.6907    1.4763    0.7381

Current temperature: 7381 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingC_v3' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingC_v3' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200522_224032' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200522_224032_1_7381'). 
%---------------------------------------------------------------------------------




proj_ZSIFFL_trainingC_v3('stepSize', 1.2,...
'nW', 1000,...
'nPoints', 100*1000,...
'thinning', 10,...
'nIter', 10,...
'parallel', true, ...
'poolsize', 15,...
'temperatureLadder', [0.01 0.005 0.002 0.001 0.00075 0.0005 0.0002 0.0001])



Parallel pool using the 'local' profile is shutting down.
Starting parallel pool (parpool) using the 'local' profile ...
Connected to the parallel pool (number of workers: 15).

ans = 

 ProcessPool with properties: 

            Connected: true
           NumWorkers: 15
              Cluster: local
        AttachedFiles: {}
    AutoAddClientPath: true
          IdleTimeout: 30 minutes (30 minutes remaining)
          SpmdEnabled: true

Using temperature ladder for MCMC at the following temperatures.

tladder =

   1.0e+04 *

    7.3814    3.6907    1.4763    0.7381    0.5536    0.3691    0.1476    0.0738

Current temperature: 73814 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingC_v3' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingC_v3' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200521_154748' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200521_154748_1_73814'). 

############################################ 

%---------------------------------------------------------






proj_ZSIFFL_trainingC_v2('stepSize', 1.2,...
'nW', 1000,...
'nPoints', 100*1000,...
'thinning', 10,...
'nIter', 10,...
'parallel', true, ...
'poolsize', 16,...
'temperatureLadder', [0.01 0.005 0.002 0.001 0.00075 0.0005 0.0002 0.0001])

tladder =

   1.0e+04 *

    7.3814    3.6907    1.4763    0.7381    0.5536    0.3691    0.1476    0.0738

Current temperature: 73814 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingC_v2' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingC_v2' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200521_005205' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200521_005205_1_73814'). 
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------

proj_ZSIFFL_trainingD_v2('stepSize', 1.2,...
'nW', 1000,...
'nPoints', 50*1000,...
'thinning', 10,...
'nIter', 30,...
'parallel', true, ...
'poolsize', 16,...
'temperatureLadder', [0.0004 0.0002 0.0001],...
'prevtstamp', '20200520_173710_1_73814',...
'prevtstampID', 9)

Parallel pool using the 'local' profile is shutting down.
Starting parallel pool (parpool) using the 'local' profile ...
Connected to the parallel pool (number of workers: 16).

ans = 

 ProcessPool with properties: 

            Connected: true
           NumWorkers: 16
              Cluster: local
        AttachedFiles: {}
    AutoAddClientPath: true
          IdleTimeout: 30 minutes (30 minutes remaining)
          SpmdEnabled: true

Using temperature ladder for MCMC at the following temperatures.

tladder =

   1.0e+03 *

    2.9526    1.4763    0.7381

Current temperature: 2953 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingD_v2' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingD_v2' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200520_230212' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200520_230212_1_2953'). 

############################################ 

%------------------------------------------------------------------------------------




% too hot. not a good fit. see evernote 040 MAY 2020 ZSIFFL
proj_ZSIFFL_trainingD_v2('stepSize', 1.2,...
'nW', 1000,...
'nPoints', 50*1000,...
'thinning', 10,...
'nIter', 10,...
'parallel', true, ...
'poolsize', 16,...
'temperatureLadder', [0.01 0.005 0.0025 0.001],...
'prevtstamp', '20200519_181148_3_2953',...
'prevtstampID', 4)


Using temperature ladder for MCMC at the following temperatures.

tladder =

   1.0e+04 *

    7.3814    3.6907    1.8454    0.7381

Current temperature: 73814 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingD_v2' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingD_v2' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200520_173710' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200520_173710_1_73814'). 

############################################ 








% Looks like the chains arent mixing as well. so i think we try raising the temps a lot (to 0.01) and scale down to 0.001. 



proj_ZSIFFL_trainingD_v2('stepSize', 1.2,...
'nW', 1000,...
'nPoints', 50*1000,...
'thinning', 10,...
'nIter', 15,...
'parallel', true, ...
'poolsize', 14,...
'temperatureLadder', [0.00075 0.0005 0.0004 0.0003 0.0002 0.0001],...
'prevtstamp', '20200519_011552_2_5536',...
'prevtstampID', 6)



Using temperature ladder for MCMC at the following temperatures.

tladder =

   1.0e+03 *

    5.5361    3.6907    2.9526    2.2144    1.4763    0.7381

Current temperature: 5536 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingD_v2' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingD_v2' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200519_181148' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200519_181148_1_5536'). 

############################################ 

tladder =

   1.0e+03 *

    5.5361    3.6907    2.9526    2.2144    1.4763    0.7381

Current temperature: 5536 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingD_v2' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingD_v2' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200519_181148' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200519_181148_1_5536'). 

############################################ 

User initialized intitial walker positions, skipping burn in phase
Iteration number 1.
starting mcmc 1
current step size: 1.320000e+00
ending mcmc 1
Elapsed time is 2210.174466 seconds.
Iteration number 2.
starting mcmc 2
current step size: 1.320000e+00
ending mcmc 2
Elapsed time is 2214.431175 seconds.
Iteration number 3.
starting mcmc 3
current step size: 1.280000e+00
ending mcmc 3
Elapsed time is 2142.348140 seconds.
Iteration number 4.
starting mcmc 4
current step size: 1.280000e+00
ending mcmc 4
Elapsed time is 2261.987848 seconds.
Iteration number 5.
starting mcmc 5
current step size: 1.240000e+00
ending mcmc 5
Elapsed time is 2372.090672 seconds.
Iteration number 6.
starting mcmc 6
current step size: 1.240000e+00
ending mcmc 6
Elapsed time is 2409.592600 seconds.
Iteration number 7.
starting mcmc 7
current step size: 1.200000e+00
ending mcmc 7
Elapsed time is 2599.087726 seconds.
Iteration number 8.
starting mcmc 8
current step size: 1.200000e+00
ending mcmc 8
Elapsed time is 2823.869639 seconds.
Iteration number 9.
starting mcmc 9
current step size: 1.200000e+00
ending mcmc 9
Elapsed time is 2802.134105 seconds.
Iteration number 10.
starting mcmc 10
current step size: 1.200000e+00
ending mcmc 10
Elapsed time is 2553.171344 seconds.
Iteration number 11.
starting mcmc 11
current step size: 1.200000e+00
ending mcmc 11
Elapsed time is 2531.097156 seconds.
Iteration number 12.
starting mcmc 12
current step size: 1.200000e+00
ending mcmc 12
Elapsed time is 2533.969690 seconds.
Iteration number 13.
starting mcmc 13
current step size: 1.200000e+00
ending mcmc 13
Elapsed time is 2536.949839 seconds.
Iteration number 14.
starting mcmc 14
current step size: 1.200000e+00
ending mcmc 14
Elapsed time is 2572.635250 seconds.
Iteration number 15.
starting mcmc 15
current step size: 1.200000e+00
ending mcmc 15
Elapsed time is 2517.574239 seconds.

initialization_used =

    'User_initialized'

Current temperature: 3691 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingD_v2' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingD_v2' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200520_043019' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200519_181148_2_3691'). 

############################################ 

User initialized intitial walker positions, skipping burn in phase
Iteration number 1.
starting mcmc 1
current step size: 1.320000e+00
ending mcmc 1
Elapsed time is 2063.881000 seconds.
Iteration number 2.
starting mcmc 2
current step size: 1.320000e+00
ending mcmc 2
Elapsed time is 2064.260924 seconds.
Iteration number 3.
starting mcmc 3
current step size: 1.280000e+00
ending mcmc 3
Elapsed time is 2191.519664 seconds.
Iteration number 4.
starting mcmc 4
current step size: 1.280000e+00
ending mcmc 4
Elapsed time is 2223.035443 seconds.
Iteration number 5.
starting mcmc 5
current step size: 1.240000e+00
ending mcmc 5
Elapsed time is 2341.746961 seconds.
Iteration number 6.
starting mcmc 6
current step size: 1.240000e+00
ending mcmc 6
Elapsed time is 2399.007359 seconds.
Iteration number 7.
starting mcmc 7
current step size: 1.200000e+00
ending mcmc 7
Elapsed time is 2566.596137 seconds.
Iteration number 8.
starting mcmc 8
current step size: 1.200000e+00
ending mcmc 8
Elapsed time is 2564.533153 seconds.
Iteration number 9.
starting mcmc 9
current step size: 1.200000e+00
ending mcmc 9
Elapsed time is 2555.117758 seconds.
Iteration number 10.
starting mcmc 10
current step size: 1.200000e+00
ending mcmc 10
Elapsed time is 2571.915896 seconds.
Iteration number 11.
starting mcmc 11
current step size: 1.200000e+00
ending mcmc 11
Elapsed time is 2568.428106 seconds.
Iteration number 12.
starting mcmc 12
current step size: 1.200000e+00
ending mcmc 12
Elapsed time is 2598.123690 seconds.
Iteration number 13.
starting mcmc 13
current step size: 1.200000e+00
ending mcmc 13
Elapsed time is 2617.615356 seconds.
Iteration number 14.
starting mcmc 14
current step size: 1.200000e+00
ending mcmc 14
Elapsed time is 2641.267944 seconds.
Iteration number 15.
starting mcmc 15
current step size: 1.200000e+00
ending mcmc 15
Elapsed time is 2731.392442 seconds.

initialization_used =

    'User_initialized'

Current temperature: 2953 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingD_v2' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingD_v2' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200520_144159' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200519_181148_3_2953'). 

############################################ 

User initialized intitial walker positions, skipping burn in phase
Iteration number 1.
starting mcmc 1
current step size: 1.320000e+00
ending mcmc 1
Elapsed time is 2229.921641 seconds.
Iteration number 2.
starting mcmc 2
current step size: 1.320000e+00
ending mcmc 2
Elapsed time is 2195.816288 seconds.
Iteration number 3.
starting mcmc 3
current step size: 1.280000e+00
ending mcmc 3
Elapsed time is 2336.074255 seconds.
Iteration number 4.
starting mcmc 4
current step size: 1.280000e+00
ending mcmc 4
Elapsed time is 2408.353332 seconds.
Iteration number 5.
starting mcmc 5
current step size: 1.240000e+00

GWMCMC  40.0% [****************························] 00:00:12
 78% rejected
      4.6
     1.86
     19.8
    -2.19
     19.8
     9.68
     9.46
     6.29
     10.6
       34
     4.34
     7.18
% =------------------------------------------------------------------------

















proj_ZSIFFL_trainingD_v2('stepSize', 1.2,...
'nW', 1000,...
'nPoints', 50*1000,...
'thinning', 10,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 16,...
'temperatureLadder', [0.001 0.00075 0.0005 0.0004 0.0003 0.0002 0.0001],...
'prevtstamp', '20200518_175057_1_7381',...
'prevtstampID', 3)
Connected to the parallel pool (number of workers: 14).

ans = 

 ProcessPool with properties: 

            Connected: true
           NumWorkers: 14
              Cluster: local
        AttachedFiles: {}
    AutoAddClientPath: true
          IdleTimeout: 30 minutes (30 minutes remaining)
          SpmdEnabled: true

Using temperature ladder for MCMC at the following temperatures.

tladder =

   1.0e+03 *

    7.3814    5.5361    3.6907    2.9526    2.2144    1.4763    0.7381

Current temperature: 7381 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingD_v2' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingD_v2' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200519_011218' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200519_011218_1_7381'). 

############################################ 
------------------------------------------

proj_ZSIFFL_trainingD_v2('stepSize', 1.2,...
'nW', 4000,...
'nPoints', 50*4000,...
'thinning', 10,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 15,...
'temperatureLadder', [0.001 0.00075 0.0005 0.0004 0.0003 0.0002 0.0001])
Parallel pool using the 'local' profile is shutting down.
Starting parallel pool (parpool) using the 'local' profile ...
Connected to the parallel pool (number of workers: 15).

ans = 

 ProcessPool with properties: 

            Connected: true
           NumWorkers: 15
              Cluster: local
        AttachedFiles: {}
    AutoAddClientPath: true
          IdleTimeout: 30 minutes (30 minutes remaining)
          SpmdEnabled: true

Using temperature ladder for MCMC at the following temperatures.

tladder =

   1.0e+03 *

    7.3814    5.5361    3.6907    2.9526    2.2144    1.4763    0.7381

Current temperature: 7381 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingD_v2' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingD_v2' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200518_175057' 

Project directory does not exist. Creating it, and using this to store data
 (in a subdirectory named 'simdata_20200518_175057_1_7381'). 

############################################ 

------------------------------------------------------------------
 % mcmc20200518_002303_1_738_ID25
seems to run at 68C at 4.05Ghz, 1.275V, 
(note the 18 cores, )
proj_ZSIFFL_trainingF('stepSize', 1.2,...
'nW', 1000,...
'nPoints', 50*1000,...
'thinning', 10,...
'nIter', 100,...
'parallel', true, ...
'poolsize', 18,...
'pausemode', false,...
'temperatureLadder', [0.0001],...
'prevtstamp', '20200517_172041_1_738',...
'prevtstampID', 7)



running at 4.05GHz, at 1.1875vCore
proj_ZSIFFL_trainingF('stepSize', 1.2,...
'nW', 1000,...
'nPoints', 50*1000,...
'thinning', 10,...
'nIter', 60,...
'parallel', true, ...
'poolsize', 15,...
'pausemode', true,...
'temperatureLadder', [0.0001],...
'prevtstamp', '20200517_072406_1_738',...
'prevtstampID', 15)




proj_ZSIFFL_trainingF('stepSize', 1.2,...
'nW', 1000,...
'nPoints', 50*1000,...
'thinning', 10,...
'nIter', 60,...
'parallel', true, ...
'poolsize', 15,...
'pausemode', true,...
'temperatureLadder', [0.0001],...
'prevtstamp', '20200517_054605_1_738',...
'prevtstampID', 2)
running at 4.15GHz, 1.275vCore
was running at 72-73C

Current temperature: 738 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingF' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingF' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200517_072406' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200517_072406_1_738'). 

ending mcmc 1
Elapsed time is 2266.359544 seconds.
ending mcmc 2
Elapsed time is 2209.799429 seconds.
ending mcmc 3
Elapsed time is 2234.486761 seconds.
ending mcmc 4
Elapsed time is 2215.601278 seconds.
ending mcmc 5
Elapsed time is 2199.181304 seconds.
ending mcmc 6
Elapsed time is 2225.188544 seconds.
ending mcmc 7
Elapsed time is 2216.940259 seconds.
ending mcmc 8
Elapsed time is 2231.308278 seconds.
ending mcmc 9
Elapsed time is 2342.891549 seconds.
ending mcmc 10
Elapsed time is 2358.553416 seconds.
ending mcmc 11
Elapsed time is 2372.324346 seconds.
ending mcmc 12
Elapsed time is 2319.315386 seconds.
ending mcmc 13
Elapsed time is 2304.523491 seconds.
ending mcmc 14
Elapsed time is 2357.569565 seconds.
ending mcmc 15
Elapsed time is 2327.228624 seconds.
-0--------------------------------------------------------------

proj_ZSIFFL_trainingF('stepSize', 1.2,...
'nW', 1000,...
'nPoints', 50*1000,...
'thinning', 10,...
'nIter', 60,...
'parallel', true, ...
'poolsize', 16,...
'pausemode', true,...
'temperatureLadder', [0.0001],...
'prevtstamp', '20200516_183508_1_738',...
'prevtstampID', 1)



Using temperature ladder for MCMC at the following temperatures.

tladder =

  738.1415

Current temperature: 738 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingF' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingF' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200517_054605' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200517_054605_1_738'). 















-0--------------------------------------------0-

proj_ZSIFFL_trainingF('stepSize', 1.2,...
'nW', 1000,...
'nPoints', 50*1000,...
'thinning', 10,...
'nIter', 60,...
'parallel', true, ...
'poolsize', 15,...
'pausemode', true,...
'temperatureLadder', [0.0001],...
'prevtstamp', '20200516_175823_1_738',...
'prevtstampID', 1)



NOT POSSIBLLE TO apply OC on startup, for obvious reasons. 
It’s not possible to apply RM at startup.
I ran into this issue as well and just bit the bullet and went the bios route
I believe that was a design decision to avoid boot-loops for 
unstable OC. It can be difficult to boot into safe mode these days...

% this is with the intel math kernel set to not discriminate between AMD and
 Intel.

4.15GhZ, 1.25 
proj_ZSIFFL_trainingF('stepSize', 1.2,...
'nW', 1000,...
'nPoints', 50*1000,...
'thinning', 10,...
'nIter', 60,...
'parallel', true, ...
'poolsize', 16,...
'pausemode', true,...
'temperatureLadder', [0.0001],...
'prevtstamp', '20200516_062411_1_738',...
'prevtstampID', 19)

How-To force Matlab to use a fast codepath on AMD Ryzen/TR CPUs - up to 250% 
performance gains
Tips
FINAL UPDATE: Version R2020a released in March 2020 uses the AVX2 codepath on 
compatible AMD CPUs automatically. 
Hence, if you are running this version, you do not need to manually set the 
environmental variable on your system anymore.

THANKS MATLAB! This is great!

For previous generations of Matlab, you can still follow the below procedures.

-----

Hello everyone.

I wanted to briefly present my tweak here, as I think it might be of interest for 
many in this community. Applying the tweak takes less than a minute.

What is it?

Matlab runs notoriously slow on AMD CPUs for operations that use the Intel Math 
Kernel Library (MKL). 
This is because the Intel MKL uses a discriminative CPU Dispatcher that does not
 use efficient codepath 
according to SIMD support by the CPU, but based on the result of a vendor string 
query. If the CPU is from AMD, 
the MKL does not use SSE3-SSE4 or AVX1/2 extensions but falls back to SSE1 no ma
tter whether the AMD CPU supports 
more efficient SIMD extensions like AVX2 or not.

The method provided here does enforce AVX2 support by the MKL, independent of the
 vendor string result.

EDIT: Before you start I have a short request for you that you could help me wit
h and serve your own interest. 
Matlab will not implement this fix as it is based on an unofficial debug mode of
 the MKL. If you think that 
Matlab should offer a permanent solution that serves all users independently of 
whether they use Intel or AMD CPUs, 
please make a feature request at Matlab to implement a nummeric library (e.g. 
	OpenBLAS) that does not 
discriminate against non Intel CPUs. Mathworks will not make this change 
without people advocating for it. Thanks!

tl;dr:

WINDOWS:

You'll read below "How To" force the MKL to use AVX2 on AMD Ryzen or Threadripper
 CPUs. Performance gains 
on my 2600x are between 20% and 300% depending on the type of numeric operation.

Benchmark result comparison.

Benchmark taken from here

Post image
Integrated benchmark results:

Post image
Feedback is appreciated in the comments section.

Disclaimer: I OF COURSE DO NOT TAKE RESPONSIBILITY FOR ISSUES RESULTING IN USING
 THIS TWEAK. 
USE ON AMD RYZEN OR THREADRIPPER ONLY. DOES NOT WORK ON INTEL OR OLDER AMD CPUs.

Solution 1 (Windows - no admin rights needed):

Create a .bat file with the following lines to start Matlab in AVX2 Mode

@echo off
set MKL_DEBUG_CPU_TYPE=5
matlab.exe 
This is straight forward. You open Notepad, copy and paste the above three 
lines and save 
the file as Matlab-AVX2. Notepad will save the file as Matlab-AVX2.txt. 
Now replace the extension ".txt" with ".bat".

If you double-click that file, Matlab will start the MKL in AVX2 Mode. 
If you start it the 
normal way, it will remain as always.

You can also download the .bat file from my HiDrive if you trust me (which 
you of course 
should not, as I am a random guy in the Internet). If you delete the startup 
batch file provided in the download or the one you created yourself, its 
gone and your computer will be as it has been before.

(Optional Download: https://my.hidrive.com/lnk/EHAACFje ) --> also incl. 
improved benchmark 
script

Solution 2 (Windows - admin rights needed): If you are happy with the results 
(which you will be :-)), you should make the setting permanent by entering 
MKL_DEBUG_CPU_TYPE=5 into the System Environment Variables. This has several 
advantages, one of them being that it applies to all instances of Matlab and 
not just the one opened using the .bat file.

Post image
Image courtesy, Dr. F. Haiss, and many thanks for testing on a Threadripper!

You can do this either by editing the Environmental Variables as shown above, 
or by opening a command prompt (CMD) with admin rights and typing in:

setx /M MKL_DEBUG_CPU_TYPE 5
Doing this will make the change permanent and available to ALL Programs using 
the MKL on your system until you delete the entry again from the variables.'

--------------------------------------------------------------------------------
--------------------



4.15ghz, 1.25 V
proj_ZSIFFL_trainingF('stepSize', 1.2,...
'nW', 1000,...
'nPoints', 50*1000,...
'thinning', 10,...
'nIter', 60,...
'parallel', true, ...
'poolsize', 16,...
'pausemode', true,...
'temperatureLadder', [0.0001],...
'prevtstamp', '20200515_184104_1_738',...
'prevtstampID', 5)

ans = 

 Pool with properties: 

            Connected: true
           NumWorkers: 16
              Cluster: local
        AttachedFiles: {}
    AutoAddClientPath: true
          IdleTimeout: 30 minutes (30 minutes remaining)
          SpmdEnabled: true

Using temperature ladder for MCMC at the following temperatures.

tladder =

  738.1415

Current temperature: 738 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingF' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingF' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200516_062411' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200516_062411_1_738'). 

############################################ 


proj_ZSIFFL_trainingF('stepSize', 1.2,...
'nW', 1000,...
'nPoints', 50*1000,...
'thinning', 10,...
'nIter', 60,...
'parallel', true, ...
'poolsize', 14,...
'pausemode', true,...
'temperatureLadder', [0.0001],...
'prevtstamp', '20200515_052639_1_738',...
'prevtstampID', 20)



proj_ZSIFFL_trainingF('stepSize', 1.2,...
'nW', 1000,...
'nPoints', 50*1000,...
'thinning', 10,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 16,...
'pausemode', true,...
'temperatureLadder', [0.0001],...
'prevtstamp', '20200515_023833_1_738',...
'prevtstampID', 4)



proj_ZSIFFL_trainingF('stepSize', 1.2,...
'nW', 1000,...
'nPoints', 50*1000,...
'thinning', 10,...
'nIter', 40,...
'parallel', true, ...
'poolsize', 14,...
'pausemode', true,...
'temperatureLadder', [0.0001],...
'prevtstamp', '20200514_183027_1_738',...
'prevtstampID', 5)


 ------------------------------------------------------------------------

% Visualize this, and decide on the step ladder including the error bars etc. 
proj_ZSIFFL_trainingF('stepSize', 1.2,...
'nW', 1000,...
'nPoints', 50*1000,...
'thinning', 10,...
'nIter', 10,...
'parallel', true, ...
'poolsize', 16,...
'pausemode', true,...
'temperatureLadder', [0.0001],...
'prevtstamp', '20200514_165204_1_738',...
'prevtstampID', 2)
20200514_165204_1_738
Current temperature: 738 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingF' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingF' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200514_183027' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200514_183027_1_738'). 

############################################ 



% Visualize this, and decide on the step ladder including the error bars etc. 
proj_ZSIFFL_trainingF('stepSize', 1.2,...
'nW', 1000,...
'nPoints', 50*1000,...
'thinning', 10,...
'nIter', 50,...
'parallel', true, ...
'poolsize', 12,...
'pausemode', true,...
'temperatureLadder', [0.0001],...
'prevtstamp', '20200513_222442_1_738',...
'prevtstampID', 12)
%20200513_222442_1_738_ID12








% Visualize this, and decide on the step ladder including the error bars etc. 
proj_ZSIFFL_trainingF('stepSize', 1.2,...
'nW', 1000,...
'nPoints', 100*1000,...
'thinning', 10,...
'nIter', 50,...
'parallel', true, ...
'poolsize', 14,...
'temperatureLadder', [0.0001],...
'prevtstamp', '20200511_052714_2_738',...
'prevtstampID', 10)


Parallel pool using the 'local' profile is shutting down.
Starting parallel pool (parpool) using the 'local' profile ...
connected to 14 workers.

ans = 

 Pool with properties: 

            Connected: true
           NumWorkers: 14
              Cluster: local
        AttachedFiles: {}
    AutoAddClientPath: true
          IdleTimeout: 30 minutes (30 minutes remaining)
          SpmdEnabled: true

Using temperature ladder for MCMC at the following temperatures.

tladder =

  738.1415

Current temperature: 738 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingF' 

Directory where the project file is stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects' 

Directory where data will be stored: 
 'D:\txtl\txtlsim\mcmc_simbio\projects\proj_ZSIFFL_trainingF' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200513_222442' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200513_222442_1_738'). 

############################################ 


% ---------------------------------
% looks like the second one is the best one. so that is the temp we
 will run things at for a while
%20200511_05271
proj_ZSIFFL_trainingF('stepSize', 1.2,...
'nW', 1000,...
'nPoints', 100*1000,...
'thinning', 10,...
'nIter', 10,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.0002 0.0001 0.00005 0.00002],...
'prevtstamp', '20200510_082735_1_1476',...
'prevtstampID', 2)
% expected end time: 40 hours from 2 am May 12: so at Wed may 13, 9.30 pm. 


ans = 

 Pool with properties: 

            Connected: true
           NumWorkers: 18
              Cluster: local
        AttachedFiles: {}
    AutoAddClientPath: true
          IdleTimeout: 30 minutes (30 minutes remaining)
          SpmdEnabled: true

Using temperature ladder for MCMC at the following temperatures.

tladder =

   1.0e+03 *

    1.4763    0.7381    0.3691    0.1476

Current temperature: 1476 
############################################ 

File and directory info:

Project name: 
 'proj_ZSIFFL_trainingF' 

Directory where the project file is stored: 
 '/home/ubuntu/anaconda3/matlab/txtlsim/mcmc_simbio/projects' 

Directory where data will be stored: 
 '/home/ubuntu/anaconda3/matlab/txtlsim/mcmc_simbio/projects/proj_ZSIFFL_trainingF' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200511_052714' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200511_052714_1_1476'). 

############################################ 



% ZSIFFL training thread
20200510_082735_1_1476
only ran the first 2 iters for the first temp
proj_ZSIFFL_trainingF('stepSize', 1.2,...
'nW', 1000,...
'nPoints', 200*1000,...
'thinning', 10,...
'nIter', 10,...
'parallel', true, ...
'poolsize', 4,...
'temperatureLadder', [0.0002 0.0001 0.00005 0.00002])
% This is far too long. it taked 10 hours per iteration. 
I need it down to something like 1h. 
% One thing is to up the parallel pool ot 8 workers. 
% Then to lower the number of computations per iteration to 


% ---------------------------------

% ---------------------------------


% ---------------------------------


% ---------------------------------


% ---------------------------------


% ---------------------------------


% ---------------------------------


% ---------------------------------


% ---------------------------------


% ---------------------------------


% ---------------------------------


% ---------------------------------


% ---------------------------------


% ---------------------------------


% ---------------------------------


% ---------------------------------


% ---------------------------------


% ---------------------------------


% ---------------------------------


% ---------------------------------


% ---------------------------------


% ---------------------------------


% ---------------------------------

proj_vnprl('ver', 'F3',...
'stepSize', 1.2,...
'nW', 2000,...
'nPoints', 101*2000,...
'thinning', 10,...
'nIter', 15,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.0014 0.0012 0.001 0.0008],...
'stepLadder', [],...
'prevtstamp', '20200512_192355_2_38',...
'prevtstampID', 10)

Parallel pool using the 'local' profile is shutting down.
Starting parallel pool (parpool) using the 'local' profile ...
connected to 18 workers.

ans = 

 Pool with properties: 

            Connected: true
           NumWorkers: 18
              Cluster: local
        AttachedFiles: {}
    AutoAddClientPath: true
          IdleTimeout: 30 minutes (30 minutes remaining)
          SpmdEnabled: true

Using temperature ladder for MCMC at the following temperatures.

tladder =

   33.3346   28.5725   23.8104   19.0484

Current temperature: 33 
############################################ 

File and directory info:

Project name: 
 'proj_vnprl' 

Directory where the project file is stored: 
 '/home/ubuntu/anaconda3/matlab/txtlsim/mcmc_simbio/projects' 

Directory where data will be stored: 
 '/home/ubuntu/anaconda3/matlab/txtlsim/mcmc_simbio/projects/proj_vnprl' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200513_063545' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200513_063545_1_33'). 

############################################ 
% ---------------------------------

proj_vnprl('ver', 'F3',...
'stepSize', 1.2,...
'nW', 2000,...
'nPoints', 101*2000,...
'thinning', 10,...
'nIter', 10,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.0018 0.0016],...
'stepLadder', [],...
'prevtstamp', '20200510_045912_2_48',...
'prevtstampID', 30) 



ans = 

 Pool with properties: 

            Connected: true
           NumWorkers: 18
              Cluster: local
        AttachedFiles: {}
    AutoAddClientPath: true
          IdleTimeout: 30 minutes (30 minutes remaining)
          SpmdEnabled: true

Using temperature ladder for MCMC at the following temperatures.

tladder =

   42.8588   38.0967   33.3346   28.5725   23.8104

Current temperature: 43 
############################################ 

File and directory info:

Project name: 
 'proj_vnprl' 

Directory where the project file is stored: 
 '/home/ubuntu/anaconda3/matlab/txtlsim/mcmc_simbio/projects' 

Directory where data will be stored: 
 '/home/ubuntu/anaconda3/matlab/txtlsim/mcmc_simbio/projects/proj_vnprl' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200512_192355' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200512_192355_1_43'). 

############################################ 


%----------------------------


% once the 0.002 is done, terminate. and do the remaining 30 in a more graded manner: 
% 10iter x 0.003,
% 10iter x 0.002,
% 10iter x 0.001,
% 10iter x 0.0008 
% 10iter x 0.0007 
% 10iter x 0.0005 
% == 60 hours of runtime. See if can finish in 30 hours using a slightly 
bigger machine. 
% that should give nice highly converged values. the only thing to
 be careful about is not to 
% lower the temp too quickly. 
% this is the first run with the fixed parameter ranges. 
% 
% '20200510_045912_1_95'
proj_vnprl('ver', 'F3',...
'stepSize', 1.2,...
'nW', 2000,...
'nPoints', 101*2000,...
'thinning', 10,...
'nIter', 30,...
'parallel', true, ...
'poolsize', 8,...
'temperatureLadder', [0.004 0.002],...
'stepLadder', [],...
'prevtstamp', '20200506_145656_1_48',...
'prevtstampID', 8) % currently running as of may 11, 2  pm. 
% expected end time: around Wed early morning hours. may 13


%----------------------------
% # this failed too. I had to fix the pol limits, i had put exp(5000) as the upper
 limit, not 5000 (which is like exp 8.5). 
proj_vnprl('ver', 'F3',...
'stepSize', 1.2,...
'nW', 2000,...
'nPoints', 101*2000,...
'thinning', 10,...
'nIter', 30,...
'parallel', true, ...
'poolsize', 8,...
'temperatureLadder', [0.002],...
'stepLadder', [],...
'prevtstamp', '20200506_145656_1_48',...
'prevtstampID', 8)


ans = 

 Pool with properties: 

            Connected: true
           NumWorkers: 8
              Cluster: local
        AttachedFiles: {}
    AutoAddClientPath: true
          IdleTimeout: 30 minutes (30 minutes remaining)
          SpmdEnabled: true

Using temperature ladder for MCMC at the following temperatures.

tladder =

   47.6209

Current temperature: 48 
############################################ 

File and directory info:

Project name: 
 'proj_vnprl' 

Directory where the project file is stored: 
 '/home/ubuntu/anaconda3/matlab/txtlsim/mcmc_simbio/projects' 

Directory where data will be stored: 
 '/home/ubuntu/anaconda3/matlab/txtlsim/mcmc_simbio/projects/proj_vnprl' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200507_094448' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200507_094448_1_48'). 

############################################ 




----
% this failed on the first iter. back tracking to iter 8 on the previous tstamp ID. 

proj_vnprl('ver', 'F3',...
'stepSize', 1.2,...
'nW', 2000,...
'nPoints', 101*2000,...
'thinning', 10,...
'nIter', 30,...
'parallel', true, ...
'poolsize', 8,...
'temperatureLadder', [0.002],...
'stepLadder', [],...
'prevtstamp', '20200506_145656_1_48',...
'prevtstampID', 10)


ans = 

 Pool with properties: 

            Connected: true
           NumWorkers: 8
              Cluster: local
        AttachedFiles: {}
    AutoAddClientPath: true
          IdleTimeout: 30 minutes (30 minutes remaining)
          SpmdEnabled: true

Using temperature ladder for MCMC at the following temperatures.

tladder =

   47.6209

Current temperature: 48 
############################################ 

File and directory info:

Project name: 
 'proj_vnprl' 

Directory where the project file is stored: 
 '/home/ubuntu/anaconda3/matlab/txtlsim/mcmc_simbio/projects' 

Directory where data will be stored: 
 '/home/ubuntu/anaconda3/matlab/txtlsim/mcmc_simbio/projects/proj_vnprl' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200507_071350' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200507_071350_1_48'). 

############################################ 


 ------------------------------------------------------------------------------
 -------------
 -------------------------------------------------------------------------------
 ------------
 -------------------------------------------------------------------------------
 ------------
 -------------------------------------------------------------------------------
 ------------

-----


GWMCMC  80.0% [********************************········] 00:00:07
 68% rejected
    0.938
      7.6
      -13
     3.18
    0.283
     13.7
    -4.97
     5.65
     11.6
     3.43
       12
     3.98
     8.41

GWMCMC  80.9% [********************************········] 00:00:06
 68% rejected
     1.22
     7.83
    -12.7
     3.46
     1.08
     13.4
    -5.06
     4.95
     11.3
     2.99
     10.3
     3.79
     8.25

Warning: A worker aborted during execution of the parfor loop. The parfor loop will 
now run again on the remaining workers.
> In parallel_function (line 605)
  In gwmcmc_vse (line 251)
  In mcmc_runsim_v2 (line 318)
  In proj_vnprl (line 359)
Operation terminated by user during distcomp.remoteparfor/getCompleteIntervals (line 227)


% prev one failed after 9 iterations. but no error yet. going to go back to 0.002
temp. that seemed to work...
% maybe it keeps working. 
proj_vnprl('ver', 'F3',...
'stepSize', 1.2,...
'nW', 2000,...
'nPoints', 101*2000,...
'thinning', 10,...
'nIter', 30,...
'parallel', true, ...
'poolsize', 8,...
'temperatureLadder', [0.002],...
'stepLadder', [],...
'prevtstamp', '20200506_045247_1_143',...
'prevtstampID', 9)

 Pool with properties: 

            Connected: true
           NumWorkers: 8
              Cluster: local
        AttachedFiles: {}
    AutoAddClientPath: true
          IdleTimeout: 30 minutes (30 minutes remaining)
          SpmdEnabled: true

Using temperature ladder for MCMC at the following temperatures.

tladder =

   47.6209

Current temperature: 48 
############################################ 

File and directory info:

Project name: 
 'proj_vnprl' 

Directory where the project file is stored: 
 '/home/ubuntu/anaconda3/matlab/txtlsim/mcmc_simbio/projects' 

Directory where data will be stored: 
 '/home/ubuntu/anaconda3/matlab/txtlsim/mcmc_simbio/projects/proj_vnprl' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200506_145656' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200506_145656_1_48'). 

 -------------------------------------------------------------------------
 ------------------
 -------------------------------------------------------------------------
 ------------------
 -------------------------------------------------------------------------
 ------------------
 -------------------------------------------------------------------------
 ------------------


% #TAKING A FEW STEPS BACK. AWAY FROM WHATEVER THE HECK WAS GOING ON. 
CAN INVESTIGATE MORE SOMETIME. 
% 	IF THIS DOES NOT WORK, I WILL GO BACK TO THE SMALLER PARAMETER RANGES.
 ACTUALLY JUST START THE IFFL FITTING. 
% THE VNPRL IS GOOD ENOUGH


proj_vnprl('ver', 'F3',...
'stepSize', 1.2,...
'nW', 2000,...
'nPoints', 101*2000,...
'thinning', 10,...
'nIter', 30,...
'parallel', true, ...
'poolsize', 8,...
'temperatureLadder', [0.006 0.004],...
'stepLadder', [],...
'prevtstamp', '20200504_063238_1_95',...
'prevtstampID', 12)

tladder =

  142.8627   95.2418

Current temperature: 143 
############################################ 

File and directory info:

Project name: 
 'proj_vnprl' 

Directory where the project file is stored: 
 '/home/ubuntu/anaconda3/matlab/txtlsim/mcmc_simbio/projects' 

Directory where data will be stored: 
 '/home/ubuntu/anaconda3/matlab/txtlsim/mcmc_simbio/projects/proj_vnprl' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200506_045247' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200506_045247_1_143'). 

############################################ 

% stuck value: 
% GWMCMC  70.0% [****************************············] 00:00:08
%  62% rejected
%      1.53
%      9.84
%     -6.21
%       1.4
%     -3.44
%        12
%     0.446
%      22.1
%      4.39
%      5.81
%      10.6
%      3.93
%      1.52
% GWMCMC  70.9% [****************************············] 00:00:08
%  62% rejected
%      1.53
%      9.84
%     -6.21
%       1.4
%     -3.44
%        12
%     0.446
%      22.1
%      4.39
%      5.81
%      10.6
%      3.93
%      1.52
% GWMCMC  71.8% [****************************············] 00:00:07
%  62% rejected
%      1.53
%      9.84
%     -6.21
%       1.4
%     -3.44
%        12
%     0.446
%      22.1
%      4.39
%      5.81
%      10.6
%      3.93
%      1.52
% GWMCMC  72.7% [*****************************···········] 00:00:07
%  62% rejected
%      1.53
%      9.84
%     -6.21
%       1.4
%     -3.44
%        12
%     0.446
%      22.1
%      4.39
%      5.81
%      10.6
%      3.93
%      1.52
--------
 --------------------------------------------------------------------------
 -----------------
 -------------------------------------------------------------------------
 ------------------
 -------------------------------------------------------------------------
 ------------------
 -------------------------------------------------------------------------
 ------------------
% SOMEHOW THIS TEMP IS JUST NOT WORKING. I AM GOING TO LOWER THE TEMP SLIGHTLY.
 MAYBE TO JUST 0.008. 

proj_vnprl('ver', 'F3',...
'stepSize', 1.2,...
'nW', 2000,...
'nPoints', 101*2000,...
'thinning', 10,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.012 0.008 0.004],...
'stepLadder', [],...
'prevtstamp', '20200504_141525_1_286',...
'prevtstampID', 4)
connected to 18 workers.

ans = 

 Pool with properties: 

            Connected: true
           NumWorkers: 18
              Cluster: local
        AttachedFiles: {}
    AutoAddClientPath: true
          IdleTimeout: 30 minutes (30 minutes remaining)
          SpmdEnabled: true

Using temperature ladder for MCMC at the following temperatures.

tladder =

  285.7253  190.4835   95.2418

Current temperature: 286 
############################################ 

File and directory info:

Project name: 
 'proj_vnprl' 

Directory where the project file is stored: 
 '/home/ubuntu/anaconda3/matlab/txtlsim/mcmc_simbio/projects' 

Directory where data will be stored: 
 '/home/ubuntu/anaconda3/matlab/txtlsim/mcmc_simbio/projects/proj_vnprl' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200505_025140' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200505_025140_1_286'). 
 ---------------------------------------------------------------------
 ----------------------
 ----------------------------------------------------------------------
 ---------------------
 ---------------------------------------------------------------------
 ----------------------
 ---------------------------------------------------------------------
 ---------------------
 ----------------------------------------------------------------------
 ---------------------

Warning: A worker aborted during execution of the parfor loop. 
The parfor loop will now run 
again on the remaining
workers.
> In parallel_function (line 605)
  In gwmcmc_vse (line 251)
  In mcmc_runsim_v2 (line 318)
  In proj_vnprl (line 359)

# WORKER ABORTED on the previour run (20200504_141525_1_286) on 
  ID 4. wasted 8 hours of
 runtime. 
This is bs. These mistakes are the expensive ones. Might need to
 lower the machine size
 so we can absorb these mistakes.
 I dont check on the machine as often. 
% I am going to up the temperature even more temporarily to get
 good mixing. then will 
lower the temp back down to 95 then 48. 

% ssh -i ".ssh/vipulsinghal_112118.pem" ubuntu@spatial-analysis-2.genome.sg

% 20200504_141525_1_286
proj_vnprl('ver', 'F3',...
'stepSize', 1.2,...
'nW', 2000,...
'nPoints', 101*2000,...
'thinning', 10,...
'nIter', 30,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.012 0.008 0.004],...
'stepLadder', [],...
'prevtstamp', '20200504_063238_1_95',...
'prevtstampID', 14)

connected to 18 workers.

ans = 

 Pool with properties: 

            Connected: true
           NumWorkers: 18
              Cluster: local
        AttachedFiles: {}
    AutoAddClientPath: true
          IdleTimeout: 30 minutes (30 minutes remaining)
          SpmdEnabled: true

Using temperature ladder for MCMC at the following temperatures.

tladder =

  285.7253  190.4835   95.2418

Current temperature: 286 
############################################ 

File and directory info:

Project name: 
 'proj_vnprl' 

Directory where the project file is stored: 
 '/home/ubuntu/anaconda3/matlab/txtlsim/mcmc_simbio/projects' 

Directory where data will be stored: 
 '/home/ubuntu/anaconda3/matlab/txtlsim/mcmc_simbio/projects/proj_vnprl' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200504_141525' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200504_141525_1_286'). 

############################################ 
%------------------------------------------------------------------
--------------------------

% 20200504_063238_1_95
proj_vnprl('ver', 'F3',...
'stepSize', 1.2,...
'nW', 2000,...
'nPoints', 101*2000,...
'thinning', 10,...
'nIter', 60,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.004],...
'stepLadder', [],...
'prevtstamp', '20200503_231938_1_48',...
'prevtstampID', 13) % seems like this is a good temp. 20200504_063238_1_95

-------------------------------------------------------------------

% looking at the first 12 simdatas, i thik the temp is too low. 
going to raise it slightly.
 maybe from 0.002 to 0.004. 

% committed everything to git. the commit id is 
3b5f619bde2245a1d22b85d54abba228860619c8
proj_vnprl('ver', 'F3',...
'stepSize', 1.2,...
'nW', 2000,...
'nPoints', 101*2000,...
'thinning', 10,...
'nIter', 60,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.002],...
'stepLadder', [],...
'prevtstamp', '20200424_135910_1_48',...
'prevtstampID', 40) %


Current temperature: 48 
############################################ 

File and directory info:

Project name: 
 'proj_vnprl' 

Directory where the project file is stored: 
 '/home/ubuntu/anaconda3/matlab/txtlsim/mcmc_simbio/projects' 

Directory where data will be stored: 
 '/home/ubuntu/anaconda3/matlab/txtlsim/mcmc_simbio/projects/proj_vnprl' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200503_231938' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200503_231938_1_48'). 

############################################ 

User initialized intitial walker positions, skipping burn in phase
Iteration number 1.
starting mcmc 1
current step size: 1.200000e+00





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%% MODIFICATION TO THE VNPRL F3 FILE TO take the union of its 
ranges with those of F2. 

proj_vnprl('ver', 'F3',...
'stepSize', 1.2,...
'nW', 2000,...
'nPoints', 101*2000,...
'thinning', 10,...
'nIter', 40,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.002],...
'stepLadder', [],...
'prevtstamp', '20200423_165501_1_48',...
'prevtstampID', 40) %

tladder =

   47.6209

Current temperature: 48 
############################################ 

File and directory info:

Project name: 
 'proj_vnprl' 

Directory where the project file is stored: 
 '/home/ubuntu/anaconda3/matlab/txtlsim/mcmc_simbio/projects' 

Directory where data will be stored: 
 '/home/ubuntu/anaconda3/matlab/txtlsim/mcmc_simbio/projects/proj_vnprl' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200424_135910' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200424_135910_1_48'). 

############################################ 

--------------------------------


% 20200423_165501_1_48
proj_vnprl('ver', 'F3',...
'stepSize', 1.2,...
'nW', 2000,...
'nPoints', 101*2000,...
'thinning', 10,...
'nIter', 40,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.002],...
'stepLadder', [],...
'prevtstamp', '20200422_074403_2_24',...
'prevtstampID', 30) %
tladder =

   47.6209

Current temperature: 48 
############################################ 

File and directory info:

Project name: 
 'proj_vnprl' 

Directory where the project file is stored: 
 '/home/ubuntu/anaconda3/matlab/txtlsim/mcmc_simbio/projects' 

Directory where data will be stored: 
 '/home/ubuntu/anaconda3/matlab/txtlsim/mcmc_simbio/projects/proj_vnprl' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200423_165501' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200423_165501_1_48'). 

############################################ 
----------------------------------------------------------------------
--------------------
----------------------------------------------------------------------
--------------------
----------------------------------------------------------------------
--------------------
%20200422_074403

% 20200422_074403_2_24
proj_vnprl('ver', 'F3',...
'stepSize', 1.2,...
'nW', 2000,...
'nPoints', 101*2000,...
'thinning', 10,...
'nIter', 30,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.003 0.001],...
'stepLadder', [],...
'prevtstamp', '20200421_112043_1_119',...
'prevtstampID', 40) %

tladder =

   71.4313   23.8104

Current temperature: 71 
############################################ 

File and directory info:

Project name: 
 'proj_vnprl' 

Directory where the project file is stored: 
 '/home/ubuntu/anaconda3/matlab/txtlsim/mcmc_simbio/projects' 

Directory where data will be stored: 
 '/home/ubuntu/anaconda3/matlab/txtlsim/mcmc_simbio/projects/proj_vnprl' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200422_074403' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200422_074403_1_71'). 


---------------------------------------------------------------------
---------------------
----------------------------------------------------------------------
--------------------
---------------------------------------------------------------------
---------------------
% with the new parameter ranges: 

proj_vnprl('ver', 'F3',...
'stepSize', 1.2,...
'nW', 2000,...
'nPoints', 101*2000,...
'thinning', 10,...
'nIter', 40,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.005],...
'stepLadder', [],...
'prevtstamp', '20200420_205718_3_119',...
'prevtstampID', 8) %



ans = 

 Pool with properties: 

            Connected: true
           NumWorkers: 18
              Cluster: local
        AttachedFiles: {}
    AutoAddClientPath: true
          IdleTimeout: 30 minutes (30 minutes remaining)
          SpmdEnabled: true

Using temperature ladder for MCMC at the following temperatures.

tladder =

  119.0522

Current temperature: 119 
############################################ 

File and directory info:

Project name: 
 'proj_vnprl' 

Directory where the project file is stored: 
 '/home/ubuntu/anaconda3/matlab/txtlsim/mcmc_simbio/projects' 

Directory where data will be stored: 
 '/home/ubuntu/anaconda3/matlab/txtlsim/mcmc_simbio/projects/proj_vnprl' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200421_112043' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200421_112043_1_119'). 

############################################ 

User initialized intitial walker positions, skipping burn in phase
Iteration number 1.
starting mcmc 1
current step size: 1.200000e+00


------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
proj_vnprl('ver', 'F3',...
'stepSize', 1.2,...
'nW', 2000,...
'nPoints', 101*2000,...
'thinning', 10,...
'nIter', 10,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.05 0.02 0.005 0.002],...
'stepLadder', []) %

estARRAY =

  13x2 cell array

    {'TX_elong_glob'                  }    {[ 2.5500]}
    {'AGTPdeg_time'                   }    {[ 8.8350]}
    {'AGTPdeg_rate'                   }    {[    -10]}
    {'TXTL_P70_RNAPbound_Kd'          }    {[13.7500]}
    {'TXTL_RNAPBOUND_TERMINATION_RATE'}    {[ 1.9500]}
    {'TXTL_RNAdeg_Kd'                 }    {[15.6000]}
    {'TXTL_RNAdeg_kc'                 }    {[-2.1000]}
    {'RNAP'                           }    {[ 1.4419]}
    {'RNase'                          }    {[10.5000]}
    {'TL_elong_glob'                  }    {[ 3.3500]}
    {'TXTL_UTR_UTR1_Kd'               }    {[ 5.7500]}
    {'TXTL_RIBOBOUND_TERMINATION_RATE'}    {[ 2.4500]}
    {'Ribo'                           }    {[      5]}


fixARRAY =

  13x2 cell array

    {'AGTPreg_ON'                }    {[-3.9120]}
    {'TXTL_P70_RNAPbound_F'      }    {[ 1.5000]}
    {'TXTL_NTP_RNAP_1_Kd'        }    {[ 2.9459]}
    {'TXTL_NTP_RNAP_1_F'         }    {[      0]}
    {'TXTL_NTP_RNAP_2_Kd'        }    {[13.9970]}
    {'TXTL_NTP_RNAP_2_F'         }    {[      0]}
    {'TXTL_RNAdeg_F'             }    {[      0]}
    {'TXTL_PROT_deGFP_MATURATION'}    {[-6.0748]}
    {'TXTL_UTR_UTR1_F'           }    {[-0.2000]}
    {'TL_AA_Kd'                  }    {[ 6.5566]}
    {'TL_AA_F'                   }    {[-0.3000]}
    {'TL_AGTP_Kd'                }    {[14.5090]}
    {'TL_AGTP_F'                 }    {[-1.2000]}

Parallel pool using the 'local' profile is shutting down.
Parallel pool using the 'local' profile is shutting down.
Starting parallel pool (parpool) using the 'local' profile ...
connected to 18 workers.

ans = 

 Pool with properties: 

            Connected: true
           NumWorkers: 18
              Cluster: local
        AttachedFiles: {}
    AutoAddClientPath: true
          IdleTimeout: 30 minutes (30 minutes remaining)
          SpmdEnabled: true

Using temperature ladder for MCMC at the following temperatures.

tladder =

   1.0e+03 *

    1.1905    0.4762    0.1191    0.0476

Current temperature: 1191 
############################################ 

File and directory info:

Project name: 
 'proj_vnprl' 

Directory where the project file is stored: 
 '/home/ubuntu/anaconda3/matlab/txtlsim/mcmc_simbio/projects' 

Directory where data will be stored: 
 '/home/ubuntu/anaconda3/matlab/txtlsim/mcmc_simbio/projects/proj_vnprl' 

Timestamp for this run (yyyymmdd_HHMMSS): 
 '20200420_205718' 

Project directory already exists, using this to store data
 (in a subdirectory named 'simdata_20200420_205718_1_1191'). 

############################################ 

Testing integrability for dose number 1.



% after the runs, we changed the parameters FROM: 
    activeNames2 = {... % changes made to ranges on feb 8, 2019. 
    	setting parameters based on 
        ...% posterior plots. 
        'TX_elong_glob'                     exp(2.55)       [exp(2.3) exp(2.8)]        % 1
        'AGTPdeg_time'                      exp(8.8350)   exp([8.76 8.91]) 
        % DO NOT FIX THIS. 
        'AGTPdeg_rate'                      exp(-10)     exp([-10.3 -9.6 ])
         % set from before
        'AGTPreg_ON'                        exp(-3.912)        [0.005 0.2]       
         %4 % set from before
        'TXTL_P70_RNAPbound_Kd'             exp(13.75)         exp([13.25 14.25]) % 
        'TXTL_P70_RNAPbound_F'              exp(1.5)    [1e-5 300] % set to exp(1.5)
        'TXTL_RNAPBOUND_TERMINATION_RATE'   exp(1.95)        exp([-2.1 6])         % 7
        'TXTL_NTP_RNAP_1_Kd'                exp(2.9459)      [1 1e6]
        'TXTL_NTP_RNAP_1_F'                 exp(0)      [1e-5 100] % set to 1
        'TXTL_NTP_RNAP_2_Kd'                exp(13.997)         [0.1 1e7]
        'TXTL_NTP_RNAP_2_F'                 exp(0)      [1e-6 1000]        %11 % set to 1
        'TXTL_RNAdeg_Kd'                    exp(15.6)        exp([14.5 16.7]) 
        'TXTL_RNAdeg_F'                     exp(0)        [0.01 10000]
         % set to 1 (1 is right 
        	in the middle of the broad posterior density, and so not entirely arbitrary. )
        'TXTL_RNAdeg_kc'                    exp(-2.1)   exp([-3.3 -0.9])  %set to exp(-5.4)
        'RNAP'                              exp(1.4419)         exp([-0.44 3.62]) % 15
        'RNase'                             exp(10.5)         exp([8.6 12.4])
        'TL_elong_glob'                     exp(3.35)          exp([2.1 4.6])
        'TXTL_PROT_deGFP_MATURATION'        exp(-6.0748)      [0.0002 0.02] %18 
        % set from before
        'TXTL_UTR_UTR1_Kd'                  exp(5.75)          exp([-3 14.5])
        'TXTL_UTR_UTR1_F'                   exp(-0.2)   [1e-5 100] % set to exp(-0.2)
        'TL_AA_Kd'                          exp(6.5566)      [.1 1e6] % 21
        'TL_AA_F'                           exp(-0.3)   [1e-5 20]   % set to exp(-0.3)
        'TL_AGTP_Kd'                        exp(14.509)      [.1 1e7] % 23
        'TL_AGTP_F'                         exp(-1.2)   [1e-5 100]  %set to exp(-1.2)
        'TXTL_RIBOBOUND_TERMINATION_RATE'   exp(2.45)          exp([1.9 3])
        'Ribo'                              exp(5)          exp([3 7])}; %26 
% TO:
    activeNames2 = {... % changes made to ranges on feb 8, 2019. setting parameters based on 
        ...% posterior plots. 
        'TX_elong_glob'                     exp(2.55)       [exp(0.3) exp(4.8)]        % 1
        'AGTPdeg_time'                      exp(8.8350)   exp([6.76 10.91])
         % DO NOT FIX THIS. 
        'AGTPdeg_rate'                      exp(-10)     exp([-12.3 -7.6 ])
         % set from before
        'AGTPreg_ON'                        exp(-3.912)        [0.005 0.2]       
         %4 % set from before
        'TXTL_P70_RNAPbound_Kd'             exp(13.75)         exp([11.25 16.25]) % 
        'TXTL_P70_RNAPbound_F'              exp(1.5)    [1e-5 300] % set to exp(1.5)
        'TXTL_RNAPBOUND_TERMINATION_RATE'   exp(1.95)        exp([-4.1 8])         % 7
        'TXTL_NTP_RNAP_1_Kd'                exp(2.9459)      [1 1e6]
        'TXTL_NTP_RNAP_1_F'                 exp(0)      [1e-5 100] % set to 1
        'TXTL_NTP_RNAP_2_Kd'                exp(13.997)         [0.1 1e7]
        'TXTL_NTP_RNAP_2_F'                 exp(0)      [1e-6 1000]        %11 % set to 1
        'TXTL_RNAdeg_Kd'                    exp(15.6)        exp([12.5 18.7]) 
        'TXTL_RNAdeg_F'                     exp(0)        [0.01 10000]
         % set to 1 (1 is right in the middle of the broad posterior density, 
         	and so not entirely arbitrary. )
        'TXTL_RNAdeg_kc'                    exp(-2.1)   exp([-5.3 1.1])  %set to exp(-5.4)
        'RNAP'                              exp(1.4419)         exp([-2.44 5.62]) % 15
        'RNase'                             exp(10.5)         exp([6.6 14.4])
        'TL_elong_glob'                     exp(3.35)          exp([0.1 6.6])
        'TXTL_PROT_deGFP_MATURATION'        exp(-6.0748)      [0.0002 0.02] %18
         % set from before
        'TXTL_UTR_UTR1_Kd'                  exp(5.75)          exp([-5 16.5])
        'TXTL_UTR_UTR1_F'                   exp(-0.2)   [1e-5 100] % set to exp(-0.2)
        'TL_AA_Kd'                          exp(6.5566)      [.1 1e6] % 21
        'TL_AA_F'                           exp(-0.3)   [1e-5 20]   % set to exp(-0.3)
        'TL_AGTP_Kd'                        exp(14.509)      [.1 1e7] % 23
        'TL_AGTP_F'                         exp(-1.2)   [1e-5 100]  %set to exp(-1.2)
        'TXTL_RIBOBOUND_TERMINATION_RATE'   exp(2.45)          exp([1.9 3])
        'Ribo'                              exp(5)          exp([1 9])}; %26 
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------


-----------

% April 20, 2019
% ssh -i ~/.ssh/vipul_key_2019_sg.pem 
ubuntu@ec2-3-0-202-120.ap-southeast-1.compute.amazonaws.com

% full_variable_set_20190420_045130_1_92790.mat
proj_ZSIFFL_mtet('stepSize', 1.2,...
'nW', 1200,...
'nPoints', 50*1200,...
'thinning', 10,...
'nIter', 10,...
'parallel', true, ...
'poolsize', 24,...
'temperatureLadder', [0.03 0.01 0.005 0.001],...
'stepLadder', [1]) %  as of april 20, 2019
% for some reason every spot instance type I try gets booted. ...
 might have to start using on demand instances. 
% goddammit. just do what you need to do. I suppose. 


% simdata_20190420_070950_1_30930
% ec2-13-250-204-106.ap-southeast-1.compute.amazonaws.com 
proj_ZSIFFL_mtet('stepSize', 1.2,...
'nW', 1200,...
'nPoints', 40*1200,...
'thinning', 10,...
'nIter', 10,...
'parallel', true, ...
'poolsize', 8,...
'temperatureLadder', [0.01 0.005 0.001],...
'stepLadder', [1],...
'prevtstamp', '20190420_045130_1_92790',...
'prevtstampID', 2) %term by aws i give up on m4.4

% simdata_20190420_071051_1_30930
% 20190420_071438_2_15465
% ec2-13-251-44-234.ap-southeast-1.compute.amazonaws.com
proj_ZSIFFL_mtet('stepSize', 1.2,...
'nW', 1200,...
'nPoints', 40*1200,...
'thinning', 10,...
'nIter', 10,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.01 0.005 0.001],...
'stepLadder', [1],...
'prevtstamp', '20190420_045130_1_92790',...
'prevtstampID', 2) %term at 0.005 iter 8

% _20190420_155505_1_7732
proj_ZSIFFL_mtet('stepSize', 1.2,...
'nW', 1200,...
'nPoints', 50*1200,...
'thinning', 5,...
'nIter', 5,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.0025 0.001 0.0005 0.00025 0.0001 0.00005 0.000025 0.00001],...
'stepLadder', [1],...
'prevtstamp', '20190420_071438_2_15465',...
'prevtstampID', 8)


% got some useful info from the above sim, expanding the parameter ranges.
proj_ZSIFFL_mtet('stepSize', 1.2,...
'nW', 1200,...
'nPoints', 100*1200,...
'thinning', 10,...
'nIter', 10,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.00025 0.0001],...
'stepLadder', [1]) % terminated at 20190421_155749_2_309 at ID2


% ec2-13-251-129-176.ap-southeast-1.compute.amazonaws.com
proj_ZSIFFL_mtet('stepSize', 1.2,...
'nW', 1200,...
'nPoints', 100*1200,...
'thinning', 10,...
'nIter', 30,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.00025],...
'stepLadder', [1],...
'prevtstamp', '20190421_155749_2_309',...
'prevtstampID', 2) % 20190422_142534_1_773

% _20190422_214228_1_773
proj_ZSIFFL_mtet('stepSize', 1.2,...
'nW', 1200,...
'nPoints', 100*1200,...
'thinning', 10,...
'nIter', 10,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.00025],...
'stepLadder', [1],...
'prevtstamp', '20190422_142534_1_773',...
'prevtstampID', 4) % terminated at by aws. : mcmc20190422_214228_1_773_ID7

% ec2-13-251-60-253.ap-southeast-1.compute.amazonaws.com
% start from : mcmc20190422_214228_1_773_ID7
% 20190424_104801_1_773
proj_ZSIFFL_mtet('stepSize', 1.2,...
'nW', 1200,...
'nPoints', 100*1200,...
'thinning', 10,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.00025],...
'stepLadder', [1],...
'prevtstamp', '20190422_214228_1_773',...
'prevtstampID', 7)


% ec2-18-138-103-128.ap-southeast-1.compute.amazonaws.com
proj_ZSIFFL_mtet_phase2('stepSize', 1.2,...
'nW', 1200,...
'nPoints', 100*1200,...
'thinning', 10,...
'nIter', 10,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.0005, 0.00025],...
'stepLadder', [1]) %terminated at mcmc20190427_170334_2_1029_ID6
% there was a bug in the parameter ranges of the ptet sequestration. 

% rerunning itvapril 28, 10 pm. 
proj_ZSIFFL_mtet_phase2('stepSize', 1.2,...
'nW', 1200,...
'nPoints', 100*1200,...
'thinning', 10,...
'nIter', 10,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.0005, 0.00025],...
'stepLadder', [1])

% mcmc20190429_083138_1_1029_ID4.mat
proj_ZSIFFL_mtet_phase2('stepSize', 1.2,...
'nW', 1200,...
'nPoints', 100*1200,...
'thinning', 10,...
'nIter', 5,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.00025 0.0001 0.00005],...
'stepLadder', [1],...
'prevtstamp', '20190428_142033_2_1029',...
'prevtstampID', 2) % continuing from mcmc20190428_142033_2_1029_ID2

% 20190429_200219_1_1029
proj_ZSIFFL_mtet_phase2('stepSize', 1.2,...
'nW', 1200,...
'nPoints', 100*1200,...
'thinning', 10,...
'nIter', 5,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.00025 0.0001 0.00005],...
'stepLadder', [1],...
'prevtstamp', '20190429_083138_1_1029',...
'prevtstampID', 4) %it ended on 0.0001 (20190429_200219_2_412) at iter 3. 
(spot termination.)

%ec2-3-0-49-41.ap-southeast-1.compute.amazonaws.com (started April 27)
% 20190430_141254_1_412
proj_ZSIFFL_mtet_phase2('stepSize', 1.3,...
'nW', 1200,...
'nPoints', 100*1200,...
'thinning', 10,...
'nIter', 5,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.0001 0.00005],...
'stepLadder', [1],...
'prevtstamp', '20190429_200219_2_412',...
'prevtstampID', 3) %completed


% 20190501_042829_1_617
proj_ZSIFFL_mtet_phase2('stepSize', 1.3,...
'nW', 1200,...
'nPoints', 100*1200,...
'thinning', 10,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.00015],...
'stepLadder', [1],...
'prevtstamp', '20190430_141254_2_206',...
 'prevtstampID', 5) %spot termination at iter 4. 
% spot termination at 4 iters. new id:
 ec2-3-0-201-215.ap-southeast-1.compute.amazonaws.com
proj_ZSIFFL_mtet_phase2('stepSize', 1.3,...
'nW', 1200,...
'nPoints', 100*1200,...
'thinning', 10,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.00015],...
'stepLadder', [1],...
'prevtstamp', '20190501_042829_1_617',...
 'prevtstampID', 4) %terminated at oter 9 by spot instance unavailability. 

% simdata_20190502_042614_1_412
proj_ZSIFFL_mtet_phase2('stepSize', 1.3,...
'nW', 1200,...
'nPoints', 100*1200,...
'thinning', 10,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.0001],...
'stepLadder', [1],...
'prevtstamp', '20190501_123015_1_617',...
 'prevtstampID', 9)

% 20190502_105714_1_412
proj_ZSIFFL_mtet_phase2('stepSize', 1.3,...
'nW', 1200,...
'nPoints', 100*1200,...
'thinning', 10,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.0001],...
'stepLadder', [1],...
'prevtstamp', '20190502_042614_1_412',...
 'prevtstampID', 1) % got terminated at mcmc20190502_105714_1_412_ID11.mat

% 20190503_054023_1_412 -- FAILED

% 20190503_073640_1_412
proj_ZSIFFL_mtet_phase2('stepSize', 1.3,...
'nW', 1200,...
'nPoints', 100*1200,...
'thinning', 10,...
'nIter', 10,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.0001],...
'stepLadder', [1],...
'prevtstamp', '20190502_105714_1_412',...
 'prevtstampID', 11) %--- terminated at iter 1 

% 20190503_113414_1_412
% ec2-18-138-124-192.ap-southeast-1.compute.amazonaws.com
% this is a new instance. 
proj_ZSIFFL_mtet_phase2('stepSize', 1.3,...
'nW', 1200,...
'nPoints', 50*1200,...
'thinning', 10,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 8,...
'temperatureLadder', [0.0001],...
'stepLadder', [1],...
'prevtstamp', '20190503_073640_1_412',...
 'prevtstampID', 1) %terminated at 1. spot termination. 


% 20190503_170440_1_412
proj_ZSIFFL_mtet_phase2('stepSize', 1.3,...
'nW', 1200,...
'nPoints', 50*1200,...
'thinning', 10,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 8,...
'temperatureLadder', [0.0001],...
'stepLadder', [1],...
'prevtstamp', '20190503_113414_1_412',...
 'prevtstampID', 1) %termintaed at iter 11 

% 20190504_155258_1_412
proj_ZSIFFL_mtet_phase2('stepSize', 1.3,...
'nW', 1200,...
'nPoints', 50*1200,...
'thinning', 10,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 8,...
'temperatureLadder', [0.0001],...
'stepLadder', [1],...
'prevtstamp', '20190503_170440_1_412',...
 'prevtstampID', 11)


%%%%%%%%%%%%%
%%%%%%%%%%%%%
%%%%%%%%%%%%%
%%%%%%%%%%%%%
%%%%%%%%%%%%%
%%%%%%%%%%%%%
%%%%%%%%%%%%%
%%%%%%%%%%%%%
%%%%%%%%%%%%%
%%%%%%%%%%%%%
%%%%%%%%%%%%%
%%%%%%%%%%%%%
%%%%%%%%%%%%%
%%%%%%%%%%%%%
%%%%%%%%%%%%%
%%%%%%%%%%%%%
%%%%%%%%%%%%%
%%%%%%%%%%%%%
%%%%%%%%%%%%%
%%%%%%%%%%%%%
%%%%%%%%%%%%%
%%%%%%%%%%%%%
%%%%%%%%%%%%%
%%%%%%%%%%%%%
% 2019-05-01
% ec2-18-138-124-89.ap-southeast-1.compute.amazonaws.com (started May 1)
% simdata_20190501_074926_1_1107
proj_ZSIFFL_training('stepSize', 1.3,...
'nW', 1200,...
'nPoints', 100*1200,...
'thinning', 10,...
'nIter', 5,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.00015 0.00025 0.0005 0.00025 0.00015],...
'stepLadder', [1]) % spot terminated at temp 1, iter 1. 

% new IP: ec2-13-229-148-173.ap-southeast-1.compute.amazonaws.com
proj_ZSIFFL_training('stepSize', 1.3,...
'nW', 1200,...
'nPoints', 100*1200,...
'thinning', 10,...
'nIter', 5,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.00015 0.00025 0.0005 0.00025 0.00015],...
'stepLadder', [1], ...
'prevtstamp', '20190501_074926_1_1107',...
 'prevtstampID', 1)


proj_ZSIFFL_training('stepSize', 1.3,...
'nW', 1200,...
'nPoints', 100*1200,...
'thinning', 10,...
'nIter', 5,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.0005 0.00025 0.00015 0.0001 0.0001 0.0001 0.0001],...
'stepLadder', [1]) 

% ec2-3-1-24-17.ap-southeast-1.compute.amazonaws.com
%%%%% 20190503_053402_1_3691
proj_ZSIFFL_training('stepSize', 1.3,...
'nW', 1200,...
'nPoints', 100*1200,...
'thinning', 10,...
'nIter', 5,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.0005 0.00025 0.00015 0.0001],...
'stepLadder', [1]) % ---- FAILED. KILLED. c4.8 is failing me. 
spot requensts are failing me. 



% ec2-3-1-26-130.ap-southeast-1.compute.amazonaws.com
% 20190503_170158_1_3691
proj_ZSIFFL_training('stepSize', 1.3,...
'nW', 400,...
'nPoints', 50*400,...
'thinning', 5,...
'nIter', 10,...
'parallel', true, ...
'poolsize', 8,...
'temperatureLadder', [0.0005 0.00025 0.00015 0.0001],...
'stepLadder', [1]) % TERMINATED as of may 4, 1 am. 

% spot terminated at 20190503_170158_3_1107 iter 7, which is temp 00015
% so just going to run temp 0.00015 0.0001 now. 
% 20190504_153702_1_1107
proj_ZSIFFL_training('stepSize', 1.3,...
'nW', 400,...
'nPoints', 50*400,...
'thinning', 5,...
'nIter', 10,...
'parallel', true, ...
'poolsize', 8,...
'temperatureLadder', [0.00015 0.0001],...
'stepLadder', [1], ...
'prevtstamp', '20190503_170158_3_1107',...
 'prevtstampID', 7) % 


proj_ZSIFFL_training('stepSize', 1.3,...
'nW', 400,...
'nPoints', 50*400,...
'thinning', 5,...
'nIter', 10,...
'parallel', true, ...
'poolsize', 8,...
'temperatureLadder', [0.0001 0.000075],...
'stepLadder', [1], ...
'prevtstamp', '20190504_153702_2_738',...
 'prevtstampID', 10)




%---------------------------------------------------
%---------------------------------------------------
%---------------------------------------------------
%---------------------------------------------------
%---------------------------------------------------
%---------------------------------------------------
%---------------------------------------------------
%---------------------------------------------------%
% 20190507_064919_1_1845
proj_ZSIFFL_training('stepSize', 1.3,...
'nW', 400,...
'nPoints', 50*400,...
'thinning', 5,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 8,...
'temperatureLadder', [0.00025 0.0001 0.000075],...
'stepLadder', [1]) %  terminated at 1 - 6

% ec2-13-251-60-17.ap-southeast-1.compute.amazonaws.com
% 20190507_102955_1_1845
% extended the unactivated plas Kd. 
% 1438a6f1b3b4fa4f874086c62d5a6e141e05c83d <- commit ID. 
proj_ZSIFFL_training('stepSize', 1.3,...
'nW', 400,...
'nPoints', 50*400,...
'thinning', 5,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 8,...
'temperatureLadder', [0.00025 0.0001 0.000075],...
'stepLadder', [1], ...
'prevtstamp', '20190507_064919_1_1845',...
 'prevtstampID', 6) % 

%---------------------------------------------------
%---------------------------------------------------
%---------------------------------------------------
%---------------------------------------------------
%---------------------------------------------------
%---------------------------------------------------
%---------------------------------------------------
%---------------------------------------------------%


%%%%%% 20190508_001705_1_1845
% ec2-13-251-63-66.ap-southeast-1.compute.amazonaws.com
% may 8, 8.15 am. 
proj_ZSIFFL_trainingB('stepSize', 1.3,...
'nW', 400,...
'nPoints', 50*400,...
'thinning', 10,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 8,...
'temperatureLadder', [0.00025 0.0001 0.000075],...
'stepLadder', [1]) % terminated at iter 7 due to spot instance unavailability. 

% ec2-18-138-243-147.ap-southeast-1.compute.amazonaws.com
%anywhere. 
% 20190508_213950_1_1107
proj_ZSIFFL_trainingB('stepSize', 1.3,...
'nW', 400,...
'nPoints', 50*400,...
'thinning', 5,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.00015 0.00010 0.000075],...
'stepLadder', [1], ...
'prevtstamp', '20190508_001705_1_1845',...
 'prevtstampID', 7) % -- changed to an r.24xlarge. mem optimized,
  but with 48 physical cores. 

% 20190509_024244_1_738
proj_ZSIFFL_trainingB('stepSize', 1.3,...
'nW', 400,...
'nPoints', 50*400,...
'thinning', 5,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.00010 0.000075],...
'stepLadder', [1], ...
'prevtstamp', '20190508_213950_1_1107',...
 'prevtstampID', 9)

% ec2-13-251-106-164.ap-southeast-1.compute.amazonaws.com
% 48 cores
% 20190509_062932_1_738
proj_ZSIFFL_trainingB('stepSize', 1.3,...
'nW', 400,...
'nPoints', 50*400,...
'thinning', 5,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 60,...
'temperatureLadder', [0.00010 0.000075],...
'stepLadder', [1], ...
'prevtstamp', '20190509_024244_1_738',...
 'prevtstampID', 6) %CURRENT -- 

% 20190509_083808_1_738
proj_ZSIFFL_trainingB('stepSize', 1.3,...
'nW', 400,...
'nPoints', 50*400,...
'thinning', 5,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.00010 0.000075],...
'stepLadder', [1], ...
'prevtstamp', '20190509_062932_1_738',...
 'prevtstampID', 2)



% ----
% 20190509_092707_1_1476
% ec2-3-0-206-195.ap-southeast-1.compute.amazonaws.com
proj_ZSIFFL_trainingC('stepSize', 1.3,...
'nW', 1200,...
'nPoints', 25*1200,...
'thinning', 5,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.0002 ,  0.00010 0.000075],...
'stepLadder', [1])

proj_ZSIFFL_trainingC('stepSize', 1.3,...
'nW', 1200,...
'nPoints', 25*1200,...
'thinning', 5,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.0002 ,  0.00010 0.000075],...
'stepLadder', [1], ...
'prevtstamp', '20190509_092707_1_1476',...
 'prevtstampID', 8) 

% 20190510_064333_1_369
proj_ZSIFFL_trainingC('stepSize', 1.3,...
'nW', 1200,...
'nPoints', 25*1200,...
'thinning', 5,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.00005 0.000025 0.00001],...
'stepLadder', [1], ...
'prevtstamp', '20190509_160552_3_554',...
 'prevtstampID', 20) 


proj_ZSIFFL_trainingC('stepSize', 1.3,...
'nW', 1200,...
'nPoints', 25*1200,...
'thinning', 5,...
'nIter', 40,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.00001],...
'stepLadder', [1], ...
'prevtstamp', '20190510_064333_3_74',...
 'prevtstampID', 8)


% 
% 20190511_062400_1_738
proj_ZSIFFL_trainingD('stepSize', 1.3,...
'nW', 480,...
'nPoints', 50*480,...
'thinning', 10,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.0001 0.00005 0.00001],...
'stepLadder', [1])

% 20190511_131947_1_369
proj_ZSIFFL_trainingD('stepSize', 1.3,...
'nW', 480,...
'nPoints', 50*480,...
'thinning', 10,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [ 0.00005 0.00001],...
'stepLadder', [1], ...
'prevtstamp', '20190511_062400_1_738',...
 'prevtstampID', 11)% terminated at iter 1 of 0.00001, ie, temp = 74.
  rejection % v high. 

% simdata_20190512_023235_1_1476 -- temp increased to lower the
 rejection percentage. it was at 90+%
proj_ZSIFFL_trainingD('stepSize', 1.2,...
'nW', 480,...
'nPoints', 50*480,...
'thinning', 10,...
'nIter', 40,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [ 0.0002],...
'stepLadder', [1], ...
'prevtstamp', '20190511_131947_2_74',...
 'prevtstampID', 1)

proj_ZSIFFL_trainingE('stepSize', 1.2,...
'nW', 480,...
'nPoints', 50*480,...
'thinning', 10,...
'nIter', 40,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [ 0.0002],...
'stepLadder', [1])


% 20190512_054951_1_1476
proj_ZSIFFL_trainingE('stepSize', 1.2,...
'nW', 480,...
'nPoints', 50*480,...
'thinning', 10,...
'nIter', 40,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [ 0.0002],...
'stepLadder', [1], ...
'prevtstamp', '20190512_033129_1_1476',...
 'prevtstampID', 3) % current

proj_ZSIFFL_trainingE('stepSize', 1.1,...
'nW', 480,...
'nPoints', 50*480,...
'thinning', 10,...
'nIter', 40,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [ 0.00025],...
'stepLadder', [1], ...
'prevtstamp', '20190512_064547_1_1476',...
 'prevtstampID', 8) % next. 


proj_ZSIFFL_trainingE('stepSize', 1.1,...
'nW', 480,...
'nPoints', 50*480,...
'thinning', 10,...
'nIter', 40,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [ 0.00025],...
'stepLadder', [1], ...
'prevtstamp', '20190512_094712_1_1845',...
 'prevtstampID', 2)

% 20190512_155207_1_1845
proj_ZSIFFL_trainingE('stepSize', 1.1,...
'nW', 480,...
'nPoints', 50*480,...
'thinning', 10,...
'nIter', 40,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [ 0.00025],...
'stepLadder', [1], ...
'prevtstamp', '20190512_113712_1_1845',...
 'prevtstampID', 5)

% 20190513_052603_1_1845
proj_ZSIFFL_trainingE('stepSize', 1.1,...
'nW', 480,...
'nPoints', 100*480,...
'thinning', 10,...
'nIter', 40,...
'parallel', true, ...
'poolsize', 24,...
'temperatureLadder', [ 0.00025],...
'stepLadder', [1], ...
'prevtstamp', '20190512_155207_1_1845',...
 'prevtstampID', 7)


%---------------------------------------------------
%---------------------------------------------------
%---------------------------------------------------
%---------------------------------------------------
%---------------------------------------------------
%---------------------------------------------------
%---------------------------------------------------
%---------------------------------------------------%


%---------------------------------------------------
%---------------------------------------------------
%---------------------------------------------------
%---------------------------------------------------
%---------------------------------------------------
%---------------------------------------------------
%---------------------------------------------------
%---------------------------------------------------%


%---------------------------------------------------
%---------------------------------------------------
%---------------------------------------------------
%---------------------------------------------------
%---------------------------------------------------
%---------------------------------------------------
%---------------------------------------------------
%---------------------------------------------------%


%---------------------------------------------------
%---------------------------------------------------
%---------------------------------------------------
%---------------------------------------------------
%---------------------------------------------------
%---------------------------------------------------
%---------------------------------------------------
%---------------------------------------------------%


















































% and another new machine. 24 physical cores. 
% ec2-3-1-27-61.ap-southeast-1.compute.amazonaws.com
% %%%%%%%%%%%%%%%%%%%%%%%%%  SILVER - AEROGEL 
% %%%%%%%%%%%%%%%%%%%%%%%%%  SILVER - AEROGEL 
% %%%%%%%%%%%%%%%%%%%%%%%%%  SILVER - AEROGEL 
% %%%%%%%%%%%%%%%%%%%%%%%%%  SILVER - AEROGEL 
% %%%%%%%%%%%%%%%%%%%%%%%%%  SILVER - AEROGEL 
% %%%%%%%%%%%%%%%%%%%%%%%%%  SILVER - AEROGEL 


% 20190318_150814_1_208
proj_test015_corr1_Ffix3('stepSize', 1.05,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 24,...
'temperatureLadder', [0.01 0.005 0.001 0.0005],...
'stepLadder', [1], ...
'rkcp', exp(-1.068),...
'cpol', exp(1.33)) %done


proj_test015_corr1_Ffix3('stepSize', 1.05,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 40,...
'parallel', true, ...
'poolsize', 24,...
'temperatureLadder', [0.001],...
'stepLadder', [1], ...
'rkcp', exp(-1.068),...
'cpol', exp(1.33),...
'prevtstamp', '20190318_150814_4_10',...
'prevtstampID', 20) %  . continuing at a higehr (optimal) temp -- RUNNING> 
% 0.001 is a really really good temperature. the 0.0005 is too low, 
and o.005 is too high. 
% 

% 20190319_143938_1_16 terminated at 4 iters. 
proj_test015_corr1_Ffix3('stepSize', 1.1,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 80,...
'parallel', true, ...
'poolsize', 24,...
'temperatureLadder', [0.00075],...
'stepLadder', [1], ...
'rkcp', exp(-1.068),...
'cpol', exp(1.33),...
'prevtstamp', '20190319_065336_1_21',...
'prevtstampID', 40) % just terminate

proj_test015('stepSize', 1.1,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 80,...
'parallel', true, ...
'poolsize', 24,...
'temperatureLadder', [0.0003],...
'stepLadder', [1],...
'prevtstamp', '20190319_105547_1_10',...
'prevtstampID', 35) %DONE.

proj_test015_corr1_Ffix3('stepSize', 1.2,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 60,...
'parallel', true, ...
'poolsize', 24,...
'temperatureLadder', [0.002],...
'stepLadder', [1], ...
'rkcp', exp(0.5168),...
'cpol', exp(-0.2199))

% --------- %%%%%%%%%%%%%%%%%%%%% BLUE-WHITE
% --------- %%%%%%%%%%%%%%%%%%%%% BLUE-WHITE
% --------- %%%%%%%%%%%%%%%%%%%%% BLUE-WHITE
% --------- %%%%%%%%%%%%%%%%%%%%% BLUE-WHITE
% --------- %%%%%%%%%%%%%%%%%%%%% BLUE-WHITE
% --------- %%%%%%%%%%%%%%%%%%%%% BLUE-WHITE
% --------- %%%%%%%%%%%%%%%%%%%%% BLUE-WHITE
% --------- %%%%%%%%%%%%%%%%%%%%% BLUE-WHITE



%----------
% --------- ec2-13-229-144-125.ap-southeast-1.compute.amazonaws.com
% --------- %%%%%%%%%%%%%%%%%%%%% BLUE-WHITE

% NEW MACINE -- 48 physical cores

% expect 2h10min per 30. say I want to be done in 12 - 13 h. 
then need to run 6 sets of 30. 
% 20190318_143245
proj_test015('stepSize', 1.02,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 45,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.0003 0.0002 0.0001 0.00005],...
'stepLadder', [1],...
'prevtstamp', '20190318_082039_3_10',...
'prevtstampID', 9) % 24 workers? this is a 48 worker machine!!!... lol. I am absurd. 


%20190319_071743_1_32

proj_test015('stepSize', 1.15,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 80,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.001],...
'stepLadder', [1],...
'prevtstamp', '20190318_143245_3_3',...
'prevtstampID', 39) %% terminated at 6.52 pm mar 19.. 

%20190319_105547_1_10
proj_test015('stepSize', 1.1,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 40,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.0003],...
'stepLadder', [1],...
'prevtstamp', '20190319_071743_1_32',...
'prevtstampID', 29) %

proj_test015('stepSize', 1.1,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 80,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.0003],...
'stepLadder', [1],...
'prevtstamp', '20190319_105547_1_10',...
'prevtstampID', 35) %done


proj_test015('stepSize', 1.03,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 40,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.0001],...
'stepLadder', [1],...
'prevtstamp', '20190319_152204_1_10',...
'prevtstampID', 80) %-- terminated at 12.49pm mar 20


% 20190320_044942_1_104 IMPORTANT!!!!!! final try. 
proj_test015_corr1_Ffix3('stepSize', 1.2,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 30,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.005 0.003 0.001],...
'stepLadder', [1], ...
'rkcp', exp(0.5168),...
'cpol', exp(-0.2199))



%%%%%%%%%%%%%%%%%% WHITE BLACK. 
%%%%%%%%%%%%%%%%%% WHITE BLACK. 
%%%%%%%%%%%%%%%%%% WHITE BLACK. 
%%%%%%%%%%%%%%%%%% WHITE BLACK. 
%%%%%%%%%%%%%%%%%% WHITE BLACK. 
%%%%%%%%%%%%%%%%%% WHITE BLACK. 
%%%%%%%%%%%%%%%%%% WHITE BLACK. 
%%%%%%%%%%%%%%%%%% WHITE BLACK. 




% ----------------------	FINAL MACINE -- 48 cores. 
%%%%%%%%%%%%%%%%%% WHITE BLACK. 
% ec2-13-251-38-128.ap-southeast-1.compute.amazonaws.com

% continued from :
proj_test015_corr1_Ffix3('stepSize', 1.2,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 60,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.00075],...
'stepLadder', [1], ...
'prevtstamp', '20190318_140222_5_2',...
'prevtstampID', 20) % -- done

proj_test015('stepSize', 1.1,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 80,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.0005],...
'stepLadder', [1],...
'prevtstamp', '20190319_105547_1_10',...
'prevtstampID', 35) % done


proj_test015('stepSize', 1.04,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 40,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.0001],...
'stepLadder', [1],...
'prevtstamp', '20190319_153210_1_16',...
'prevtstampID', 80) %  TERMINATE at -----


%20190320_044411_1_42
proj_test015_corr1_Ffix3('stepSize', 1.2,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 60,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.002],...
'stepLadder', [1], ...
'rkcp', exp(0.5168),...
'cpol', exp(-0.2199)) % terminated at 1.10pm mar 20. 


proj_test015_E1E2same('stepSize', 1.2,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 10,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.03 0.01 0.005 0.001],...
'stepLadder', [1]) % TERMINATE -- bug in the proj file. 

%20190320_082004_1_1453
proj_test015_E1E2same('stepSize', 1.2,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 5,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.03 0.01 0.005 0.002 0.002 0.002],...
'stepLadder', [1]) %.





% ---------- OLD MACHINES:::
% ---------- OLD MACHINES:::
% ---------- OLD MACHINES:::
% ---------- OLD MACHINES:::
% ---------- OLD MACHINES:::
% ---------- OLD MACHINES:::
% ---------- OLD MACHINES:::
% ---------- OLD MACHINES:::
% ---------- OLD MACHINES:::
% ---------- OLD MACHINES:::
% ---------- OLD MACHINES:::

% --------

proj_test015('stepSize', 1.05,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 15,...
'parallel', true, ...
'poolsize', 24,...
'temperatureLadder', [0.001 0.0007 0.0003 0.0001],...
'stepLadder', [1],...
'prevtstamp', '20190316_092219_1_242',...
'prevtstampID', 50) % 24 workers? this is a 48 worker machine!!!... 
lol. I am absurd. terminated at 9 on 0.0003


% 20190318_140222_1_208 to
% 20190318_140222_5_2
proj_test015_corr1_Ffix3('stepSize', 1.2,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.01 0.005 0.001 0.0005 0.0001],...
'stepLadder', [1]) %  --10.40 am expected end
% 0.001 is probably a good temp. check!! actually maybe something 
like 0.00075? might be a good compromise!


-------------------------
____----------_________-----------



proj_test015('stepSize', 1.2,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.01 0.0075 0.005 0.0025],...
'stepLadder', [1]) % done! 

proj_test015_corr1_Ffix('stepSize', 1.2,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 6,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.005],...
'stepLadder', [1]) % 

proj_test015_corr1_Ffix('stepSize', 1.2,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 12,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.005 0.002],...
'stepLadder', [1],...
'prevtstamp', '20190315_031445_1_104',...
'prevtstampID', 6) % all 12,, then 10. 


proj_test015_corr1_Ffix2('stepSize', 1.2,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 5,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.01 0.007 0.005 0.004 0.003 0.002 0.001],...
'stepLadder', [1]) % terminated at ... 


% going to continue the calib estimation. 

proj_test015('stepSize', 1.15,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 30,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.0075 0.0025],...
'stepLadder', [1],...
'prevtstamp', '20190314_161518_4_81',...
'prevtstampID', 20) %terminated at 0.0025, iter 8. 0.0075 complete at 30. pretty clean, 
can try to use. starting the kfdg fixed one next. 

% proj_test015_kfdgfix

proj_test015_kfdgfix('stepSize', 1.25,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 30,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.0075 0.005 0.0025],...
'stepLadder', [1]) % COMPLETE> 


% ---- switching to a smaller cheaper machine. going to redo test015, 
and clean it up massivelu. 

%20190316_033531_1_81
proj_test015('stepSize', 1.15,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 44,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.0025],...
'stepLadder', [1],...
'prevtstamp', '20190315_102139_2_81',...
'prevtstampID', 6)


% 20190316_044847_1_81
proj_test015('stepSize', 1.15,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 24,...
'parallel', true, ...
'poolsize', 24,...
'temperatureLadder', [0.0025],...
'stepLadder', [1],...
'prevtstamp', '20190316_033531_1_81',...
'prevtstampID', 7)


% 20190316_092219_1_242
proj_test015('stepSize', 1.1,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 50,...
'parallel', true, ...
'poolsize', 24,...
'temperatureLadder', [0.0075],...
'stepLadder', [1],...
'prevtstamp', '20190316_044847_1_81',...
'prevtstampID', 24) % ---> continued above. much tighter temo and step size 

%---------------------------------------------------
% ----__--------------

% ALL HAD A FATAL ERROR
% tightened the square. searching a smaller, better conditioned space now. 
% can expand later. should be good. 
proj_test015_corr1_Ffix('stepSize', 1.3,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 10,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.01 0.005],...
'stepLadder', [1]) % 

% ----- corrections ----- with forward rate parameters fixed. 
% somehow the LHS region was too big. too much ill conditioning. 

% 20190314_083312_1_0p20762
% terminated at 0.01 at 9 iters. 
proj_test015_corr1_Ffix('stepSize', 1.2,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 12,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.01 0.0075 0.005 0.0025],...
'stepLadder', [1]) % done

proj_test015_corr1_Ffix('stepSize', 1.2,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 12,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.005],...
'stepLadder', [1], ...
'prevtstamp', '20190314_083312_1_0p20762',...
'prevtstampID', 9) % done


% ----- corrections -----

%  20190314_050144_1_0p20762
proj_test015_corr1('stepSize', 1.2,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.01],...
'stepLadder', [1]) % done

% 20190314_072843_1_0p083047
proj_test015_corr1('stepSize', 1.2,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.004],...
'stepLadder', [1], ...
'prevtstamp', '20190314_050144_1_0p20762',...
'prevtstampID', 20) %stopped at 5

% 20190314_080601_1_0p062285
proj_test015_corr1('stepSize', 1.15,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.003],...
'stepLadder', [1], ...
'prevtstamp', '20190314_072843_1_0p083047',...
'prevtstampID', 5) %stopped at 3


% ---------- calibration -------
% 20190313_091216_1_0p32242
proj_test015('stepSize', 1.2,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.01],...
'stepLadder', [1]) % ran for 9 iterations. 


% extended the parameter range limits. -15 to 10. 
% 20190313_101830_1_0p32242
proj_test015('stepSize', 1.2,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.01],...
'stepLadder', [1],...
'prevtstamp', '20190313_091216_1_0p32242',...
'prevtstampID', 9) % complete

% 20190313_130351_1_0p32242
proj_test015('stepSize', 1.2,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.01],...
'stepLadder', [1],...
'prevtstamp', '20190313_101830_1_0p32242',...
'prevtstampID', 20) % complete

% 20190313_153908_1_0p32242
proj_test015('stepSize', 1.2,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 5,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.01],...
'stepLadder', [1],...
'prevtstamp', '20190313_130351_1_0p32242',...
'prevtstampID', 20) % done

% 20190313_171758_1_0p064484
proj_test015('stepSize', 1.1,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 80,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.002],...
'stepLadder', [1],...
'prevtstamp', '20190313_153908_1_0p32242',...
'prevtstampID', 5) % terminated at 60

% 20190313_171758_1_0p064484
proj_test015('stepSize', 1.1,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 30,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.004],...
'stepLadder', [1],...
'prevtstamp', '20190313_171758_1_0p064484',...
'prevtstampID', 60) % done



%%%%%%%%

% ec2-3-1-25-154.ap-southeast-1.compute.amazonaws.com
% 20190221_074748_1_2
proj_vnprl('ver', 'F2',...
'stepSize', 1.2,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 80,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.0001],...
'stepLadder', [1],...
'prevtstamp', '20190220_102006_1_2',...
'prevtstampID', 31) % complete. 

% 20190223_024333_1_2
proj_vnprl('ver', 'F2',...
'stepSize', 1.2,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.0001],...
'stepLadder', [1],...
'prevtstamp', '20190221_074748_1_2') % 


-----------------------


% massive ram requirements. should be cool. 
% 20190217_160345_1_48
proj_vnprl('ver', 'F2',...
'stepSize', 1.2,...
'nW', 9600,...
'nPoints', 100*9600,...
'thinning', 1,...
'nIter', 10,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.002 0.001 0.0005],...
'stepLadder', [1]) % terminated after 0.002.


% 20190218_135635_1_24
% 20190218_135635_2_12
proj_vnprl('ver', 'F2',...
'stepSize', 1.2,...
'nW', 1200,...
'nPoints', 100*1200,...
'thinning', 1,...
'nIter', 25,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.001 0.0005],...
'stepLadder', [1],...
'prevtstamp', '20190217_160345_1_48') % ran both temps.

%20190219_093714_1_7
% 20190219_093714_2_2
proj_vnprl('ver', 'F2',...
'stepSize', 1.2,...
'nW', 1200,...
'nPoints', 100*1200,...
'thinning', 1,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.0003 0.0001],...
'stepLadder', [1],...
'prevtstamp', '20190218_135635_2_12') % done

% 20190220_022918_1_2
proj_vnprl('ver', 'F2',...
'stepSize', 1.2,...
'nW', 1200,...
'nPoints', 100*1200,...
'thinning', 1,...
'nIter', 30,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.0001],...
'stepLadder', [1],...
'prevtstamp', '20190219_093714_2_2') % spot termination @ iter 16


% 20190220_102006_1_2
proj_vnprl('ver', 'F2',...
'stepSize', 1.2,...
'nW', 1200,...
'nPoints', 100*1200,...
'thinning', 1,...
'nIter', 40,...
'parallel', true, ...
'poolsize', 36,...
'temperatureLadder', [0.0001],...
'stepLadder', [1],...
'prevtstamp', '20190220_022918_1_2',...
'prevtstampID', 16)


------------
------------
------------
------------
------------%
------------
------------
------------
------------
% ec2-3-1-26-166.ap-southeast-1.compute.amazonaws.com

% 20190215_102557_1_232
proj_acs_dsg2014_regen_H(...
'stepSize', 1.15,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 36,...
'temperatureLadder', [0.004 0.003 0.002],...
'stepLadder', [1],...
'prevtstamp', '20190211_122853_1_290') % starting at 6.19 pm , feb 15. 
% 7 hours per 10 iters, 60 iters == 42hours = 1.12*42 = 47 dollars.
 OK. 2 days - done sun afternoon. 
% this is what simulated annealing will cost for this largest model. so be it. 
% also, can terminate early  


proj_acs_dsg2014_regen_H(...
'stepSize', 1.15,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 0,...
'parallel', true, ...
'poolsize', 36,...
'temperatureLadder', [0.002],...
'stepLadder', [1],...
'prevtstamp', '20190215_102557_3_116')

------------
------------
------------
------------
------------
------------
------------
------------
------------



% THis instance's ID is  ec2-13-251-16-236.ap-southeast-1.compute.amazonaws.com
% The idea here is to do simulated annealing proper, 5 iters per temp, slowly lower. 
% look for global convergence. 



% continues from ec2-13-251-26-66.ap-southeast-1.compute.amazonaws.com, sim id: 
% 20190211_122853_1_290


% 20190213_173314_1_174
proj_acs_dsg2014_regen_H(...
'stepSize', 1.15,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 5,...
'parallel', true, ...
'poolsize', 36,...
'temperatureLadder', [0.003 0.001 0.0009 0.0007 0.0005 0.0003],...
'stepLadder', [1],...
'prevtstamp', '20190211_122853_1_290') % starting at 1.30 am , feb 14. 


------------
------------
------------
------------
------------%
------------
------------
------------
------------
-


% this instance's ID is ec2-13-251-105-32.ap-southeast-1.compute.amazonaws.com


% continues from ec2-13-251-26-66.ap-southeast-1.compute.amazonaws.com. 
% I am continuing % 20190211_213614_1_29 (ie, regen H, temp 0.0005)
% 30 more iterations, at 200 steps per iteration. raise temp a bit and decrease step size
% to raise the acceptance probability. \\
% 20190213_135919_1_29 
proj_acs_dsg2014_regen_H(...
'stepSize', 1.15,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 30,...
'parallel', true, ...
'poolsize', 36,...
'temperatureLadder', [0.002],...
'stepLadder', [1],...
'prevtstamp', '20190211_213614_1_29') % starting at 10 pm, feb 13. 

------------
------------
------------
------------
------------ % 
------------
------------
------------
------------

% ec2-3-1-25-179.ap-southeast-1.compute.amazonaws.com

% NEW public DNS:
% ec2-13-251-1-51.ap-southeast-1.compute.amazonaws.com

% private: 
% ip-172-31-14-169.ap-southeast-1.compute.internal

% this is with 11 params, 
% the only thing not in here is the agtp deg rate and turn on time. 
% 20190209_193419_1_22
proj_acs_dsg2014_regen_E(...
'stepSize', 1.2,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.001],...
'stepLadder', [1])  % terminated at 14


% upweighted the tx+tl from 0.03 to 0.3. (10x increase)
% 20190210_072219_1_20 -- started feb 10, 3.23 pm
proj_acs_dsg2014_regen_E(...
'stepSize', 1.2,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.0005],...
'stepLadder', [1],...
'prevtstamp', '20190209_193419_1_22',...
'prevtstampID', 14)   %%%%% terminated at 13 iters. 
% 20 runs, about 16 hours to run them 
% -- expected end time is 8 am tomorrow morning. (monday)
% verified as accurate. 


% started at 2.48 am on monday, feb 11. 
% 20190210_184717_1_2
proj_acs_dsg2014_regen_E(...
'stepSize', 1.2,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.00005],...
'stepLadder', [1],...
'prevtstamp', '20190210_072219_1_20',...
'prevtstampID', 13) %-- expected end time -- 6 / 7 pm mon feb 11. 


% 20190211_123400_1_290
proj_acs_dsg2014_regen_I(...
'stepSize', 1.2,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.005 0.0005 0.00005],...
'stepLadder', [1]) %-- terminated at the first temp, at iter 9
% spot instance termination.

% 20190211_214449_1_29
proj_acs_dsg2014_regen_I(...
'stepSize', 1.2,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.0005 0.00005],...
'stepLadder', [1],...
'prevtstamp', '20190211_123400_1_290',...
'prevtstampID', 9) % 11 pm for the 0.0005 to end, 
% then another 18 hours (ie, 5 pm tomorrow feb 13) for the 0.00005 to end. 
% just terminate at 11 pm on feb 12. dont need to do the 0.00005 for now. 
%terminating after the completion of 0.0005.


------------
------------
------------
------------
------------
------------
% ------------ 
------------
------------
------------
------------
------------

% ec2-13-251-126-71.ap-southeast-1.compute.amazonaws.com
% NEW public DNS: 
% ec2-13-251-26-66.ap-southeast-1.compute.amazonaws.com

% private DNS: 
% ip-172-31-9-187.ap-southeast-1.compute.internal

% simdata_20190209_070634_1_1088
proj_acs_dsg2014_regen_C1(...
'stepSize', 1.15,...
'nW', 1200,...
'nPoints', 100*400,...
'thinning', 1,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.05],...
'stepLadder', [1]) 
%---- ran for 14 iters. 
% then realized that both experiment and dose 
% weighting were messing us up. 

% 20190209_091205_1_231
proj_acs_dsg2014_regen_C1(...
'stepSize', 1.15,...
'nW', 1200,...
'nPoints', 50*1200,...
'thinning', 1,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.01],...
'stepLadder', [1],...
'prevtstamp', '20190209_070634_1_1088',...
'prevtstampID', 14) 
%---- ran for 6 iters. 
% acceptance probability was around 45% too high. need to halve it. 

% 20190209_104120_1_23 --  rejection prob is about 71%, not bad. 
proj_acs_dsg2014_regen_C1(...
'stepSize', 1.15,...
'nW', 1200,...
'nPoints', 100*1200,...
'thinning', 1,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.001],...
'stepLadder', [1],...
'prevtstamp', '20190209_091205_1_231',...
'prevtstampID', 6) % terminated at 17 iters. moved the data to my mac. 
% need to plot to see the results. 


% feb 10, 3 am , 
% starting a 6 parameter run, with only the tx and tl data, no rna deg 

% 20190209_191801_1_127
proj_acs_dsg2014_regen_G(...
'stepSize', 1.2,...
'nW', 1200,...
'nPoints', 100*1200,...
'thinning', 1,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.002],...
'stepLadder', [1])  

% 20190210_030032_1_127
proj_acs_dsg2014_regen_G(...
'stepSize', 1.2,...
'nW', 1200,...
'nPoints', 100*1200,...
'thinning', 1,...
'nIter', 40,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.002],...
'stepLadder', [1],...
'prevtstamp', '20190209_191801_1_127') %%%%% done.

%20190210_123436_1_32
proj_acs_dsg2014_regen_G(...
'stepSize', 1.2,...
'nW', 1200,...
'nPoints', 100*1200,...
'thinning', 1,...
'nIter', 60,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.0005],...
'stepLadder', [1],...
'prevtstamp', '20190210_030032_1_127')

%%expected end time: 10.15 am monday morning. feb 11. 
% terminating at iter 27 at 2.50 am. feb 11.. going to restart at a lower temperature. 

% 20190210_185320_1_3
proj_acs_dsg2014_regen_G(...
'stepSize', 1.2,...
'nW', 1200,...
'nPoints', 100*1200,...
'thinning', 1,...
'nIter', 80,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.00005],...
'stepLadder', [1],...
'prevtstamp', '20190210_123436_1_32',...
'prevtstampID', 27) % done to completion.  

% 20190211_122853_1_290
proj_acs_dsg2014_regen_H(...
'stepSize', 1.2,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 10,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.005 0.0005 0.00005],...
'stepLadder', [1]) %  terminated at the end of temp1, 
%after the full 10 iters. (due to spot instance i think. regenerated new public IP.)

% 20190211_213614_1_29
proj_acs_dsg2014_regen_H(...
'stepSize', 1.2,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 10,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.0005 0.00005],...
'stepLadder', [1],...
'prevtstamp', '20190211_122853_1_290') % . expected end time: 10pm feb 12... done.

% Ok so the 0.00005 is too low. the 0.0005 is a good value, 
still allows for some mixing. 0.005 is too hot, 
% the error stays too high. 
% so the next iteration will be contintued from 0.0005, on a 
c5.9xlarge. or a larger machine?
% next instance where this continues is 
ec2-13-251-105-32.ap-southeast-1.compute.amazonaws.com above. 

------------
------------
------------
------------
------------
% ------------ 
------------
------------
------------
------------
------------
------------
% 48 core machine. lets go!
% ec2-13-251-59-146.ap-southeast-1.compute.amazonaws.com
proj_acs_dsg2014_regen_C1(...
'stepSize', 1.15,...
'nW', 1200,...
'nPoints', 100*1200,...
'thinning', 1,...
'nIter', 30,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.001],...
'stepLadder', [1]) 

% 20190209_110209_1_21 -- rejection prob is about 80%. good!
proj_acs_dsg2014_regen_C1(...
'stepSize', 1.2,...
'nW', 1200,...
'nPoints', 100*1200,...
'thinning', 1,...
'nIter', 30,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.001],...
'stepLadder', [1]) 

% setting up a new sim: regen_D: 
% 20190209_184946_1_44
proj_acs_dsg2014_regen_D(...
'stepSize', 1.2,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 40,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.002],...
'stepLadder', [1]) 

% upweighted the tx+tl from 0.03 to 0.3. (10x increase)
% and a 4 x decrease in temperature. should really tighten up the 
% fits. 
%20190210_072127_1_20 -- started feb 10, 3.22 pm
proj_acs_dsg2014_regen_D(...
'stepSize', 1.2,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.0005],...
'stepLadder', [1],...
'prevtstamp', '20190209_184946_1_44',...
'prevtstampID', 24) %% DONE at 2.30 am mon feb 11. 
% this will end at about 4am on monday morning 
% thats not good. going to terminate this, and 
% restart at a lower temperature, so it terminates in the day sometime. 
% (ideally in the morning, at like 10 am after I wake up.)

% 20190210_184039
proj_acs_dsg2014_regen_F(...
'stepSize', 1.2,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 10,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.005 0.0005 0.00005],...
'stepLadder', [1]) %30 iters -- 16 - 17 hours projected time, 
% expected end time mon feb 11, 6 - 7 pm. terminated at 1.30 pm. 
aftr 2 temperatures (full 10 iters)
% ie,  0.00005 was never done.



% simdata_20190211_054328_1_20
% goal: complete decorrelation of the chains. 
% -- maybe even redo it for another 20 iters after this. 
proj_acs_dsg2014_regen_F(...
'stepSize', 1.2,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 20,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.0005],...
'stepLadder', [1],...
'prevtstamp', '20190210_184039_2_20') % terminated at 15.

% 20190211_140024_1_20
proj_acs_dsg2014_regen_F1(...
'stepSize', 1.2,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 30,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.0005],...
'stepLadder', [1],...
'prevtstamp', '20190211_054328_1_20',...
'prevtstampID', 15) % . - 
% expected end time -- around 1 - 2 pm feb 12. terminate at 1.30pm, 
% and maybe restart the sim for another 10 iterations. 
% terminating at 29 iterations. 

% 20190212_053457_1_20
proj_acs_dsg2014_regen_F1(...
'stepSize', 1.2,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 11,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.0005],...
'stepLadder', [1],...
'prevtstamp', '20190211_140024_1_20',...
'prevtstampID', 29)

% 20190212_114314_1_20
proj_acs_dsg2014_regen_F1(...
'stepSize', 1.2,...
'nW', 1200,...
'nPoints', 200*1200,...
'thinning', 1,...
'nIter', 22,...
'parallel', true, ...
'poolsize', 48,...
'temperatureLadder', [0.0005],...
'stepLadder', [1],...
'prevtstamp', '20190212_053457_1_20')
------------
------------
------------

------------
------------
------------
------------
------------
% ------------  END OF ACTIVE SETS> historical records below: 

------------
------------
------------
------------
------------
------------

------------
------------
------------
------------
------------
------------

------------
------------
------------
------------
------------

------------
------------
------------
------------
------------
------------

------------
------------
------------
------------
------------
------------

------------
------------
------------
------------
------------
------------

------------
------------
------------

% SHUT ALL these down, feb 9, 2019. 


%used to generate the right model object:
proj_acs_dsg2014_regen_A('stepSize', 1.2,...
'nW', 50,...
'nPoints', 10*50,...
'thinning', 1,...
'nIter', 2,...
'parallel', false, ...
'poolsize', 2,...
'temperatureLadder', [0.01],...
'stepLadder', [1])


------------
------------
------------
------------
%ec2-3-1-26-49.ap-southeast-1.compute.amazonaws.com
proj_acs_dsg2014_regen_A('stepSize', 1.2,...
'nW', 400,...
'nPoints', 200*400,...
'thinning', 1,...
'nIter', 40,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.01],...
'stepLadder', [1],...
'prevtstamp', '20190206_043320_1_218')

% ------ new session on the same machine. here, we have expanded the param ranges, 
% and defined a new project with these expanded ranges. 
% again, just testing the step size and the temperature combinations. 
proj_acs_dsg2014_regen_A1(...
'stepSize', 1.05,...
'nW', 400,...
'nPoints', 100*400,...
'thinning', 1,...
'nIter', 10,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [10 5 1 0.1 0.01 0.001],...
'stepLadder', [6 3 2 1.7 1.4 1.2 1.1 1 0.75 0.5],...
'literalStepLadder', true) % expected end time 10.30 pm feb 8

------------
------------
------------
-------------

%ec2-13-251-35-115.ap-southeast-1.compute.amazonaws.com
% 20190208_041042_1:
proj_acs_dsg2014_regen_A('stepSize', 1.4,...
'nW', 400,...
'nPoints', 200*400,...
'thinning', 1,...
'nIter', 40,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.01],...
'stepLadder', [1],...
'prevtstamp', '20190206_043320_1_218')


% 20190208_041042_1_17407:
proj_acs_dsg2014_regen_A('stepSize', 3.4,...
'nW', 400,...
'nPoints', 200*400,...
'thinning', 1,...
'nIter', 4,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.8],...
'stepLadder', [1],...
'prevtstamp', '20190207_155723_1_218') % 96% rejection, did 2 iter

%20190208_044547_1_17407
proj_acs_dsg2014_regen_A('stepSize', 2.4,...
'nW', 400,...
'nPoints', 200*400,...
'thinning', 1,...
'nIter', 1,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.8],...
'stepLadder', [1],...
'prevtstamp', '20190208_041042_1_17407',...
'prevtstampID', 2) % 

%20190208_051536_1_108797
proj_acs_dsg2014_regen_A('stepSize', 2.4,...
'nW', 400,...
'nPoints', 200*400,...
'thinning', 1,...
'nIter', 2,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [5],...
'stepLadder', [1],...
'prevtstamp', '20190208_044547_1_17407',...
'prevtstampID', 2) % 

%'20190208_054905'
% -20190208_054905_1_217593, and so on. [[[[[TEMP LADDER]]]]]
proj_acs_dsg2014_regen_A('stepSize', 1.05,...
'nW', 400,...
'nPoints', 100*400,...
'thinning', 1,...
'nIter', 10,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [10 5 1 0.1 0.01 0.001],...
'stepLadder', [6 3 2 1.7 1.4 1.2 1.1 1 0.75 0.5],...
'prevtstamp', '20190208_051536_1_108797',...
'literalStepLadder', true) % expected end time -- 11.30 pm feb8. 
-------------
------------
------------
------------

% ec2-13-251-129-65.ap-southeast-1.compute.amazonaws.com
% '20190207_162351_1_218':
proj_acs_dsg2014_regen_A('stepSize', 1.8,...
'nW', 400,...
'nPoints', 200*400,...
'thinning', 1,...
'nIter', 40,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.01],...
'stepLadder', [1],...
'prevtstamp', '20190206_043320_1_218') %--->'20190207_162351_1_218'

%20190208_035625_1_2176
proj_acs_dsg2014_regen_A('stepSize', 1.8,...
'nW', 400,...
'nPoints', 200*400,...
'thinning', 1,...
'nIter', 40,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [0.1],...
'stepLadder', [1],...
'prevtstamp', '20190208_031916_1_218', ...
'prevtstampID', 1) %--- terminated at 15 iterations
-----

% fixed params, temp ladder, step ladder, LHS init, regen_C1. 
% 20190208_075812_1
proj_acs_dsg2014_regen_C1(...
'stepSize', 1.05,...
'nW', 400,...
'nPoints', 200*400,...
'thinning', 1,...
'nIter', 7,...
'parallel', true, ...
'poolsize', 18,...
'temperatureLadder', [10 5 1 0.1 0.01 0.001],...
'stepLadder', [4 2 1.7 1.4 1.2 1.1 1],...
'literalStepLadder', true) % expected end time -- 11.30 pm feb8. 




