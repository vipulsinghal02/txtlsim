%% MCMC toolbox demo
% Vipul Singhal, California Institute of Technology
% 2017
% We demonstrate the use of the MCMC estimation capabilities of the txtl
% modeling toolbox here. We set up an estimation problem with
% constitutively expressed GFP in TXTL at different DNA concentrations.
%
% The MCMC Metropolis Hastings routine based on Aslak Grinsted's MATLAB
% implementation of the Goodman and Weare Affine Invariant Ensemble MCMC
% method. More info:
% Goodman and Weare's paper can be found using the DOI: 10.2140/camcos.2010.5.65
% Aslak Grinsted's code: https://github.com/grinsted/gwmcmc

%% initialize the directory where things are stored.
[tstamp, projdir, st] = project_init;

%% import data as a 4D matalb array, along with a time vector
% and the associated dosing information
%
% dim 1: has length (#timepoints)
% dim 2: species
% dim 3: replicates
% dim 4: dosing / ICs
% dim 5: extract (optional)
% NOT a dimension, but separate cells containing similar 5D arrays of data
% corresponding to other models.

% the time vector has units seconds
%
% dosed_names is a cell array of strings of size 1 x # dosed species
% dosevals is a # dosed species x # of dosing combinations array of the
% initial values of the doesed variables.
[tv , da, dv] = data_dsg2014; %

%% plot things very roughly
figure

subplot(1,2,1)
p11 = plot(tv/60, mean(da(:, 1, :, 1), 3));hold on
p21 = plot(tv/60, mean(da(:, 1, :, 2), 3));hold on
p31 = plot(tv/60, mean(da(:, 1, :, 3), 3));hold on
p41 = plot(tv/60, mean(da(:, 1, :, 4), 3));hold on
legend([p11, p21 p31 p41], {'0.5nM', '2nM', '5nM', '20nM'})
title('MGa')
subplot(1,2,2)
p12 = plot(tv/60, mean(da(:, 2, :, 1), 3));hold on
p22 = plot(tv/60, mean(da(:, 2, :, 2), 3));hold on
p32 = plot(tv/60, mean(da(:, 2, :, 3), 3));hold on
p42 = plot(tv/60, mean(da(:, 2, :, 4), 3));hold on
legend([p12, p22 p32 p42], {'0.5nM', '2nM', '5nM', '20nM'})
title('GFP')

%% specify parameters and species ICs to estimate
% identities of the parameters and species ICs to estimate, and the
% initinal distribution info (= limits in log space, and how to sample the
% initial distribution of the walkers), what the dosing strategy is, what
% the measured species are, what the mcmc parameters are.
mi = mcmc_info_dsg2014_version2;

%% construct simbiology model object(s)
[m, emo ,mi] = model_dsg2014(mi, tv);
%%

% %% for testing purposes - find a set of params that fit the data.
% % Use those to initialize the mcmc (as gaussian ball around the params)
% 
% % parameter values
% pcells = [{'TX_elong_glob',             1              }
%     {'TL_elong_glob'                    40}
%     {'AGTPdeg_F'                        0      }
%     {'AGTPdeg_time'                     0      }
%     {'AGTPdeg_rate'                     0.0002     }
%     {'TXTL_PROT_deGFP_MATURATION'       0.0023105   }
%     {'TXTL_UTR_UTR1_Kd'                 40    }
%     {'TXTL_UTR_UTR1_F'                  0.62    }
%     {'TXTL_P70_RNAPbound_Kd'            20    }
%     {'TXTL_P70_RNAPbound_F'             20      }
%     {'TXTL_RNAPBOUND_TERMINATION_RATE'  0.05}
%     {'TXTL_NTP_RNAP_1_Kd'               2   }
%     {'TXTL_NTP_RNAP_1_F'                10      }
%     {'TXTL_NTP_RNAP_2_Kd'               10       }
%     {'TXTL_NTP_RNAP_2_F'                1      }
%     {'TL_AA_Kd'                         0.1       }
%     {'TL_AA_F'                          10        }
%     {'TL_AGTP_Kd'                       1       }
%     {'TL_AGTP_F'                        10     }
%     {'TXTL_RIBOBOUND_TERMINATION_RATE'  10}
%     {'TXTL_RNAdeg_Kd'                   1000/.52      }
%     {'TXTL_RNAdeg_F'                    0.001/.4      }];
%     
%     

pcells = [{'TX_elong_glob',           5.1288 *0.00001               }
    {'TL_elong_glob'                    29.021}
    {'AGTPdeg_time'                     11558      }
    {'AGTPdeg_rate'                     0     }
    {'TXTL_PROT_deGFP_MATURATION'       0.0019094   }
    {'TXTL_UTR_UTR1_Kd'                 39.785    }
    {'TXTL_UTR_UTR1_F'                  0.34511    }
    {'TXTL_P70_RNAPbound_Kd'            12.39    }
    {'TXTL_P70_RNAPbound_F'             17.001     }
    {'TXTL_RNAPBOUND_TERMINATION_RATE'  0.076026}
    {'TXTL_NTP_RNAP_1_Kd'               2.142   }
    {'TXTL_NTP_RNAP_1_F'                9.8854      }
    {'TXTL_NTP_RNAP_2_Kd'               13.33       }
    {'TXTL_NTP_RNAP_2_F'                0.75935      }
    {'TL_AA_Kd'                         0.14673       }
    {'TL_AA_F'                          7.4863        }
    {'TL_AGTP_Kd'                       0.85949       }
    {'TL_AGTP_F'                        8.496     }
    {'TXTL_RIBOBOUND_TERMINATION_RATE'  4.611}
    {'TXTL_RNAdeg_Kd'                   2185.8     }
    {'TXTL_RNAdeg_F'                   0.0022382      }];


%        5.1288
%        29.021
%         11558
%    0.00022425
%     0.0019094
%        39.785
%       0.34511
%         12.39
%        17.001
%      0.076026
%         2.142
%        9.8854
%         13.33
%       0.75935
%       0.14673
%        7.4863
%       0.85949
%         8.496
%         4.611
%        2185.8
%     0.0022382
%        42.247
%        100.87
%        81.795
       
       
for i = 1:length(pcells)
    setparam(m, repmat({'global'}, length(pcells), 1), pcells{i,1}, pcells{i,2});
end

[sd] = txtl_runsim(m,tv(end));

cellOfSpecies1 = { 'AGTP','CUTP','RNAP'
    'DNA p70--utr1--deGFP', 'RNAP:DNA p70--utr1--deGFP','AGTP:RNAP:DNA p70--utr1--deGFP'
    'CUTP:RNAP:DNA p70--utr1--deGFP','CUTP:AGTP:RNAP:DNA p70--utr1--deGFP', 'term_RNAP:DNA p70--utr1--deGFP'
    'RNA utr1--deGFP', 'Ribo:RNA utr1--deGFP','AA:Ribo:RNA utr1--deGFP',
    'AA:2AGTP:Ribo:RNA utr1--deGFP','term_Ribo:RNA utr1--deGFP', 'protein deGFP'
    'protein deGFP*', 'AA' 'RNase'
    'RNA utr1--deGFP:RNase', 'Ribo:RNA utr1--deGFP:RNase', 'AA:2AGTP:Ribo:RNA utr1--deGFP:RNase'
    'term_Ribo:RNA utr1--deGFP:RNase', 'AA:Ribo:RNA utr1--deGFP:RNase', 'Ribo'};
plotCustomSpecies2({m}, {sd.Data}, {sd.Time}, cellOfSpecies1)  ;% , [],[],[],[],gcf

%% set up the MCMC estimation
% mcmc_results is a mcmc_results class object.

prevtstamp = '20180117_022400';
finalsimID = '20';
load([pwd '/mcmc_simbio/projects/proj_acs_dsg2014/simdata_' prevtstamp '/mcmc' prevtstamp '_ID' finalsimID '.mat'], 'm');
minit = m(:,:,end);
minit = minit+0.001*rand(size(minit));

% /Users/vipulsinghal/Dropbox/Documents/toolbox/txtlsim_vsfork2017/mcmc_simbio/projects/proj_acs_dsg2014.m

mcmc_runsim_4(tstamp, projdir, tv,da, emo, mi,'userinitialize', minit);% 'distribution', 'gaussian', 'width', 0.1
%%
tstamp_to_use = '20180117_104338'
simdatapath = [pwd '/mcmc_simbio/projects/proj_acs_dsg2014/simdata_' tstamp_to_use '/' ] % 'mcmc' tstamp '_ID' finalsimID '.mat'
%% load the estimated parameter points. 
load([simdatapath 'mcmc' tstamp '_ID' num2str(1)], 'm');
mcat = m;
for i = 2:12
    load(['mcmc' tstamp '_ID' num2str(i)], 'm');
    mcat = cat(3, mcat, m);
end

mstacked = mcat(:,:)';

legendz = mi.names_ord;
plotChains(mcat(:,1:10:end, 1:4:end), mi.nW, legendz);

figure
ecornerplot_vse(mstacked(1:50:end,:),'scatter', true,...
    'transparency',0.1,...
    'color',[.6 .35 .3], 'names', legendz);
% figure
% ecornerplot_vse(mstacked(1:10:end,:),...
%     'ess', 80,...
%     'color',[.6 .35 .3],...
%     'names', legendz);
%%




dosingStrat = struct('species', mi.dosednames,...
    'concentrations', {mi.dosedvals});
%%
addpath(genpath(...
    ['/Users/vipulsinghal/Dropbox/Documents/toolbox/txtlsim_vsfork2017/'...
    'mcmc_simbio/projects/']));

load([simdatapath 'full_variable_set_' tstamp_to_use]);
%%
fig = plotEstimTraces_ver201801(mcat,em,tv, da,...
   dosingStrat , mi.measuredspecies, 'Visible','on');



% %%
% load mcmc20171128_130412_ID10
% % whos
% logp = [ones(14,1); 2;5;5];
% 
% figure
% [res, residuals, scaledsimdata, scaleddata] =...
%     gen_residuals_3_debug(mstacked(1, :)', em, da, tv, ...
%     mi.dosedvals, mi.measuredspecies);
% ccol = 2;
% rrow = 4;
% %         for ccol = 1:2
% %             for rrow = 1:4
% %                 subplot(4, 2, (rrow-1)*2+ccol)
% ssd = scaledsimdata(:,ccol, rrow);
% plot(tv, ssd, 'b');
% hold on
% sdd = scaleddata(:,ccol, rrow);
% plot(tv, sdd, ':b');
% hold on
% rs = residuals(:,ccol, rrow);
% plot(tv, rs, 'k');
% %             end
% %         end
% 
% linkdata on
% mm = mstacked(1:100:2000, :);
% for p = 2:size(mm, 1)
%     
%     [res, residuals, scaledsimdata, scaleddata] = gen_residuals_3_debug(mm(p, :)', em, da, tv, ...
%         mi.dosedvals, mi.measuredspecies);
%     ssd = scaledsimdata(:,ccol, rrow);
%     sdd = scaleddata(:,ccol, rrow);
%     rs = residuals(:,ccol, rrow);
%     tv = tv;
%     pause(0.01)
%     %         for ccol = 1:2
%     %             for rrow = 1:4
%     %                 subplot(4, 2, (rrow-1)*2+ccol)
%     %                 plot(tv, scaledsimdata(:,ccol, rrow), 'b');
%     %                 hold on
%     %                 plot(tv, scaleddata(:,ccol, rrow), ':b');
%     %                 hold on
%     %                 plot(tv, residuals(:,ccol, rrow), 'k');
%     %             end
%     %         end
%     
% end
% %%
% close all
% mm = mstacked(1:100:4000, :);
% figure
% [res, residuals, scaledsimdata, scaleddata] = gen_residuals_3_debug(mm(1, :)', em, da, tv, ...
%     mi.dosedvals, mi.measuredspecies);
% ccol = 2;
% rrow = 4;
% 
% ssd = scaledsimdata(:,ccol, rrow);
% plot1 = plot(tv, ssd, 'b');
% hold on
% sdd = scaleddata(:,ccol, rrow);
% plot2 = plot(tv, sdd, ':b');
% hold on
% rs = residuals(:,ccol, rrow);
% plot3 = plot(tv, rs, 'k');
% 
% set(plot1, 'XDataSource', 'tv')
% set(plot2, 'XDataSource', 'tv')
% set(plot3, 'XDataSource', 'tv')
% 
% set(plot1, 'YDataSource', 'ssd')
% set(plot2, 'YDataSource', 'sdd')
% set(plot3, 'YDataSource', 'rs')
% 
% for p = 2:size(mm, 1)
%     p
%     [res, residuals, scaledsimdata, scaleddata] = gen_residuals_3_debug(mm(p, :)', em, da, tv, ...
%         mi.dosedvals, mi.measuredspecies);
%     ssd = scaledsimdata(:,ccol, rrow);
%     sdd = scaleddata(:,ccol, rrow);
%     rs = residuals(:,ccol, rrow);
%     tv = tv;
%     refreshdata
%     drawnow
%     pause(0.01)
%     
% end
% %% set up the MCMC estimation
% % mcmc_results is a mcmc_results class object.
% % mcmc_runsim(tstamp, projdir, tv,da, emo, mi);
% 
% %%




