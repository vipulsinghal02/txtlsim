
% In this file we try to find a set of parameter values that allow the
% model from model_dsg2014_regen to fit the data from data_dsg2014_full.
% Vipul Singhal, 2019

% simulate txtl model with custom parameter values, and look at the species
% plots as specified by mcmc_info object.
close all

% Set working directory to the txtlsim toolbox directory.
projdir = [pwd '/mcmc_simbio/projects/proj_test015_corr1_Ffix'];
addpath(projdir)

jpgsave = false;
figsave = false;

% Load model, mcmc_info, and data_info.
mobj = model_tetR_repression1;
mcmc_info = mcmc_info_test015_corr1_Ffix(mobj, exp(-2.8704), exp(2.6442));


%     {'kcp2'}    {[-2.8704]}
%     {'pol2'}    {[ 2.6442]}


di = data_test015;

mi = mcmc_info.model_info;
ri = mcmc_info.runsim_info;
mai = mcmc_info.master_info;

% plot data from existing simulations.
tsIDtouse = 2;
plotflag = true;
switch tsIDtouse
    case 1
        ts1 = '20190314_123130_1_0p20762';
        ts2 = '20190314_123130_2_0p10381';
        tstamp = {ts1 ts2};
        tsToSave = ts2;
        nIterID = {1:10 1:3};
        load([projdir '/simdata_' tsToSave '/full_variable_set_' tsToSave '.mat'], ...
            'mi',...
            'mcmc_info', 'data_info', 'mai', 'ri');
        
    case 2
        ts1 = '20190315_031445_1_104';
        ts2 = '20190315_040723_1_104'
        tstamp = {ts1 ts2};
        tsToSave = ts2;
        nIterID = {1:6 1:12};
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
    'kfdT'
    'krdT'
    'krdimTet'
    'kfseqTet'
    'krseqTet'};


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
    %
    
    % elements of marray:
    %     {'kfdG'
    %     'krdG'
    %     'kfdT'
    %     'krdT'
    %     'krdimTet'
    %     'kfseqTet'
    %     'krseqTet'};
    % want to restrict the kfdg and krdg by the values that would be the bounds
    % when the ESP2 values are fixed.
    % ie,
    
%     
%     
%     mcmc_plot(marray(:, 1:end,(end-3000):50:end), parnames(:),...
%         'savematlabfig', figsave, 'savejpeg', jpgsave,...
%         'projdir', projdir, 'tstamp', tsToSave, 'extrafignamestring', 'WithoutTr_E2');
%     mcmc_plot(marray(:, 1:10:end,1:10:end), parnames(:),...
%         'savematlabfig', figsave, 'savejpeg', jpgsave,...
%         'projdir', projdir, 'tstamp', tsToSave, 'extrafignamestring', 'WithTr_E2');
%     
    
    
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
    %
    %%
%     mvarray = masterVecArray(marray, mai);
%     samplePoints = ceil(size(mvarray, 3) * [.9, 1]);
%     %
%     marrayOrd = mvarray(mi(1).paramMaps(mi(1).orderingIx,1),:,samplePoints);
%     titls = arrayfun(@num2str, mi(1).dosedVals, 'UniformOutput', false);
%     titls_array = cell(length(titls), 2, length(mi(1).measuredSpeciesIndex));
%     ms = {'GFP'};
%     for i = 1:length(mi(1).measuredSpeciesIndex)
%         for j = 1:length(titls)
%             titls_array(j, 1, i) = {[ms{i} ', ' titls{1,j} 'nM initial tetR DNA, Exp data']};
%             titls_array(j, 2, i) = {[ms{i} ', ' titls{1,j} 'nM initial tetR DNA, MCMC samples']};
%         end
%     end
%     mcmc_trajectories(mi(1).emo, data_info(mi(1).dataToMapTo(1)), mi(1), marrayOrd,...
%         titls_array, {},...
%         'SimMode', 'meanstd', 'separateExpSim', false,...
%         'savematlabfig', figsave, 'savejpeg', jpgsave,...
%         'projdir', projdir, 'tstamp', tsToSave,...
%         'extrafignamestring', 'E2');
end

% mi.namesOrd
%
% ans =
%
%   10×1 cell array
%
%     {'kfdT'    }
%     {'krdT'    }
%     {'kcp'     }
%     {'kfdG'    }
%     {'krdG'    }
%     {'kfdimTet'}
%     {'krdimTet'}
%     {'kfseqTet'}
%     {'krseqTet'}
%     {'pol'     }

%%
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

% The ESPs when the CSPs are not fixed are:
% we can try are:

% [-3.7404]
% [ 6.0991]
%
%
% [  3.4331]
% [  6.4998]
%
% [  0.4588]
% [-13.4085]
%
% [-11.3254]
% [  9.8451]
%%
%%
%% Now we perform correction step 2 without CSP fixing, and then with.

% figure
% % The ESPs we use are
% kcp1 =   -3.7404;
% pol1 =3.0991;
% %
%  espvec = [ kcp1; pol1];
%  fixparamvec = [log(2); espvec];
% %
% % % next we simulate the results with the estimated test CSP params and
% % % the non CSP fixing ESPs above.
% %
% % % create a master info
% %
% szm = size(marray);
% mvarray_corr21 = repmat(mai.masterVector, [1, szm(2:end)]) ;
% fixarray = repmat(fixparamvec, [1, szm(2:end)]) ;
% estParamsIx = setdiff((1:length(mai.masterVector))', mai.fixedParams);
% mvarray_corr21(estParamsIx, :, :) = marray;
% mvarray_corr21(mai.fixedParams, :, :) = fixarray;
%
% samplePoints = ceil(size(mvarray_corr21, 3) * [.9, 1]);
% %
% marrayOrd = mvarray_corr21(mi(1).paramMaps(mi(1).orderingIx,1),:,samplePoints);
% titls = arrayfun(@num2str, mi(1).dosedVals, 'UniformOutput', false);
% titls_array = cell(length(titls), 2, length(mi(1).measuredSpeciesIndex));
% ms = {'GFP'};
% for i = 1:length(mi(1).measuredSpeciesIndex)
%     for j = 1:length(titls)
%         titls_array(j, 1, i) = {[ms{i} ', ' titls{1,j} 'nM initial tetR DNA, Exp data']};
%         titls_array(j, 2, i) = {[ms{i} ', ' titls{1,j} 'nM initial tetR DNA, MCMC samples']};
%     end
% end
% mcmc_trajectories(mi(1).emo, data_info(4), mi(1), marrayOrd,...
%     titls_array, {},...
%     'SimMode', 'meanstd', 'separateExpSim', false,...
%     'savematlabfig', figsave, 'savejpeg', jpgsave,...
%     'projdir', projdir, 'tstamp', tsToSave,...
%     'extrafignamestring', 'E2');

% and plot these.

%%
% and finally with the CSP fixing ESPs

% figure
% % The ESPs we use are
% kcp1 =   1.6081;
% pol1 = 0.2897;
% %
%  espvec = [ kcp1; pol1];
%  fixparamvec = [log(2); espvec];
% %
% % % next we simulate the results with the estimated test CSP params and
% % % the non CSP fixing ESPs above.
% %
% % % create a master info
% %
% szm = size(marray);
% mvarray_corr21 = repmat(mai.masterVector, [1, szm(2:end)]) ;
% fixarray = repmat(fixparamvec, [1, szm(2:end)]) ;
% estParamsIx = setdiff((1:length(mai.masterVector))', mai.fixedParams);
% mvarray_corr21(estParamsIx, :, :) = marray;
% mvarray_corr21(mai.fixedParams, :, :) = fixarray;
%
% samplePoints = ceil(size(mvarray_corr21, 3) * [.9, 1]);
% %
% marrayOrd = mvarray_corr21(mi(1).paramMaps(mi(1).orderingIx,1),:,samplePoints);
% titls = arrayfun(@num2str, mi(1).dosedVals, 'UniformOutput', false);
% titls_array = cell(length(titls), 2, length(mi(1).measuredSpeciesIndex));
% ms = {'GFP'};
% for i = 1:length(mi(1).measuredSpeciesIndex)
%     for j = 1:length(titls)
%         titls_array(j, 1, i) = {[ms{i} ', ' titls{1,j} 'nM initial tetR DNA, Exp data']};
%         titls_array(j, 2, i) = {[ms{i} ', ' titls{1,j} 'nM initial tetR DNA, MCMC samples']};
%     end
% end
% mcmc_trajectories(mi(1).emo, data_info(4), mi(1), marrayOrd,...
%     titls_array, {},...
%     'SimMode', 'meanstd', 'separateExpSim', false,...
%     'savematlabfig', figsave, 'savejpeg', jpgsave,...
%     'projdir', projdir, 'tstamp', tsToSave,...
%     'extrafignamestring', 'E2');
%
%
%



%%
%%
%%
%%
%%
%%
%%
% lets try to restrict the test csps to the kfdg and krdg that are
% compatible with the esp1 and esp2.

% Step 1 : grab C_test 10 points that satisfy both the ESP2 set restricton and the
% CSP-of-calib restrictions.
close all
load('ESP2 points', 'ESP2_tilda')

% now for 20 points in ESP2_tilda, get the CSP and ESP1, and for those
% CSPs, get the corresponding subset of test csps.
%
% then generate 20 plots of the trajectories from these 20 points. And see
% which fit the data.



ixs_calib = find(ESP2_tilda(:, 4)>-2.875 & ESP2_tilda(:, 4)<-2.865 &...
    ESP2_tilda(:, 6)>2.64 & ESP2_tilda(:, 6)<2.65);

ESP2_tilda2 = ESP2_tilda(ixs_calib,:);
ix_to_use = randperm(length(ESP2_tilda2), 20);


% test params:
marray_thin = marray(:, :,1:200:end);
mstacked = marray_thin(:,:)';
epsilon = .10;
ixs = cell(length(ix_to_use),1);
estParamsIx = setdiff((1:length(mai.masterVector))', mai.fixedParams);
for i = 1:length(ix_to_use)
    curr_calib = ESP2_tilda(ix_to_use(i), :);
    % find the elements of mstacked that are within the set
    kf_range = [curr_calib(1)-epsilon curr_calib(1)+epsilon];
    kr_range = [curr_calib(2)-epsilon curr_calib(2)+epsilon];
    ixs{i} = find(mstacked(:, 1)>kf_range(1) & mstacked(:, 1)<kf_range(2) &...
        mstacked(:, 2)>kr_range(1) & mstacked(:, 2)<kr_range(2));
    
%     The corresponding ESP1s are: 
    kcp1 = curr_calib(3);
    pol1 = curr_calib(5);
    ESP1_ix = [9 10];
    ESP1_vals = [kcp1, pol1];
    


    
    
    if ~isempty(ixs{i})
%         figure(i)
        mvarray = repmat(mai.masterVector', [length(ixs{i}), 1]) ;
        mvarray(:, estParamsIx) = mstacked(ixs{i}, :);
        mvarray(:, ESP1_ix) = repmat(ESP1_vals, [length(ixs{i}), 1]);
        marrayOrd = mvarray(:,mi(1).paramMaps(mi(1).orderingIx,1));
        
        titls = arrayfun(@num2str, mi(1).dosedVals, 'UniformOutput', false);
        titls_array = cell(length(titls), 2, length(mi(1).measuredSpeciesIndex));
        ms = {'GFP'};
        for k = 1:length(mi(1).measuredSpeciesIndex)
            for j = 1:length(titls)
                titls_array(j, 1, k) = {[ms{k} ', ' titls{1,j} 'nM initial tetR DNA, Exp data']};
                titls_array(j, 2, k) = {[ms{k} ', ' titls{1,j} 'nM initial tetR DNA, MCMC samples']};
            end
        end
        mcmc_trajectories(mi(1).emo, data_info(mi(1).dataToMapTo(1)), mi(1), marrayOrd,...
            titls_array, {},...
            'SimMode', 'meanstd', 'separateExpSim', false,...
            'savematlabfig', figsave, 'savejpeg', jpgsave,...
            'projdir', projdir, 'tstamp', tsToSave,...
            'extrafignamestring', 'test');
        
        
        
    end
    
    
    
    
    
    %
    
    
    
    
    
    
    
end

ixs


