%% MCMC toolbox demo
% Vipul Singhal, California Institute of Technology
% 2017
% We demonstrate the use of the MCMC estimation capabilities of the txtl
% modeling toolbox here. 
% 
% This is the second part of the parameter estimation example
% proj_acs_dsg2014

% We set up an estimation problem with constitutively expressed 
% GFP in TXTL at different DNA concentrations. The mrna parameters 
% have already been fixed in part one of the estimation: proj_acs_dsg2014_mrna
% Now we still vary the DNA, and keep the mRNA parameters fixed and try to
% estimate the protien parameters. The species that get fit is just the GFP
% protien. 

%% initialize the directory where things are stored.
[tstamp, projdir, st] = project_init;
% data_init

% data_info struct. 
di = data_dsg2014; %

di.dataArray = di.dataArray(:, 2, :, :); % pick out only the protein
di.measuredNames = di.measuredNames(2);
di.dataUnits = di.dataUnits(2);
di.dataInfo = ['Modified to only have protein data. \n ',...
di.dataInfo];

%% construct simbiology model object(s)
mobj = model_dsg2014;

%% %% setup the mcmc_info struct - capture all the mcmc information 
% except the data and the model. 
mcmc_info = mcmc_info_dsg2014_protein_v2(mobj);
ri = mcmc_info.runsim_info;
mai = mcmc_info.master_info;

%% set up the MCMC estimation

marray = mcmc_get_walkers({'20180221_011619'}, {2}, projdir);
marray_cut = mcmc_cut(marray, (1:10), flipud((mai.paramRanges)'));
if size(marray_cut, 2) < ri.nW
    error('too few initial points');
elseif size(marray_cut, 2) > ri.nW
    marray_cut = marray_cut(:,1:ri.nW, :);
end
%%

mi = mcmc_runsim_v2(tstamp, projdir, di, mcmc_info,...
    'UserInitialize', marray_cut(:,:,end));
%'InitialDistribution', 'gaussian' 'UserInitialize', marray_cut(:,:,end)); 
%%
% /Users/vipulsinghal/Dropbox/Documents/toolbox/txtlsim_vsfork2017/mcmc_simbio/projects/proj_acs_dsg2014_protein/simdata_20180221_103250
projdir = '/Users/vipulsinghal/Dropbox/Documents/toolbox/txtlsim_vsfork2017/mcmc_simbio/projects/proj_acs_dsg2014_protein';

tstamp = '20180221_103250';
 load([projdir '/simdata_' tstamp '/full_variable_set_' tstamp '.mat']);
%%
marray = mcmc_get_walkers({tstamp}, {1:10}, projdir);
%%
mcmc_plot(marray(:,1:2:400,:), mai.estNames);
%% plot trajectories
titls = {'dna 0.5'; 'dna 2';'dna 5';'dna 20'};
lgds = {};
% marray must be in the right order to go into the exported model object. 

mvarray = masterVecArray(marray, mai);
marrayOrd = mvarray(mi(1).paramMaps(mi(1).orderingIx, 1),:,:);
%%
mcmc_trajectories(mi(1).emo, di(1), mi(1), marrayOrd(:,:,end), titls, lgds,...
    'SimMode', 'curves')
%% plot trajectories
close all

aaa = [{[  2.1904]} {'TX_elong_glob'                  }
    {[  6]}        {'TL_elong_glob'                  }
    {[  6.7502]}    {'AGTPdeg_time'                   }
    {[ -8.9816]}    {'AGTPdeg_rate'                   }
    {[ -1.9799]}    {'TXTL_PROT_deGFP_MATURATION'     }
    {[ -1.4155]}    {'TXTL_UTR_UTR1_Kd'               }
    {[  4.0949]}    {'TXTL_UTR_UTR1_F'                }
    {[  1.8325]}    {'TXTL_P70_RNAPbound_Kd'          }
    {[  4.5064]}    {'TXTL_P70_RNAPbound_F'           }
    {[  -2.297]}    {'TXTL_RNAPBOUND_TERMINATION_RATE'}
    {[0.096026]}    {'TXTL_NTP_RNAP_1_Kd'             }
    {[  6.1533]}    {'TXTL_NTP_RNAP_1_F'              }
    {[  2.2435]}    {'TXTL_NTP_RNAP_2_Kd'             }
    {[-0.83904]}    {'TXTL_NTP_RNAP_2_F'              }
    {[  3.4805]}    {'TL_AA_Kd'                       }
    {[-0.22471]}    {'TL_AA_F'                        }
    {[  5.6524]}    {'TL_AGTP_Kd'                     }
    {[ 0.97604]}    {'TL_AGTP_F'                      }
    {[    4   ]}    {'TXTL_RIBOBOUND_TERMINATION_RATE'}
    {[  8.5748]}    {'TXTL_RNAdeg_Kd'                 }
    {[ -0.5005]}    {'TXTL_RNAdeg_F'                  }
    {[ -5.1466]}    {'TXTL_RNAdeg_kc'                 }
    {[  2.2309]}    {'RNAP'                           }
    {[  6.7048]}    {'Ribo'                           }
    {[  4.5145]}    {'RNase'                          }];


aaa =...
    [{[  2.1904]}    {[  2.1904]}    {'TX_elong_glob'     }
    {[  6.1017]}    {[  6.1017]}    {'TL_elong_glob'     }
    {[  6.7502]}    {[  6.7502]}    {'AGTPdeg_time'      }
    {[ -8.9816]}    {[ -8.9816]}    {'AGTPdeg_rate'      }
    {[ -1.9799]}    {[ -1.9799]}    {'TXTL_PROT_deGFP_?'}
    {[ -1.4155]}    {[ -1.4155]}    {'TXTL_UTR_UTR1_Kd'  }
    {[  1.0949]}    {[  1.0949]}    {'TXTL_UTR_UTR1_F'   }
    {[  1.8325]}    {[  1.8325]}    {'TXTL_P70_RNAPbou?'}
    {[  4.5064]}    {[  4.5064]}    {'TXTL_P70_RNAPbou?'}
    {[  -2.297]}    {[  -2.297]}    {'TXTL_RNAPBOUND_T?'}
    {[0.096026]}    {[0.096026]}    {'TXTL_NTP_RNAP_1_Kd'}
    {[  2.1533]}    {[  2.1533]}    {'TXTL_NTP_RNAP_1_F' }
    {[  2.2435]}    {[  2.2435]}    {'TXTL_NTP_RNAP_2_Kd'}
    {[-0.83904]}    {[-0.83904]}    {'TXTL_NTP_RNAP_2_F' }
    {[  3.4805]}    {[  3.4805]}    {'TL_AA_Kd'          }
    {[-0.22471]}    {[-0.22471]}    {'TL_AA_F'           }
    {[  5.6524]}    {[  5.6524]}    {'TL_AGTP_Kd'        }
    {[ 0.97604]}    {[ 0.97604]}    {'TL_AGTP_F'         }
    {[-0.95634]}    {[-0.95634]}    {'TXTL_RIBOBOUND_T?'}
    {[  8.5748]}    {[  8.5748]}    {'TXTL_RNAdeg_Kd'    }
    {[ -0.5005]}    {[ -0.5005]}    {'TXTL_RNAdeg_F'     }
    {[ -5.1466]}    {[ -5.1466]}    {'TXTL_RNAdeg_kc'    }
    {[  2.2309]}    {[  2.2309]}    {'RNAP'              }
    {[  6.7048]}    {[  6.7048]}    {'Ribo'              }
    {[  4.5145]}    {[  4.5145]}    {'RNase'             }]
simulatecurves(mi(1).emo,cell2mat(aaa(:,1))',...
    1, di.dosedVals', tv{1}, mi.measuredSpecies)

 mcmc_trajectories(mi(1).emo, di(1), mi(1), cell2mat(aaa(:,1))', titls, lgds,...
     'SimMode', 'curves')






