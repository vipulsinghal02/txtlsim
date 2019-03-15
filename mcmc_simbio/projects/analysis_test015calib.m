
% In this file we try to find a set of parameter values that allow the
% model from model_dsg2014_regen to fit the data from data_dsg2014_full.
% Vipul Singhal, 2019

% simulate txtl model with custom parameter values, and look at the species
% plots as specified by mcmc_info object.
close all

% Set working directory to the txtlsim toolbox directory.
projdir = [pwd '/mcmc_simbio/projects/proj_test015'];
addpath(projdir)

jpgsave = true;
figsave = false;

% Load model, mcmc_info, and data_info.
mobj = model_protein3;
mcmc_info = mcmc_info_test015(mobj);
di = data_test015;

mi = mcmc_info.model_info;
ri = mcmc_info.runsim_info;
mai = mcmc_info.master_info;

% plot data from existing simulations.
tsIDtouse = 2;

plotflag = true;
switch tsIDtouse
    case 1
        ts1 = '20190313_091216_1_0p32242';
        ts2 = '20190313_101830_1_0p32242';
        ts3 = '20190313_130351_1_0p32242';
        ts4='20190313_153908_1_0p32242';
        ts5 = '20190313_171758_1_0p064484';
        ts6 = '20190314_004559_1_0p12897';
        tstamp = {ts1 ts2 ts3 ts4 ts5 ts6};
        
        nIterID = {1:9 1:20 1:20 1:5 1:60 1:30};
        load([projdir '/simdata_' ts6 '/full_variable_set_' ts6 '.mat'], ...
            'mi',...
            'mcmc_info', 'data_info', 'mai', 'ri');
    case 2
        ts1 = '20190314_161518_1_322';
        ts2 = '20190314_161518_2_242';
        ts3 = '20190314_161518_3_161';
        ts4 = '20190314_161518_4_81';
        ts5 = '20190315_102139_1_242';
        ts6 = '20190315_102139_2_81';
        tstamp = {ts1 ts2 ts3 ts4 ts5 ts6};
        tsToSave = ts5;
        nIterID = {1:20 1:20 1:20 1:20 1:30 1:6};
        load([projdir '/simdata_' tsToSave '/full_variable_set_' tsToSave '.mat'], ...
            'mi',...
            'mcmc_info', 'data_info', 'mai', 'ri');
end

mai.masterVector


marray_full = mcmc_get_walkers(tstamp,nIterID, projdir);
marray = marray_full(:,:,1:end);
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


    mcmc_plot(marray(:, 1:10:end,1:100:end), parnames(:),...
    'savematlabfig', figsave, 'savejpeg', jpgsave,...
    'projdir', projdir, 'tstamp', tsToSave, 'extrafignamestring', 'all_WithTr');


    mcmc_plot(marray([1 2 3 5], 1:10:end,1:100:end), parnames([1 2 3 5]),...
    'savematlabfig', figsave, 'savejpeg', jpgsave,...
    'projdir', projdir, 'tstamp', tsToSave, 'extrafignamestring', 'WithTr_E1');
    mcmc_plot(marray([1 2 3 5], 1:end,(end-2000):100:end), parnames([1 2 3 5]),...
    'savematlabfig', figsave, 'savejpeg', jpgsave,...
    'projdir', projdir, 'tstamp', tsToSave, 'extrafignamestring', 'WithoutTr_E1');

%     mcmc_plot(marray([1 2 4 6], 1:10:end,1:100:end), parnames([1 2 4 6]),...
%     'savematlabfig', figsave, 'savejpeg', jpgsave,...
%     'projdir', projdir, 'tstamp', tsToSave, 'extrafignamestring', 'WithTr_E2');
%     mcmc_plot(marray([1 2 4 6], 1:end,(end-2000):100:end), parnames([1 2 4 6]),...
%     'savematlabfig', figsave, 'savejpeg', jpgsave,...
%     'projdir', projdir, 'tstamp', tsToSave, 'extrafignamestring', 'WithoutTr_E2');


%     figure
%     [C,lags,ESS]=eacorr(marray(:, :,8000:end));%10000:end
%     plot(lags,C,'.-',lags([1 end]),[0 0],'k');
%     grid on
%     xlabel('lags')
%     ylabel('autocorrelation');
%     text(lags(end),0,sprintf('Effective Sample Size (ESS): %.0f_ ',...
%         ceil(mean(ESS))),'verticalalignment','bottom','horizontalalignment','right')
%     title('Markov Chain Auto Correlation')
%     
%     %%
%     mvarray = masterVecArray(marray, mai);
%     samplePoints = ceil(size(mvarray, 3) * [.9, 1]);
%     %
%     marrayOrd = mvarray(mi(1).paramMaps(mi(1).orderingIx,1),:,samplePoints);
%     titls = arrayfun(@num2str, mi(1).dosedVals, 'UniformOutput', false);
%     titls_array = cell(length(titls), 2, length(mi(1).measuredSpeciesIndex));
%     ms = {'RNA'};
%     for i = 1:length(mi(1).measuredSpeciesIndex)
%         for j = 1:length(titls)
%             titls_array(j, 1, i) = {[ms{i} ', ' titls{j} 'nM initial RNA, Exp data']};
%             titls_array(j, 2, i) = {[ms{i} ', ' titls{j} 'nM initial RNA, MCMC samples']};
%         end
%     end
%     mcmc_trajectories(mi(1).emo, data_info(mi(1).dataToMapTo(1)), mi(1), marrayOrd,...
%         titls_array, {},...
%         'SimMode', 'meanstd', 'separateExpSim', false,...
%         'savematlabfig', figsave, 'savejpeg', jpgsave,...
%         'projdir', projdir, 'tstamp', tsToSave,...
%         'extrafignamestring', 'E1');
%     
%     marrayOrd = mvarray(mi(1).paramMaps(mi(1).orderingIx,2),:,samplePoints);
%     titls = arrayfun(@num2str, mi(1).dosedVals, 'UniformOutput', false);
%     titls_array = cell(length(titls), 2, length(mi(1).measuredSpeciesIndex));
%     ms = {'MG aptamer', 'deGFP'};
%     for i = 1:length(mi(1).measuredSpeciesIndex)
%         for j = 1:length(titls)
%             titls_array(j, 1, i) = {[ms{i} ', ' titls{j} 'nM initial DNA, Exp data']};
%             titls_array(j, 2, i) = {[ms{i} ', ' titls{j} 'nM initial DNA, MCMC samples']};
%         end
%     end
%     mcmc_trajectories(mi(1).emo, data_info(mi(1).dataToMapTo(2)), mi(1), marrayOrd,...
%         titls_array, {},...
%         'SimMode', 'meanstd', 'separateExpSim', false,...
%         'savematlabfig', figsave, 'savejpeg', jpgsave,...
%         'projdir', projdir, 'tstamp', tsToSave,...
%         'extrafignamestring', 'E2');
end


%% 
% get a random point from the estimated parameter sets
% [parnames, mat2cell(marray(:, [1:12:240],end), ones(6,1), ones(1,20))]
% 
% ans =
% 
%   6×21 cell array
% 
%   Columns 1 through 14
% 
%     {'kfdG'}    {[ -2.0574]}    {[-4.6507]}    {[-3.9888]}    {[ 1.1461]}    {[ -4.5084]}    {[ -3.6959]}    {[-0.1910]}    {[-3.9767]}    {[ -3.3438]}    {[-2.8501]}    {[-0.9583]}    {[ 1.1404]}    {[-10.2457]}
%     {'krdG'}    {[-12.3652]}    {[-1.6276]}    {[-9.9750]}    {[-2.4359]}    {[-12.2308]}    {[-10.5998]}    {[-9.9598]}    {[-7.3686]}    {[-11.6602]}    {[ 1.4934]}    {[ 1.2494]}    {[-7.1829]}    {[-10.6801]}
%     {'kcp1'}    {[  3.6547]}    {[-3.3864]}    {[ 1.6081]}    {[ 5.6473]}    {[  3.0718]}    {[ -3.7681]}    {[ 5.8442]}    {[ 6.7586]}    {[  8.2938]}    {[-1.7960]}    {[-3.5343]}    {[-3.7404]}    {[  3.4331]}
%     {'kcp2'}    {[  1.1577]}    {[ 6.1950]}    {[-2.8704]}    {[-3.1807]}    {[ -1.9671]}    {[ -0.5470]}    {[ 3.1399]}    {[-2.8587]}    {[ -3.0283]}    {[ 6.7610]}    {[ 1.6672]}    {[ 4.4217]}    {[  3.5146]}
%     {'pol1'}    {[ -1.6481]}    {[ 4.2446]}    {[ 0.2897]}    {[-4.7253]}    {[  0.7588]}    {[  8.6459]}    {[-3.5217]}    {[ 0.2230]}    {[ -0.4036]}    {[ 2.7609]}    {[ 3.9028]}    {[ 6.0991]}    {[  6.4998]}
%     {'pol2'}    {[ -0.8519]}    {[ 1.2191]}    {[ 2.6442]}    {[ 2.6753]}    {[  2.0417]}    {[  0.8476]}    {[-2.7737]}    {[ 2.6192]}    {[  2.6895]}    {[-0.5681]}    {[-1.4208]}    {[-4.0794]}    {[  6.8263]}
% 
%   Columns 15 through 21
% 
%     {[-3.1836]}    {[-1.0828]}    {[-3.5680]}    {[-4.5238]}    {[ -3.5820]}    {[  9.8297]}    {[  9.1477]}
%     {[-4.5015]}    {[-4.8491]}    {[-4.1115]}    {[-3.8101]}    {[-13.2259]}    {[-12.1666]}    {[ -9.7015]}
%     {[ 4.3357]}    {[ 4.0316]}    {[ 4.3941]}    {[ 1.4003]}    {[  2.6556]}    {[  0.4588]}    {[-11.3254]}
%     {[-3.0056]}    {[ 2.2533]}    {[-2.9253]}    {[-2.2433]}    {[ -3.0114]}    {[  2.4327]}    {[  5.3693]}
%     {[-0.5535]}    {[-2.5742]}    {[-0.1758]}    {[ 0.8345]}    {[ -0.1398]}    {[-13.4085]}    {[  9.8451]}
%     {[ 2.6449]}    {[-1.8759]}    {[ 2.6335]}    {[ 2.3418]}    {[  2.6971]}    {[-10.3830]}    {[  9.4620]}

%%
% [parnames, mat2cell(marray(:, [25],end), ones(6,1), ones(1,1))]
% 
% ans =
% 
%   6×2 cell array
% 
%     {'kfdG'}    {[-3.9888]}
%     {'krdG'}    {[-9.9750]}
%     {'kcp1'}    {[ 1.6081]}
%     {'kcp2'}    {[-2.8704]}
%     {'pol1'}    {[ 0.2897]}
%     {'pol2'}    {[ 2.6442]}

% the esps we will use are: 
%     {'kcp2'}    {[-2.8704]}
%     {'pol2'}    {[ 2.6442]}

% and the CSPfixed esps for that are: 
%     {'kcp1'}    {[ 1.6081]}
%     {'pol1'}    {[ 0.2897]}






%%
%%
%%










