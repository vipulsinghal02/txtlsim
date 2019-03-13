


% Set working directory to the txtlsim toolbox directory.
projdir = [pwd '/mcmc_simbio/projects/proj_vnprl'];
addpath(projdir)

jpgsave = true;
figsave = false;

% Load model, mcmc_info, and data_info.
mobj = model_dsg2014_regen;
mcmc_info = mcmc_info_vnprl_F2(mobj);
di = data_VNPRL2011;

mi = mcmc_info.model_info;
ri = mcmc_info.runsim_info;
mai = mcmc_info.master_info;

% plot data from existing simulations.
tsIDtouse = 3;
plotflag = true;
switch tsIDtouse
    case 1
        ts1 = '20190217_154138_1_71';
        ts2 = '20190217_154138_2_48';
        ts3 = '20190217_154138_3_24';
        ts4 = '20190217_154138_4_12';
        tstamp = {ts1 ts2 ts3 ts4};
        nIterID = {1:2 1:2 1:2 1:2};
        load([projdir '/simdata_' ts1 '/full_variable_set_' ts1 '.mat'], ...
            'mi',...
            'mcmc_info', 'data_info', 'mai', 'ri');
    case 2
        ts1 = '20190217_160345_1_48';
        tstamp = {ts1};
        nIterID = {1:9};
        load([projdir '/simdata_' ts1 '/full_variable_set_' ts1 '.mat'], ...
            'mi',...
            'mcmc_info', 'data_info', 'mai', 'ri');   
    case 3
        ts1 = '20190218_135635_1_24';
        ts2 = '20190218_135635_2_12';
        ts3 = '20190219_093714_1_7';
        ts4 = '20190219_093714_2_2';
        ts5 = '20190220_022918_1_2';
        ts6 = '20190220_102006_1_2';
        ts7 = '20190221_074748_1_2';
        ts8 = '20190223_024333_1_2';
        tstamp = {ts1 ts2 ts3 ts4 ts5 ts6 ts7 ts8};
        nIterID = {1:25 1:25 1:20 1:20 1:16 1:31 1:80 1:20};
        load([projdir '/simdata_' ts8 '/full_variable_set_' ts8 '.mat'], ...
            'mi',...
            'mcmc_info', 'data_info', 'mai', 'ri');  
end
tsToSave = ts8;
mai.masterVector


marray_full = mcmc_get_walkers(tstamp,nIterID, projdir);
marray = marray_full(:,:,1:end);
clear marray_full
parnames = ...
    [{'TX_{cat}'    }
    {'\tau_{atp}'   }
    {'\delta_{atp}' }
    {'pol_{Kd}'     }
    {'pol_{term}'   }
    {'RNAse_{Kd}'   }
    {'RNAse_{cat}'  }
    {'pol'          }
    {'RNase'        }
    {'TL_{cat}'     }
    {'Ribo_{Kd}'    }
    {'Ribo_{term}'  }
    {'Ribo'         }];
% 
%     {'TX_elong_glob'                  }
%     {'AGTPdeg_time'                   }
%     {'AGTPdeg_rate'                   }
%     {'TXTL_P70_RNAPbound_Kd'          }
%     {'TXTL_RNAPBOUND_TERMINATION_RATE'}
%     {'TXTL_RNAdeg_Kd'                 }
%     {'TXTL_RNAdeg_kc'                 }
%     {'RNAP'                           }
%     {'RNase'                          }
%     {'TL_elong_glob'                  }
%     {'TXTL_UTR_UTR1_Kd'               }
%     {'TXTL_RIBOBOUND_TERMINATION_RATE'}
%     {'Ribo'                           }
%

if plotflag
    close all
    % Plot trace and corner (posterior distribution) plots
%     mcmc_plot(marray(:, 1:3:end,1:50:end), parnames(:));
%     mcmc_plot(marray(:, 1:end,8000:20:end), parnames(:),...
%     'savematlabfig', figsave, 'savejpeg', jpgsave,...
%     'projdir', projdir, 'tstamp', tsToSave, 'extrafignamestring', 'BurnedInAllWalkers');


    mcmc_plot(marray(:, 1:10:end,(end-18000):100:end), parnames(:),...
    'savematlabfig', figsave, 'savejpeg', jpgsave,...
    'projdir', projdir, 'tstamp', tsToSave, 'extrafignamestring', 'BurnedIn');
% 
pause(10)
close 
close

    mcmc_plot(marray(:, 1:10:end,1:100:end), parnames(:),...
    'savematlabfig', figsave, 'savejpeg', jpgsave,...
    'projdir', projdir, 'tstamp', tsToSave, 'extrafignamestring', 'WithTransient');
pause(10)
close 
close


%     figure
%     [C,lags,ESS]=eacorr(marray(:, :,1:end));%10000:end
%     plot(lags,C,'.-',lags([1 end]),[0 0],'k');
%     grid on
%     xlabel('lags')
%     ylabel('autocorrelation');
%     text(lags(end),0,sprintf('Effective Sample Size (ESS): %.0f_ ',...
%         ceil(mean(ESS))),'verticalalignment','bottom','horizontalalignment','right')
%     title('Markov Chain Auto Correlation')
%     
    
    mvarray = masterVecArray(marray, mai);
    clear marray
    samplePoints = ceil(size(mvarray, 3) * [.9, 1]);
    %
    marrayOrd = mvarray(mi(1).paramMaps(mi(1).orderingIx),:,samplePoints);
    titls = arrayfun(@num2str, mi(1).dosedVals, 'UniformOutput', false);
    titls_array = cell(length(titls), 2, length(mi(1).measuredSpeciesIndex));
    ms = {'RNA'};
    for i = 1:length(mi(1).measuredSpeciesIndex)
        for j = 1:length(titls)
            titls_array(j, 1, i) = {[ms{i} ', ' titls{j} 'nM initial RNA, Exp data']};
            titls_array(j, 2, i) = {[ms{i} ', ' titls{j} 'nM initial RNA, MCMC samples']};
        end
    end
    mcmc_trajectories(mi(1).emo, data_info(mi(1).dataToMapTo), mi(1), marrayOrd,...
        titls_array, {},...
        'SimMode', 'meanstd', 'separateExpSim', true,...
        'savematlabfig', figsave, 'savejpeg', jpgsave,...
        'projdir', projdir, 'tstamp', tsToSave,...
        'extrafignamestring', 'RNAspike');
    
    marrayOrd = mvarray(mi(2).paramMaps(mi(2).orderingIx),:,samplePoints);
    clear mvarray
    titls = arrayfun(@num2str, mi(2).dosedVals, 'UniformOutput', false);
    titls_array = cell(length(titls), 2, length(mi(2).measuredSpeciesIndex));
    ms = {'MG aptamer', 'deGFP'};
    for i = 1:length(mi(2).measuredSpeciesIndex)
        for j = 1:length(titls)
            titls_array(j, 1, i) = {[ms{i} ', ' titls{j} 'nM initial DNA, Exp data']};
            titls_array(j, 2, i) = {[ms{i} ', ' titls{j} 'nM initial DNA, MCMC samples']};
        end
    end
    mcmc_trajectories(mi(2).emo, data_info(mi(2).dataToMapTo), mi(2), marrayOrd,...
        titls_array, {},...
        'SimMode', 'meanstd', 'separateExpSim', true,...
        'savematlabfig', figsave, 'savejpeg', jpgsave,...
        'projdir', projdir, 'tstamp', tsToSave,...
        'extrafignamestring', 'MGa_deGFP');
end
marrayOrd(:,1:5,end)
clear marrayOrd
% flagz = ones(26, 1);
% flagz([1 5 7 8 10 12 15 16 17 19 21 23 25 26]) = 0;
% [mvarray(:,1:6,end) log(cell2mat(activeNames2(:, 2))) flagz]
