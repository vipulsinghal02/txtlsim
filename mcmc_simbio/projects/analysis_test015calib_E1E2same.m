
% In this file we try to find a set of parameter values that allow the
% model from model_dsg2014_regen to fit the data from data_dsg2014_full.
% Vipul Singhal, 2019

% simulate txtl model with custom parameter values, and look at the species
% plots as specified by mcmc_info object.
close all
clear all

% Set working directory to the txtlsim toolbox directory.
projdir = [pwd '/mcmc_simbio/projects/proj_test015_E1E2same'];

addpath(projdir)

jpgsave = true;
figsave = false;

% Load model, mcmc_info, and data_info.
mobj = model_protein3;
mcmc_info = mcmc_info_test015_E1E2same(mobj);
di = data_test015;

mi = mcmc_info.model_info;
ri = mcmc_info.runsim_info;
mai = mcmc_info.master_info;

% plot data from existing simulations.
tsIDtouse = 4;

plotflag = true;
switch tsIDtouse
    
        % these sims suggest that kcp2 should be -2.8 to -3 (==-3.001). pretty tight!
        % pol2 :  +2.6 to  +2.8. (== 2.655)
        
        % for ESP 1: 2 for kcp1. for pol 1: -0.2 to -0.4
       % the esps, can also try -3.6 to -3.9 (-3.66) for kcp1 and 
       % 3.3 (+-0.2) (==3.26) for the pol1. This second point is more compatible
       % with the ESP2 point I think. moving to the corr code now: 
       % analysis file for test015_corr1_Ffix3
        
       case 3.2
        
        ts1 = '20190320_050909_1_967';
        ts2 = '20190320_050909_2_322';
        ts3 = '20190320_050909_3_161';
        tstamp = {ts1 ts2 ts3};
        tsToSave = ts3;
        nIterID = {1:10 1:10 1:5};
        load([projdir '/simdata_' tsToSave '/full_variable_set_'...
            tsToSave '.mat'], ...
            'mi',...
            'mcmc_info', 'data_info', 'mai', 'ri');
         
       % 20190319_153606_1_10
       
    case 4
        
        ts1 = '20190320_082004_1_1453';
        ts2 = '20190320_082004_2_484';
        ts3 = '20190320_082004_3_242';
        tstamp = {ts1 ts2};
        tsToSave = ts3;
        nIterID = {1:5 1:5 1:4};
        load([projdir '/simdata_' tsToSave '/full_variable_set_'...
            tsToSave '.mat'], ...
            'mi',...
            'mcmc_info', 'data_info', 'mai', 'ri');
        
        
end

mai.masterVector


marray_full = mcmc_get_walkers(tstamp,nIterID, projdir);
marray = marray_full(:,:,1:end);
clear marray_full
parnames = ...
        {'kfdG'
    'krdG'
    'kcp1'
    'kcp2'
    'pol1'
    'pol2'};


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
%
%  close
% marray_red = marray(:, :,((end-2600):10:end));
% mstack = marray_red(:, :)';
% ixs = find(mstack(:, 4)>-2.89 & mstack(:, 4)<-2.85 &...
%     mstack(:, 6)>2.63 & mstack(:, 6)<2.65);
% mcmc_plot(mstack(ixs,:), parnames(:))
%

    mcmc_plot(marray(:, 1:end,1:20:end), parnames(:),... %uncomment this
    'savematlabfig', figsave, 'savejpeg', jpgsave,...
    'projdir', projdir, 'tstamp', tsToSave, 'extrafignamestring', 'all_WithTr');
    mcmc_plot(marray(:, 1:end,(end-1000):20:end), parnames(:),...
    'savematlabfig', figsave, 'savejpeg', jpgsave,...
    'projdir', projdir, 'tstamp', tsToSave, 'extrafignamestring', 'all_WithoutTr');

%
    mvarray = masterVecArray(marray, mai);
    samplePoints = ceil(size(mvarray, 3) * [.9, 1]);
    %
    marrayOrd = mvarray(mi(1).paramMaps(mi(1).orderingIx,1),:,samplePoints);
    titls = arrayfun(@num2str, mi(1).dosedVals, 'UniformOutput', false);
    titls_array = cell(length(titls), 2, length(mi(1).measuredSpeciesIndex));
    ms = {'RNA'};
    for i = 1:length(mi(1).measuredSpeciesIndex)
        for j = 1:length(titls)
            titls_array(j, 1, i) = {[ms{i} ', ' titls{j} 'nM initial RNA, Exp data']};
            titls_array(j, 2, i) = {[ms{i} ', ' titls{j} 'nM initial RNA, MCMC samples']};
        end
    end
    mcmc_trajectories(mi(1).emo, data_info(mi(1).dataToMapTo(1)), mi(1), marrayOrd,...
        titls_array, {},...
        'SimMode', 'meanstd', 'separateExpSim', false,...
        'savematlabfig', figsave, 'savejpeg', jpgsave,...
        'projdir', projdir, 'tstamp', tsToSave,...
        'extrafignamestring', 'E1');
    
    marrayOrd = mvarray(mi(1).paramMaps(mi(1).orderingIx,2),:,samplePoints);
    titls = arrayfun(@num2str, mi(1).dosedVals, 'UniformOutput', false);
    titls_array = cell(length(titls), 2, length(mi(1).measuredSpeciesIndex));
    ms = {'MG aptamer', 'deGFP'};
    for i = 1:length(mi(1).measuredSpeciesIndex)
        for j = 1:length(titls)
            titls_array(j, 1, i) = {[ms{i} ', ' titls{j} 'nM initial DNA, Exp data']};
            titls_array(j, 2, i) = {[ms{i} ', ' titls{j} 'nM initial DNA, MCMC samples']};
        end
    end
    mcmc_trajectories(mi(1).emo, data_info(mi(1).dataToMapTo(2)), mi(1), marrayOrd,...
        titls_array, {},...
        'SimMode', 'meanstd', 'separateExpSim', false,...
        'savematlabfig', figsave, 'savejpeg', jpgsave,...
        'projdir', projdir, 'tstamp', tsToSave,...
        'extrafignamestring', 'E2');
%%
end





