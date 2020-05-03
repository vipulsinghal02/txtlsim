
% In this file we try to find a set of parameter values that allow the
% model from model_dsg2014_regen to fit the data from data_dsg2014_full.
% Vipul Singhal, 2019

% simulate txtl model with custom parameter values, and look at the species
% plots as specified by mcmc_info object.
close all

% Set working directory to the txtlsim toolbox directory.
projdir = [pwd '/mcmc_simbio/projects/proj_test015_corr1'];
addpath(projdir)

jpgsave = true;
figsave = false;

% Load model, mcmc_info, and data_info.
mobj = model_tetR_repression1;
mcmc_info = mcmc_info_test015_corr1(mobj, exp(-7.6), exp(1.0212));
di = data_test015;

mi = mcmc_info.model_info;
ri = mcmc_info.runsim_info;
mai = mcmc_info.master_info;

% plot data from existing simulations.
tsIDtouse = 1;
plotflag = true;
switch tsIDtouse
    case 1
        ts1 = '20190314_050144_1_0p20762';
        ts2 = '20190314_072843_1_0p083047';
        tstamp = {ts1 ts2};
        tsToSave = ts2;
        nIterID = {1:20 1:3};
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
    'kfdimTet'
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
    %     mcmc_plot(marray(:, 1:3:end,1:50:end), parnames(:));
    
    mcmc_plot(marray(:, 1:end,1:50:end), parnames(:),...
        'savematlabfig', figsave, 'savejpeg', jpgsave,...
        'projdir', projdir, 'tstamp', tsToSave, 'extrafignamestring', 'WithTr_E2');
    %     mcmc_plot(marray(:, 1:end,(end-400):10:end), parnames(:),...
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
    %
    mvarray = masterVecArray(marray, mai);
    samplePoints = ceil(size(mvarray, 3) * [.9, 1]);
    %
    marrayOrd = mvarray(mi(1).paramMaps(mi(1).orderingIx,1),:,samplePoints);
    titls = arrayfun(@num2str, mi(1).dosedVals, 'UniformOutput', false);
    titls_array = cell(length(titls), 2, length(mi(1).measuredSpeciesIndex));
    ms = {'GFP'};
    for i = 1:length(mi(1).measuredSpeciesIndex)
        for j = 1:length(titls)
            titls_array(j, 1, i) = {[ms{i} ', ' titls{j} 'nM initial tetR DNA, Exp data']};
            titls_array(j, 2, i) = {[ms{i} ', ' titls{j} 'nM initial tetR DNA, MCMC samples']};
        end
    end
    mcmc_trajectories(mi(1).emo, data_info(mi(1).dataToMapTo(1)), mi(1), marrayOrd,...
        titls_array, {},...
        'SimMode', 'meanstd', 'separateExpSim', false,...
        'savematlabfig', figsave, 'savejpeg', jpgsave,...
        'projdir', projdir, 'tstamp', tsToSave,...
        'extrafignamestring', 'E2');
end


%%
% get a random point from the estimated parameter sets
% [parnames, mat2cell(marray(:, [1:12:240],end), ones(6,1), ones(1,20))]
%
% ans =
%
%   6×21 cell array
%
%   Columns 1 through 11
%
%     {'kfdG'}    {[-9.9230]}    {[-10.0279]}    {[-10.0490]}    {[  0.9135]}    {[-9.8466]}    {[  2.5695]}    {[-12.3827]}    {[-9.6395]}    {[-9.5673]}    {[ -9.9738]}
%     {'krdG'}    {[-7.8902]}    {[ -8.0737]}    {[-14.2225]}    {[  4.1679]}    {[-8.7788]}    {[  5.7239]}    {[ -6.6774]}    {[-7.5997]}    {[-7.5270]}    {[-10.8543]}
%     {'kcp1'}    {[-5.8553]}    {[ -5.9863]}    {[ -5.7237]}    {[  5.9874]}    {[-5.2996]}    {[-10.1357]}    {[ -7.3498]}    {[ 6.4347]}    {[ 5.1633]}    {[-10.4953]}
%     {'kcp2'}    {[-8.2237]}    {[ -8.0306]}    {[ -7.3076]}    {[ -5.8253]}    {[-7.1465]}    {[ -6.3534]}    {[  0.5973]}    {[-8.8182]}    {[-8.5993]}    {[ -7.0679]}
%     {'pol1'}    {[-0.3304]}    {[ -0.2121]}    {[ -0.3397]}    {[-11.3549]}    {[-0.5816]}    {[  3.7748]}    {[  3.0265]}    {[-1.0331]}    {[-1.0991]}    {[  3.8026]}
%     {'pol2'}    {[ 1.5239]}    {[  1.3512]}    {[  0.6652]}    {[ -0.7377]}    {[ 0.5284]}    {[ -0.2976]}    {[  2.0457]}    {[ 2.0093]}    {[ 1.7829]}    {[  0.4793]}
%
%   Columns 12 through 21
%
%     {[ 2.5067]}    {[-10.3252]}    {[-3.4820]}    {[ -9.9379]}    {[-12.1544]}    {[-10.1121]}    {[-10.0937]}    {[-9.9760]}    {[-10.0684]}    {[  4.1603]}
%     {[ 5.8421]}    {[ -4.5220]}    {[ 1.8388]}    {[ -7.8741]}    {[ -7.9822]}    {[ -8.2681]}    {[-12.5256]}    {[-8.3245]}    {[ -9.4601]}    {[  7.3636]}
%     {[-9.9686]}    {[  5.9437]}    {[-0.9758]}    {[-10.2922]}    {[ -6.5860]}    {[ -6.3789]}    {[ -5.6945]}    {[-5.4273]}    {[  4.5807]}    {[  9.1865]}
%     {[-4.7680]}    {[  9.5168]}    {[ 8.4722]}    {[ -7.6000]}    {[  9.3837]}    {[ -8.0744]}    {[ -7.1395]}    {[-7.6876]}    {[ -7.6084]}    {[  1.3875]}
%     {[ 3.5909]}    {[ -0.3403]}    {[-4.2267]}    {[  3.7324]}    {[  1.9430]}    {[ -0.0146]}    {[ -0.3272]}    {[-0.4369]}    {[ -0.5857]}    {[-14.5707]}
%     {[-1.7568]}    {[ -0.0170]}    {[-6.8525]}    {[  1.0212]}    {[  1.8255]}    {[  1.4176]}    {[  0.5867]}    {[ 1.0151]}    {[  0.9188]}    {[ -8.0192]}


% [parnames, mat2cell(marray(:, [157],end), ones(6,1), ones(1,1))]

% ans =
%
%   6×2 cell array
%
%     {'kfdG'}    {[ -9.9379]}
%     {'krdG'}    {[ -7.8741]}
%     {'kcp1'}    {[-10.2922]}
%     {'kcp2'}    {[ -7.6000]}
%     {'pol1'}    {[  3.7324]}
%     {'pol2'}    {[  1.0212]}

% the esps we used are:
%     {'kcp2'}    {[ -7.6000]}
%     {'pol2'}    {[  1.0212]}

% and the CSPfixed esps for that are:
%     {'kcp1'}    {[-10.2922]}
%     {'pol1'}    {[  3.7324]}

% The ESPs when the CSPs are not fixed are:
% we can try are:
% [  5.9874]
% [-11.3549]
%
% or
%
% [  5.9437]
% [ -0.3403]
%
% or
%
% [-0.9758]
% [-4.2267]
%
% or
%
% [  9.1865]
% [-14.5707]
%%
%%
%% Now we perform correction step 2 without CSP fixing, and then with.

figure
% The ESPs we use are
kcp1 = exp(  5.9874);
pol1 = exp(-11.3549);

espvec = [ 5.9874; -11.3549]

% next we simulate the results with the estimated test CSP params and
% the non CSP fixing ESPs above.

% create a master info

szm = size(marray);
mvarray_corr21 = repmat(mai.masterVector, [1, szm(2:end)]) ;
eparray = repmat(espvec, [1, szm(2:end)]) ;
estParamsIx = setdiff((1:length(mai.masterVector))', mai.fixedParams);
mvarray_corr21(estParamsIx, :, :) = marray;
mvarray_corr21(mai.fixedParams, :, :) = eparray;

samplePoints = ceil(size(mvarray_corr21, 3) * [.9, 1]);
%
marrayOrd = mvarray_corr21(mi(1).paramMaps(mi(1).orderingIx,1),:,samplePoints);
titls = arrayfun(@num2str, mi(1).dosedVals, 'UniformOutput', false);
titls_array = cell(length(titls), 2, length(mi(1).measuredSpeciesIndex));
ms = {'GFP'};
for i = 1:length(mi(1).measuredSpeciesIndex)
    for j = 1:length(titls)
        titls_array(j, 1, i) = {[ms{i} ', ' titls{1,j} 'nM initial tetR DNA, Exp data']};
        titls_array(j, 2, i) = {[ms{i} ', ' titls{1,j} 'nM initial tetR DNA, MCMC samples']};
    end
end
mcmc_trajectories(mi(1).emo, data_info(mi(1).dataToMapTo(1)), mi(1), marrayOrd,...
    titls_array, {},...
    'SimMode', 'meanstd', 'separateExpSim', false,...
    'savematlabfig', figsave, 'savejpeg', jpgsave,...
    'projdir', projdir, 'tstamp', tsToSave,...
    'extrafignamestring', 'E2');

% and plot these.


% and finally with the CSP fixing ESPs













