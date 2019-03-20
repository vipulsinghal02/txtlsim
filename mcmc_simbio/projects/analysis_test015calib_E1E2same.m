
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
tsIDtouse = 3.2;

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

    mcmc_plot(marray(:, 1:end,1:100:end), parnames(:),... %uncomment this
    'savematlabfig', figsave, 'savejpeg', jpgsave,...
    'projdir', projdir, 'tstamp', tsToSave, 'extrafignamestring', 'all_WithTr');
    mcmc_plot(marray(:, 1:10:end,1:10:end), parnames(:),...
    'savematlabfig', figsave, 'savejpeg', jpgsave,...
    'projdir', projdir, 'tstamp', tsToSave, 'extrafignamestring', 'all_WithoutTr');
% mcmc_plot(marray(:, 1:20:end,(end-24000):500:end), parnames(:),...
%     'savematlabfig', figsave, 'savejpeg', jpgsave,...
%     'projdir', projdir, 'tstamp', tsToSave, 'extrafignamestring', 'all_WithoutTr');
% 
% mcmc_plot(marray(:, 1:20:end,1:100:end), parnames(:),...
%     'savematlabfig', figsave, 'savejpeg', jpgsave,...
%     'projdir', projdir, 'tstamp', tsToSave, 'extrafignamestring', 'all_WithoutTr');
%     mcmc_plot(marray([1 2 3 5], 1:10:end,1:100:end), parnames([1 2 3 5]),...
%     'savematlabfig', figsave, 'savejpeg', jpgsave,...
%     'projdir', projdir, 'tstamp', tsToSave, 'extrafignamestring', 'WithTr_E1');
%     mcmc_plot(marray([1 2 3 5], 1:end,(end-2000):100:end), parnames([1 2 3 5]),...
%     'savematlabfig', figsave, 'savejpeg', jpgsave,...
%     'projdir', projdir, 'tstamp', tsToSave, 'extrafignamestring', 'WithoutTr_E1');

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


% ok no good: lets try again. 
% I constrained all the points to 
% ixs = find(mstack(:, 4)>-3.1 & mstack(:, 4)<-2.8 &...
%     mstack(:, 6)>2.5 & mstack(:, 6)<2.8);
% and generated the corner plot. 

% With these constraints, some of the compatible parameter values for the
% ESP1s are (compatible == there exists a point in CSP space for which the 
% there is at least one point in E1 and one in E2 . 

% kcp1 = -3.795 to -3.71 || pol1 = 2.9 to 9.7
% another set is: the trapezoid with vertices: 

% X,Y
% 0.59, 0.369 
% 3.033, -1.59
% 9.83, 0.369 
% 9.83, -1.59








%%
%%
%% get points that are within a tight range of the ESP2 fixed points. 
%(for use with the corr steps)
% 
% marray_red = marray(:, :,1:200:end);
% mstack = marray_red(:, :)';
% 
%  % these sims suggest that kcp2 should be -2.8 to -3 (==-3.001). pretty tight!
%         % pol2 :  +2.6 to  +2.8. (== 2.655)
%         
%         % for ESP 1: 2 for kcp1. for pol 1: -0.2 to -0.4
%        % the esps, can also try -3.6 to -3.9 (-3.66) for kcp1 and 
%        % 3.3 (+-0.2) (==3.26) for the pol1. This second point is more compatible
%        % with the ESP2 point I think. moving to the corr code now: 
%        % analysis file for test015_corr1_Ffix3
%        
% epsi = 0.1;
% kc1 = -3.66;
% pol1 = 3.26;
% kc2 = -2.87;
% pol2 = 2.6442;
% 
% ixs = find(mstack(:, 4)>(kc2-epsi) & mstack(:, 4)<(kc2+epsi) &...
%     mstack(:, 6)>(pol2-epsi) & mstack(:, 6)<(pol2+epsi));
% 
% % ixs = find(mstack(:, 4)>kc2-epsi & mstack(:, 4)<kc2+epsi &...
% %     mstack(:, 6)>pol2-epsi & mstack(:, 6)<pol2+epsi &...
% %     mstack(:, 3)>kc1-epsi & mstack(:, 3)<kc1+epsi &...
% %     mstack(:, 5)>pol1-epsi & mstack(:, 5)<pol1+epsi);
% 
% 
% mcmc_plot(mstack(ixs,:), parnames(:))
% ESP2_tilda = mstack(ixs,:);
%  save('ESP2 points_pts1_ts20', 'ESP2_tilda')
% figure; 
% subplot(3,2,1); hist(ESP2_tilda(:,1), 100); title('kfdg')
% subplot(3,2,2); hist(ESP2_tilda(:,2), 100);  title('krdg')
% subplot(3,2,3); hist(ESP2_tilda(:,3), 100);  title('kcp1')
% subplot(3,2,4); hist(ESP2_tilda(:,4), 100);  title('kcp2')
% subplot(3,2,5); hist(ESP2_tilda(:,5), 100);  title('pol1')
% subplot(3,2,6); hist(ESP2_tilda(:,6), 100); title('pol2')
% 
% close
% epsi = 0.02
% kcp2val = 0.7937
% pol2val = -0.5113
% 
% 
% marray_red = marray(:, :,((end-12000):1:end));
% mstack = marray_red(:, :)';
% ixs = find(mstack(:, 4)>kcp2val-epsi & mstack(:, 4)<kcp2val+epsi &...
%     mstack(:, 6)>pol2val-epsi & mstack(:, 6)<pol2val+epsi);
% mcmc_plot(mstack(ixs,:), parnames(:))
% ESP2_tilda_ii = mstack(ixs,:);



%%

marray_red = marray(:, :,1:end);
mstack = marray_red(:, :)';

 % these sims suggest that kcp2 should be -2.8 to -3 (==-3.001). pretty tight!
        % pol2 :  +2.6 to  +2.8. (== 2.655)
        
        % for ESP 1: 2 for kcp1. for pol 1: -0.2 to -0.4
       % the esps, can also try -3.6 to -3.9 (-3.66) for kcp1 and 
       % 3.3 (+-0.2) (==3.26) for the pol1. This second point is more compatible
       % with the ESP2 point I think. moving to the corr code now: 
       % analysis file for test015_corr1_Ffix3
       
epsi = 0.1;
kfdg = 0.75
krdg = 3.889
ixs = find(mstack(:, 1)>(kfdg-epsi) & mstack(:, 1)<(kfdg+epsi) &...
    mstack(:, 2)>(krdg-epsi) & mstack(:, 2)<(krdg+epsi));

% ixs = find(mstack(:, 4)>kc2-epsi & mstack(:, 4)<kc2+epsi &...
%     mstack(:, 6)>pol2-epsi & mstack(:, 6)<pol2+epsi &...
%     mstack(:, 3)>kc1-epsi & mstack(:, 3)<kc1+epsi &...
%     mstack(:, 5)>pol1-epsi & mstack(:, 5)<pol1+epsi);


mcmc_plot(mstack(ixs,:), parnames(:))
CSP_fixed_pts = mstack(ixs,:);

 save('CSP_fixed_pts_ts20', 'CSP_fixed_pts') 
figure; 
subplot(3,2,1); hist(CSP_fixed_pts(:,1), 100); title('kfdg')
subplot(3,2,2); hist(CSP_fixed_pts(:,2), 100);  title('krdg')
subplot(3,2,3); hist(CSP_fixed_pts(:,3), 100);  title('kcp1')
subplot(3,2,4); hist(CSP_fixed_pts(:,4), 100);  title('kcp2')
subplot(3,2,5); hist(CSP_fixed_pts(:,5), 100);  title('pol1')
subplot(3,2,6); hist(CSP_fixed_pts(:,6), 100); title('pol2')

% looks like a good ? ESP2 value set might be 
% kcp2 = 0.5168
% pol2 = -0.2199

% The corresponding kcp1, pol1 has 3 numbers:
% (-3.69, 5.93;;                    == -3.7,  6.09), 
% (5.77 to 6.26, -4.2 to -4.42;;    ==  6.05,-4.3), 
% (-3.517 to -3.3, 4.49 to 3.9 ;;   == -3.3,  4.0)
% Lest set this in the corr step 1, and estimate the CSP test parameters. 
