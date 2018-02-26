%% VNPRL fitting
% Vipul Singhal, California Institute of Technology
% 2018
% 
% We set up the estimation of the data from the PRL paper: 
% Karzbrun, Eyal, Jonghyeon Shin, Roy H. Bar-Ziv, and Vincent Noireaux. 
% "Coarse-Grained Dynamics of Protein Synthesis in a Cell-Free System." 
% Physical Review Letters 106, no. 4 (January 24, 2011): 48104. 
% https://doi.org/10.1103/PhysRevLett.106.048104.
% 
% It is not exactly the data from this paper, instead uses a modification
% of the data from ACS DSG 2014. 
% Some of the main conclusions of that paper were: 
% - Transcriptional Elongation rate: 1 ntp/s
% - Translational Elongation rate: >4 aa/s
% - mRNA exponential decay, even when purified RNA is in excess of 200nM
% - mRNA degradation half life: 10 - 14 min
% - 30nM RNAP conc
% - 1.5nM RNAP - promoter Kd
% - Protein production linear in mRNA (TL machinery not saturated)
% - 1uM protein in 1h, And anywhere between 3 to 10 uM by the end (5 ish
% hours)
% - dp/dt|max is about 30 to 40 nM / min for proteins
% - For 30 nM of DNA, mRNA steady state is 20 - 30 nM. 
% 
% The estimation uses the following fits: 
% - mrna data from ACS DSG with the conc values all divided by 10 (the
% original values in that paper seem unlikey, since they would use too many
% nucleotides. 
% - protein max values come down from 10uM to 10uM
% - the rna degradation values just basically are exactly the same as in 
% the ACS paper 


%% initialize the directory where things are stored.
[tstamp, projdir, st] = project_init;
% data_init

%% data_info struct. 
di = data_VNPRL2011;
da1 =  squeeze(di(1).dataArray);
da2 =  squeeze(di(2).dataArray);
ntrej = 30;
figure

subplot(2, 2,2) % MGa
tv1hrs = di(1).timeVector(1:end-ntrej)/3600;
mga1 = squeeze(da1(1:end-ntrej,1,:));
plot(tv1hrs, mga1);
xlabel('hours')
ylabel('MGa, nM')
title('MG aptamer/10, ACS DSG 2014')

subplot(2, 2,1) % dgfp post interp 
dgfp1 = diff(squeeze(da1(1:end-ntrej+1,2,:)))...
        ./...
        diff(di(1).timeVector(1:end-ntrej+1));
plot(tv1hrs,dgfp1);
xlabel('hours')
ylabel('dgfp/dt, nM/s')
title('dgfp/dt, post interpolation')

subplot(2, 2,3) % dgfp pre interp
tv2hrs = di(2).timeVector(1:end-ntrej)/3600;
dgfp2 = da2((1:end-ntrej),:);

plot(tv2hrs,dgfp2);
xlabel('hours')
ylabel('dgfp/dt, nM/s')
title('dgfp/dt, pre interpolation')


subplot(2, 2,4) % gfp
gfp = squeeze(da1(1:end-ntrej,2,:));
plot(tv2hrs, gfp);
xlabel('hours')
ylabel('GFP, nM')
title('GFP/1.8, ACS DSG 2014')

%% repopulate the data info structs' data array and time vector with these 
% truncated-in-time data sets. (truncated to show only the data before 10
% hours)
da1 = di(1).dataArray;
da2 = di(2).dataArray;
tv1 = di(1).timeVector;
tv2 = di(2).timeVector; 

ix1 = tv1<10*3600;
tv1 = tv1(ix1);
da1 = da1(ix1, :, :, :);
di(1).dataArray = da1;
di(1).timeVector = tv1;

ix2 = tv2<10*3600;
tv2 = tv2(ix2);
da2 = da2(ix2, :, :, :);
di(2).dataArray = da2;
di(2).timeVector = tv2;


%% construct simbiology model object(s)
mobj = model_dsg2014; % use the same model as dsg2014. (this is just 
% the basic constitutive production model)

%% %% setup the mcmc_info struct - capture all the mcmc information 
% except the data and the model. 
mcmc_info = mcmc_info_vnprl2011(mobj);
ri = mcmc_info.runsim_info;
mai = mcmc_info.master_info;

%% set up the MCMC estimation
% 
% marray = mcmc_get_walkers({'20180221_011619'}, {2}, projdir);
% marray_cut = mcmc_cut(marray, (1:10), flipud((mai.paramRanges)'));
% if size(marray_cut, 2) < ri.nW
%     error('too few initial points');
% elseif size(marray_cut, 2) > ri.nW
%     marray_cut = marray_cut(:,1:ri.nW, :);
% end
%%
mi = mcmc_runsim_v2(tstamp, projdir, di, mcmc_info,...
    'InitialDistribution', 'LHS');
% 'UserInitialize', marray_cut(:,:,end)
%'InitialDistribution', 'gaussian' 'UserInitialize', marray_cut(:,:,end)); 
%%
 load([projdir '/simdata_' tstamp '/full_variable_set_' tstamp '.mat']);
% %%
% marray = mcmc_get_walkers({tstamp}, {1:2}, projdir);
% %%
% mcmc_plot(marray(:,1:2:400,:), mai.estNames);
% %% plot trajectories
% titls = {'dna 0.5'; 'dna 2';'dna 5';'dna 20'};
% lgds = {};
% % marray must be in the right order to go into the exported model object. 
% 
% mvarray = masterVecArray(marray, mai);
% marrayOrd = mvarray(mi(1).paramMaps(mi(1).orderingIx, 1),:,:);
% %% plot trajectories
% close all
% 
% aaa = [{[  2.1904]} {'TX_elong_glob'                  }
%     {[  6]}        {'TL_elong_glob'                  }
%     {[  6.7502]}    {'AGTPdeg_time'                   }
%     {[ -8.9816]}    {'AGTPdeg_rate'                   }
%     {[ -1.9799]}    {'TXTL_PROT_deGFP_MATURATION'     }
%     {[ -1.4155]}    {'TXTL_UTR_UTR1_Kd'               }
%     {[  4.0949]}    {'TXTL_UTR_UTR1_F'                }
%     {[  1.8325]}    {'TXTL_P70_RNAPbound_Kd'          }
%     {[  4.5064]}    {'TXTL_P70_RNAPbound_F'           }
%     {[  -2.297]}    {'TXTL_RNAPBOUND_TERMINATION_RATE'}
%     {[0.096026]}    {'TXTL_NTP_RNAP_1_Kd'             }
%     {[  6.1533]}    {'TXTL_NTP_RNAP_1_F'              }
%     {[  2.2435]}    {'TXTL_NTP_RNAP_2_Kd'             }
%     {[-0.83904]}    {'TXTL_NTP_RNAP_2_F'              }
%     {[  3.4805]}    {'TL_AA_Kd'                       }
%     {[-0.22471]}    {'TL_AA_F'                        }
%     {[  5.6524]}    {'TL_AGTP_Kd'                     }
%     {[ 0.97604]}    {'TL_AGTP_F'                      }
%     {[    4   ]}    {'TXTL_RIBOBOUND_TERMINATION_RATE'}
%     {[  8.5748]}    {'TXTL_RNAdeg_Kd'                 }
%     {[ -0.5005]}    {'TXTL_RNAdeg_F'                  }
%     {[ -5.1466]}    {'TXTL_RNAdeg_kc'                 }
%     {[  2.2309]}    {'RNAP'                           }
%     {[  6.7048]}    {'Ribo'                           }
%     {[  4.5145]}    {'RNase'                          }];
% 
% 
% aaa =...
%     [{[  2.1904]}    {[  2.1904]}    {'TX_elong_glob'     }
%     {[  6.1017]}    {[  6.1017]}    {'TL_elong_glob'     }
%     {[  6.7502]}    {[  6.7502]}    {'AGTPdeg_time'      }
%     {[ -8.9816]}    {[ -8.9816]}    {'AGTPdeg_rate'      }
%     {[ -1.9799]}    {[ -1.9799]}    {'TXTL_PROT_deGFP_?'}
%     {[ -1.4155]}    {[ -1.4155]}    {'TXTL_UTR_UTR1_Kd'  }
%     {[  1.0949]}    {[  1.0949]}    {'TXTL_UTR_UTR1_F'   }
%     {[  1.8325]}    {[  1.8325]}    {'TXTL_P70_RNAPbou?'}
%     {[  4.5064]}    {[  4.5064]}    {'TXTL_P70_RNAPbou?'}
%     {[  -2.297]}    {[  -2.297]}    {'TXTL_RNAPBOUND_T?'}
%     {[0.096026]}    {[0.096026]}    {'TXTL_NTP_RNAP_1_Kd'}
%     {[  2.1533]}    {[  2.1533]}    {'TXTL_NTP_RNAP_1_F' }
%     {[  2.2435]}    {[  2.2435]}    {'TXTL_NTP_RNAP_2_Kd'}
%     {[-0.83904]}    {[-0.83904]}    {'TXTL_NTP_RNAP_2_F' }
%     {[  3.4805]}    {[  3.4805]}    {'TL_AA_Kd'          }
%     {[-0.22471]}    {[-0.22471]}    {'TL_AA_F'           }
%     {[  5.6524]}    {[  5.6524]}    {'TL_AGTP_Kd'        }
%     {[ 0.97604]}    {[ 0.97604]}    {'TL_AGTP_F'         }
%     {[-0.95634]}    {[-0.95634]}    {'TXTL_RIBOBOUND_T?'}
%     {[  8.5748]}    {[  8.5748]}    {'TXTL_RNAdeg_Kd'    }
%     {[ -0.5005]}    {[ -0.5005]}    {'TXTL_RNAdeg_F'     }
%     {[ -5.1466]}    {[ -5.1466]}    {'TXTL_RNAdeg_kc'    }
%     {[  2.2309]}    {[  2.2309]}    {'RNAP'              }
%     {[  6.7048]}    {[  6.7048]}    {'Ribo'              }
%     {[  4.5145]}    {[  4.5145]}    {'RNase'             }]
% simulatecurves(mi(1).emo,cell2mat(aaa(:,1))',...
%     1, di.dosedVals', tv{1}, mi.measuredSpecies)
% 
% % mcmc_trajectories(mi(1).emo, di(1), mi(1), cell2mat(aaa(:,1))', titls, lgds,...
% %     'SimMode', 'curves')
% 
% 
% 



