% File: Fig4_constitutive_param_fitting.m
%
% this file generates Fig 4
%
% Purpose: Plot the VNPRL 2011 + ACS 2014 papers data.
%
% Plot the fits to that data that were performed using mcmc_simbio.
%
% Author:
% Vipul Singhal
%
% The relevant literature for this data is:
%
% 1. Gene Circuit Performance Characterization and Resource Usage in a 
% Cell-Free Breadboard, Siegal-Gaskins, et. al
%
% 2. Coarse-Grained Dynamics of Protein Synthesis in a Cell-Free System
% Karzbrun et. al


% ----------------------------------------------------------------------- %
% Set data and input directories
% ----------------------------------------------------------------------- %

% set flags for whether to save the plots generated (default is false --
% images are large, make sure there is enough RAM / Hard disk space)
jpgsave = false;

% Set the working directory to be the
txtldir = txtl_init; % txtl_init is in the trunk, so this sets everything
mcmc_init;

projdir = [pwd '/mcmc_simbio/projects/proj_vnprl'];

addpath(projdir)

% this dataset is ~5GB. So worth storing it on an external drive. Change
% the directory below accordingly. 
external_drive_where_data_is_stored = '/Volumes/vs_mark1/CALTECH/2020_FEB/proj_vnprl';
temp_data_drive = '/Users/vipulsinghal/Dropbox/Documents/datasets_to_delete_after_use/proj_vnprl';
if exist(external_drive_where_data_is_stored, 'dir')
    data_dir = external_drive_where_data_is_stored;
    addpath(data_dir)
elseif exist(temp_data_drive, 'dir')
    data_dir = temp_data_drive
    addpath(data_dir)
else
    data_dir = projdir;
end


% ----------------------------------------------------------------------- %
% Load the models and the data
% ----------------------------------------------------------------------- %

% Load model, mcmc_info, and data_info.
mobj = model_dsg2014_regen;
mcmc_info = mcmc_info_vnprl_F2(mobj);
di = data_VNPRL2011; % change this.

mi = mcmc_info.model_info;
ri = mcmc_info.runsim_info;
mai = mcmc_info.master_info;

% plot data from existing simulations.

ts14 = '20200510_045912_1_95';
ts15 = '20200510_045912_2_48';
ts16 = '20200512_192355_1_43';
ts17 = '20200512_192355_2_38';
ts18 = '20200513_063545_1_33';
ts19 = '20200513_063545_2_29';
ts20 = '20200513_063545_3_24';
ts21 = '20200513_063545_4_19';

tstamp = {ts14 ts15 ts16 ts17 ts18 ts19 ts20 ts21}; % 
nIterID = {1:30 1:21 1:10  1:10 1:15 1:15 1:15 1:15};% 




load([data_dir '/simdata_' tstamp{end} '/full_variable_set_' tstamp{end} '.mat'], ...
    'mi',...
    'mcmc_info', 'data_info', 'mai', 'ri');

tsToSave = tstamp{end};
mai.masterVector

marray_full = mcmc_get_walkers(tstamp,nIterID, data_dir);
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
regroup = [2 3 1 4 5 8 10 11 12 13 7 6 9];

%%
% ----------------------------------------------------------------------- %
% Plot the parameter distributions, and Markov chains.
% ----------------------------------------------------------------------- %

% Uncomment thiese to plot other variations of the corner plot and the
% trace plots:

% mcmc_plot(marray(:, 1:10:end,1:1000:end), parnames(:),...
%     'savejpeg', jpgsave,...
%     'projdir', projdir, 'tstamp', tsToSave, ...
%     'extrafignamestring','WithTransient_jul31');

mcmc_plot(marray(regroup, 1:end,1:end), parnames(regroup),...
    'plotDistribution', false, ...
    'projdir', projdir, 'tstamp', tsToSave);
%%
mcmc_plot(marray(regroup, 1:end,1300:200:end), parnames(regroup),...
    'scatter', false,'ess', 50, 'plotChains', false,...
    'savejpeg', jpgsave,...
    'projdir', projdir, 'tstamp', tsToSave, ...
    'extrafignamestring', 'BurnedIn_kde');
%%
mcmc_plot(marray(regroup, 1:end,1300:200:end), parnames(regroup),...
    'scatter', true, 'plotChains', false,...
    'savejpeg', jpgsave,...
    'projdir', projdir, 'tstamp', tsToSave, ...
    'extrafignamestring', 'BurnedIn');

%%
%
% ----------------------------------------------------------------------- %
% Plot the trajectories.
% ----------------------------------------------------------------------- %

workingDir = [pwd '/mcmc_simbio/exp_data/public_data/'];

% run merger
%all_data_merger;
load([workingDir 'mergedExperimentFiles.mat'])

colorCodes = {'r','b','g','c','m','k',[1 1 .5],[.7 .5 .2],[0 1 .2],[.35 .8 .8],[.9 0 .4],[1 .2 .2]};

RFUumConvert = 1.723;   % (1.723 a.u. = 1 nM)
RFUumConvertMG = 7.75;  % (7.75 a.u. = 1 nM)

ylims = [1000 50 12000];
lengthToPlotArray = [21, 76, 76];


figure
set(0,'Units','normalized')
set(gcf,'Units', 'normalized')
set(gcf, 'Position', [0.05, 0.1, 0.3, 0.6])
miToUse = [1 2 2]; % mi 1 has one plot (RNA) and mi 2 has 2 plots (RNA and protein)
msToPlot = [1 1 2];
timeinterval = [6 8 8];
%
titleArray = {'RNA deg';
    'mRNA expression';
    'deGFP expression'};
legLoc = {'NorthEast','NorthEast','NorthWest'};

legends = [{fliplr({'1000nM', '800nM', '600nM', '200nM', '75nM', '37.5nM'})};
    {{'0.5nM', '2nM', '5nM', '20nM'}};
    {{'0.5nM', '2nM', '5nM', '20nM'}};];
dosesToPlot = {{[1 2 4 5 7 9]}
    {[1 2 3 4]}
    {[1 2 3 4]}};

%     clear marray
yLab = {'RNA, nM', 'RNA, nM', 'deGFP, nM'}

mvarray = masterVecArray(marray(:,:,1:50:end), mai);
%
% samplePoints = ceil(size(mvarray, 3) * [.9, 1]);
%     
% % resimulate, 
% % ms = {{'protein deGFP*'}};
% for miID = 1:length(mi)
%     
%     currmi = mi(miID);
%     ms = currmi.measuredSpecies;
%     currdi = data_info(currmi.dataToMapTo);
%     tv = currdi.timeVector;
%     marrayOrd = mvarray(currmi.paramMaps(currmi.orderingIx),:,samplePoints);
%     dose  = currmi.dosedVals';
%     vi = get(currmi.emo, 'ValueInfo');
%     for i = 1:length(vi)
%         vi(i)
%     end
%     currmi.dosedNames
%     currmi.dosedVals
%     
%     dose
%     
%     [da{miID}, idxnotused{miID}] = ...
%         simulatecurves(currmi.emo,marrayOrd(:,:)', 50, dose, tv, currmi.measuredSpecies);
% end

t_vec_mins=mergedExpFile(1).t_vec/60;

for count = 1:length(miToUse)  %1:length(mi)%1:
    colorz = flipud(parula(max(dosesToPlot{count}{:})+2));
    currmi = mi(miToUse(count));
    currdi = data_info(currmi.dataToMapTo);
    tv = currdi.timeVector;
    lengthToPlot = lengthToPlotArray(count);
    
    % experimental data
    subplot(3, 2, (count-1)*2+1)
    if count == 1 % for the RNA use the data info.
        %
        for dID = dosesToPlot{count}{:}
            plot(tv(1:lengthToPlot)/60,...
                mean(currdi.dataArray(1:lengthToPlot, msToPlot(count), 1, dID),3),...
                'LineWidth', 1.5,...
                'Color', colorz(dID+2, :))
            
            hold on
        end
        grid on
        title([titleArray{count} ' (Exp)'])
        ylabel(yLab{count}, 'FontSize', 14)
        axis([0 (lengthToPlot-1)*timeinterval(count), 0 ylims(count)])
        ax = gca;
        ax.FontSize = 14;
        
    elseif count == 2 % for the MG aptamer and the deGFP, use the scripts provided by Zoltan.
        %%%%%  MG KINETICS WITH CORRECT BACKGROUNDS SUBTRACTED
        plotSelect=[ 5, 7, 8, 10];
        mgBackground = mergedExpFile(1).Data_mean(:,1:11,1);
        mgNoBgMean=mergedExpFile(1).Data_mean(:,12:22,1)-mgBackground;
        for i=1:11
            mgNoBgMean(:,i)=mean([ ...
                expFile(1).Data(:,12+i,1)-mgBackground(:,i) ...
                expFile(2).Data(:,12+i,1)-mgBackground(:,i) ...
                expFile(2).Data(:,35+i,1)-mgBackground(:,i) ...
                ],2)/RFUumConvertMG/10;
            
            mgNoBgErr(:,i)=std([ ...
                expFile(1).Data(:,12+i,1)-mgBackground(:,i) ...
                expFile(2).Data(:,12+i,1)-mgBackground(:,i) ...
                expFile(2).Data(:,35+i,1)-mgBackground(:,i) ...
                ],0,2)/sqrt(3)/RFUumConvertMG/10;
        end
%         figure('Name','MG kinetics');
        hold on
        % errorbar(repmat(t_vec_mins,1,length(plotSelect)),mgNoBgMean(:,plotSelect),mgNoBgErr(:,plotSelect));
        for dID = dosesToPlot{count}{:}
            colorzCell{dID} = colorz(dID+2, :);
        end

    
        h = stdshade(t_vec_mins, ...
            mgNoBgMean(:,plotSelect), ...
            mgNoBgErr(:,plotSelect), ...
            0.3, ...
            colorzCell);
        title([titleArray{count} ' (Exp)'])
        %h = stdshade(t_vec_mins,mergedExpFile(1).noBg_mean(:,plotSelect+11,1)/RFUumConvertMG,mergedExpFile(1).noBg_std(:,plotSelect+11)/RFUumConvertMG,0.3,colorCodes);
        axis([0 (lengthToPlot-1)*timeinterval(count), ...
            0, ...
            ylims(count)])
        ylabel('RNA, nM')
        grid on
        legendStr = cellstr(num2str(mergedExpFile(1).concentrations(plotSelect)', ...
            'pr-gfp-mg15 %0.2g nM'));
        %legend(h,legendStr,'Location','NorthEast')
        ax = gca;
        ax.FontSize = 14;
    elseif count == 3
        plotSelect=[5, 7, 8, 10];
%         figure('Name','GFP kinetics');
        hold on
        for dID = dosesToPlot{count}{:}
            colorzCell{dID} = colorz(dID+2, :);
        end
        h = stdshade(t_vec_mins,mergedExpFile(1).noBg_mean(:,11+plotSelect,2)/RFUumConvert/1.8,mergedExpFile(1).noBg_std(:,11+plotSelect,2)/RFUumConvert/sqrt(3)/1.8,0.3,colorzCell);
        axis([0 (lengthToPlot-1)*timeinterval(count),0,ylims(count)])
        title([titleArray{count} ' (Exp)'])
        xlabel('Time [mins]')
        ylabel('deGFP (uM)')
        grid on
        legendStr = cellstr(num2str(mergedExpFile(1).concentrations(plotSelect)', 'pr-gfp-mg15 %0.2g nM'));
        ax = gca;
        ax.FontSize = 14;
        %legend(h,legendStr,'Location','NorthWest')
    end
    
    
    % simulation results
    subplot(3, 2, (count-1)*2+2)
    for dID = dosesToPlot{count}{:}
        [linehandle(dID), ptchhandle] =...
            boundedline(tv(1:lengthToPlot)/60,...
            mean(da{miToUse(count)}(1:lengthToPlot, msToPlot(count), :, dID), 3),...
            std(da{miToUse(count)}(1:lengthToPlot, msToPlot(count), :, dID)...
            +eps*randn(lengthToPlot, 1, 50), 0,3));
        set(ptchhandle, ...
            'FaceColor', colorz(dID+2, :),...
            'FaceAlpha', 0.25);
        set(linehandle(dID), ...
            'Color', colorz(dID+2, :),...
            'LineWidth', 1.5);
%         
%         plot(tv(1:lengthToPlot)/60,...
%             mean(da{miToUse(count)}(1:lengthToPlot, msToPlot(count), :, dID), 3),...
%             'LineWidth', 1.5,...
%             'Color', colorz(dID+2, :))
        hold on
    end
    grid on
    title([titleArray{count} ' (Fit)'])
    
    legend(linehandle(dosesToPlot{count}{:}), legends{count, :}, 'Location', legLoc{count}, 'FontSize', 14)
    legend('boxoff')
    axis([0 (lengthToPlot-1)*timeinterval(count) 0 ylims(count)])
    if count ==length(miToUse)
        xlabel('time, minutes', 'FontSize', 14)
    end
    ax = gca;
    ax.FontSize = 14;
end


%%
% ----------------------------------------------------------------------- %
% Pick out parameters close to the peak of the marginal distributions and
% resimulate. 
% ----------------------------------------------------------------------- %
% 
% marray_thin = marray(:, :, end-19400:50:end);
% marray_flat = marray_thin(:,:)';
% %%
% 
% parnames = ...
%     [{'TX_{cat}'    }
%     {'\tau_{atp}'   }
%     {'\delta_{atp}' }
%     {'pol_{Kd}'     }                                               
%     {'pol_{term}'   }
%     {'RNAse_{Kd}'   }
%     {'RNAse_{cat}'  }
%     {'pol'          }
%     {'RNase'        }
%     {'TL_{cat}'     }
%     {'Ribo_{Kd}'    }
%     {'Ribo_{term}'  }
%     {'Ribo'         }];
% regroup = [1, 4, 5, 8, 6, 7, 9, 10, 11, 12, 13, 2, 3]
% 
% pix = regroup([1:4 12 13])
% mcmc_plot(marray(pix, 1:end,(end-14400):800:end), parnames(pix),...
%     'projdir', projdir, 'tstamp', tsToSave, 'plotChains', false);
% pix = regroup(5:7)
% mcmc_plot(marray(pix, 1:end,(end-14400):800:end), parnames(pix),...
%     'projdir', projdir, 'tstamp', tsToSave, 'plotChains', false);
% pix = regroup(8:11)
% mcmc_plot(marray(pix, 1:end,(end-14400):800:end), parnames(pix),...
%     'projdir', projdir, 'tstamp', tsToSave, 'plotChains', false);
% %%
% parslices = ...
%     [{'TX_{cat}'    }, {[2.45 2.65]}, %[1.7 2.1]
%     {'\tau_{atp}'   }, {[8.76 8.91]},
%     {'\delta_{atp}' }, {[-10.1 -9.8 ]},
%     {'pol_{Kd}'     }, {[13.55 13.95]}, 
%     {'pol_{term}'   }, {[-2.1 6]}, 
%     {'RNAse_{Kd}'   }, {[15 16.2]},
%     {'RNAse_{cat}'  }, {[-3.3 -0.9]},
%     {'pol'          }, {[1.44 1.62]},
%     {'RNase'        }, {[9.6 11.4]},
%     {'TL_{cat}'     }, {[3.1 3.6]},
%     {'Ribo_{Kd}'    }, {[-3 14.5]},
%     {'Ribo_{term}'  }, {[2.2 2.7]},
%     {'Ribo'         }, {[3 7]}];
% % pol kd is cartesian with pol term, rnaseKd, rnase cat. BUT NOT POL. 
% % cartesian with  rnaseKd, rnase cat and POL
% cutted_marray = mcmc_cut(marray_flat, 1:13, flipud(cell2mat(parslices(:, 2))'));
% size(cutted_marray)
% 
% %
% mcmc_plot(cutted_marray(:,regroup), parnames(regroup))
% 
% 
% 
% 
% %%
% 
% mcmc_plot(cutted_marray(:,regroup), parnames(regroup),...
%     'scatter', false, 'ess', 300)
% %%
% % figure out which parameter, when its parameter range is relaxed slightly,
% % allows for more points to fall in the parameter hypercube. 
% for i = 1:13
%     currpar = flipud(cell2mat(parslices(:, 2))');
%     currpar(1, i) = currpar(1, i)+0.05;
%     currpar(2, i) = currpar(2, i)-0.05;
%     cutted_marray = mcmc_cut(marray_flat, 1:13, currpar);
%     i
%     size(cutted_marray)
% end
% % 
% % i =
% % 
% %      1
% % 
% % 
% % ans =
% % 
% %      8    13
% % 
% % 
% 
% %%
% % looks like the first parameter has the most rate limiting value.
% % We will relax that slightly, and get just about 100 points. From that, we
% % can get a rough estimate of the standard deviations of the parameter
% % distributions. 
% 
% % relax the parameter distribution for the TX catalysis rate (the first
% % parameter)
% 
% i = 1
% relaxation = 0.25
% currpar = flipud(cell2mat(parslices(:, 2))');
% currpar(1, i) = currpar(1, i)+relaxation;
% currpar(2, i) = currpar(2, i)-relaxation;
% cutted_marray = mcmc_cut(marray_flat, 1:13, currpar);
% i
% size(cutted_marray)
% 
% mcmc_plot(cutted_marray, parnames)
% %%
% %      
% % [parnames'; mat2cell(exp(cutted_marray), ones(8, 1), ones(1, 13))]
% % 
% % ans =
% % 
% %   9×13 cell array
% % 
% %     {'TX_{cat}'}    {'\tau_{atp}'}    {'\delta_{atp}'}    {'pol_{Kd}'  }    {'pol_{term}'}    {'RNAse_{Kd}'}    {'RNAse_{cat}'}    {'pol'   }    {'RNase'}    {'TL_{cat}'}    {'Ribo_{Kd}'}    {'Ribo_{term}'}    {'Ribo'  }
% %     {[  8.4548]}    {[    6488.9]}    {[  4.9256e-05]}    {[ 5.859e+05]}    {[    3.9009]}    {[3.5793e+06]}    {[   0.034014]}    {[6.8673]}    {[76696]}    {[   27.68]}    {[   4.9889]}    {[     100.75]}    {[31.293]}
% %     {[  8.4593]}    {[    6744.9]}    {[  5.5341e-05]}    {[4.6888e+05]}    {[    293.78]}    {[ 5.121e+06]}    {[    0.11027]}    {[ 6.651]}    {[33335]}    {[  19.952]}    {[   899.17]}    {[     136.97]}    {[40.028]}
% %     {[  8.4652]}    {[    6488.3]}    {[  4.9128e-05]}    {[6.8741e+05]}    {[    5.2967]}    {[4.8232e+06]}    {[   0.043846]}    {[7.0227]}    {[79768]}    {[  27.793]}    {[  0.88704]}    {[     120.95]}    {[27.931]}
% %     {[  7.8764]}    {[    7112.3]}    {[  5.4362e-05]}    {[4.7749e+05]}    {[    13.155]}    {[7.8422e+06]}    {[    0.32299]}    {[7.2406]}    {[17356]}    {[  28.281]}    {[   1077.4]}    {[     39.547]}    {[ 33.94]}
% %     {[  8.4806]}    {[    6099.6]}    {[  4.5915e-05]}    {[4.4842e+05]}    {[   0.36079]}    {[4.0146e+06]}    {[   0.051975]}    {[6.7912]}    {[55764]}    {[  28.251]}    {[   111.18]}    {[     28.287]}    {[ 38.72]}
% %     {[  8.5836]}    {[    6605.7]}    {[  5.1243e-05]}    {[5.7285e+05]}    {[    24.217]}    {[2.9215e+06]}    {[    0.05964]}    {[6.7162]}    {[35325]}    {[  22.462]}    {[    552.2]}    {[     115.08]}    {[37.224]}
% %     {[  8.1963]}    {[    6003.3]}    {[  4.7183e-05]}    {[4.8602e+05]}    {[    364.52]}    {[6.1432e+06]}    {[    0.13133]}    {[7.1013]}    {[33492]}    {[  25.313]}    {[   5402.2]}    {[      97.28]}    {[33.422]}
% %     {[  8.5517]}    {[    6826.4]}    {[  4.9666e-05]}    {[5.0206e+05]}    {[    33.437]}    {[6.4692e+06]}    {[      0.139]}    {[6.5359]}    {[33318]}    {[  34.317]}    {[  0.16812]}    {[     14.979]}    {[ 58.88]}
% %     
% % 
% %     2.0639
% %     8.8696
% %    -9.8198
% %    13.0763
% %     2.5768
% %    15.8750
% %    -1.1301
% %     1.9797
% %     9.7617
% %     3.3422
% %     6.9823
% %     3.6775
% %     3.5246
%     
% 
% % The parameters that are very variable are: 
% % 5 pol_term
% % 6 RNAse Kd
% % 7 RNAse cat
% % 9 RNase
% % 11 Ribo Kd
% % 12 ribo term
% 
% 
% 
% mvarray1 = repmat(mai.masterVector, 1, size(cutted_marray', 2));
% estParamsIx = setdiff((1:length(mai.masterVector))', mai.fixedParams);
% 
% mvarray1(estParamsIx, :) = cutted_marray';
% size(mvarray1)
% 
% %
% workingDir = [pwd '/mcmc_simbio/exp_data/public_data/'];
% 
% % run merger
% %all_data_merger;
% load([workingDir 'mergedExperimentFiles.mat'])
% 
% colorCodes = {'r','b','g','c','m','k',[1 1 .5],[.7 .5 .2],[0 1 .2],[.35 .8 .8],[.9 0 .4],[1 .2 .2]};
% 
% RFUumConvert = 1.723;   % (1.723 a.u. = 1 nM)
% RFUumConvertMG = 7.75;  % (7.75 a.u. = 1 nM)
% 
% 
% ylims = [1000 50 12000];
% lengthToPlotArray = [21, 76, 76];
% 
% figure
% ss = get(0, 'screensize');
% set(gcf, 'Position', [ss(3)*(1-1/1.3) ss(4)*(1-1/1.3) ss(3)/3 ss(4)/1.4]);
% miToUse = [1 2 2]; % mi 1 has one plot (RNA) and mi 2 has 2 plots (RNA and protein)
% msToPlot = [1 1 2];
% timeinterval = [6 8 8];
% %
% titleArray = {'RNA deg';
%     'mRNA expression';
%     'deGFP expression'};
% legLoc = {'NorthEast','NorthEast','NorthWest'};
% 
% legends = [{fliplr({'1000nM', '800nM', '600nM', '200nM', '75nM', '37.5nM'})};
%     {{'0.5nM', '2nM', '5nM', '20nM'}};
%     {{'0.5nM', '2nM', '5nM', '20nM'}};];
% dosesToPlot = {{[1 2 4 5 7 9]}
%     {[1 2 3 4]}
%     {[1 2 3 4]}};
% 
% %     clear marray
% yLab = {'RNA, nM', 'RNA, nM', 'deGFP, nM'}
% 
% samplePoints = ceil(size(mvarray1, 3) * [.9, 1]);
%     
%     
% % resimulate, 
% % ms = {{'protein deGFP*'}};
% for miID = 1:length(mi)
%     
%     currmi = mi(miID);
%     ms = currmi.measuredSpecies;
%     currdi = data_info(currmi.dataToMapTo);
%     tv = currdi.timeVector;
%     marrayOrd = mvarray1(currmi.paramMaps(currmi.orderingIx),:,samplePoints);
%     dose  = currmi.dosedVals';
%     vi = get(currmi.emo, 'ValueInfo');
%     for i = 1:length(vi)
%         vi(i)
%     end
%     currmi.dosedNames
%     currmi.dosedVals
%     
%     dose
%     
%     [da{miID}, idxnotused{miID}] = ...
%         simulatecurves(currmi.emo,marrayOrd(:,:)', 50, dose, tv, currmi.measuredSpecies);
% end
% 
% t_vec_mins=mergedExpFile(1).t_vec/60;
% 
% for count = 1:length(miToUse)  %1:length(mi)%1:
%     colorz = flipud(parula(max(dosesToPlot{count}{:})+2));
%     currmi = mi(miToUse(count));
%     currdi = data_info(currmi.dataToMapTo);
%     tv = currdi.timeVector;
%     lengthToPlot = lengthToPlotArray(count);
%     
%     % experimental data
%     subplot(3, 2, (count-1)*2+1)
%     if count == 1 % for the RNA use the data info.
%         %
%         for dID = dosesToPlot{count}{:}
%             plot(tv(1:lengthToPlot)/60,...
%                 mean(currdi.dataArray(1:lengthToPlot, msToPlot(count), 1, dID),3),...
%                 'LineWidth', 1.5,...
%                 'Color', colorz(dID+2, :))
%             
%             hold on
%         end
%         grid on
%         title([titleArray{count} ' (Exp)'])
%         ylabel(yLab{count}, 'FontSize', 14)
%         axis([0 (lengthToPlot-1)*timeinterval(count), 0 ylims(count)])
%         ax = gca;
%         ax.FontSize = 14;
%         
%     elseif count == 2 % for the MG aptamer and the deGFP, use the scripts provided by Zoltan.
%         %%%%%  MG KINETICS WITH CORRECT BACKGROUNDS SUBTRACTED
%         plotSelect=[ 5, 7, 8, 10];
%         mgBackground = mergedExpFile(1).Data_mean(:,1:11,1);
%         mgNoBgMean=mergedExpFile(1).Data_mean(:,12:22,1)-mgBackground;
%         for i=1:11
%             mgNoBgMean(:,i)=mean([ ...
%                 expFile(1).Data(:,12+i,1)-mgBackground(:,i) ...
%                 expFile(2).Data(:,12+i,1)-mgBackground(:,i) ...
%                 expFile(2).Data(:,35+i,1)-mgBackground(:,i) ...
%                 ],2)/RFUumConvertMG/10;
%             
%             mgNoBgErr(:,i)=std([ ...
%                 expFile(1).Data(:,12+i,1)-mgBackground(:,i) ...
%                 expFile(2).Data(:,12+i,1)-mgBackground(:,i) ...
%                 expFile(2).Data(:,35+i,1)-mgBackground(:,i) ...
%                 ],0,2)/sqrt(3)/RFUumConvertMG/10;
%         end
% %         figure('Name','MG kinetics');
%         hold on
%         % errorbar(repmat(t_vec_mins,1,length(plotSelect)),mgNoBgMean(:,plotSelect),mgNoBgErr(:,plotSelect));
%         for dID = dosesToPlot{count}{:}
%             colorzCell{dID} = colorz(dID+2, :);
%         end
% 
%     
%         h = stdshade(t_vec_mins, ...
%             mgNoBgMean(:,plotSelect), ...
%             mgNoBgErr(:,plotSelect), ...
%             0.3, ...
%             colorzCell);
%         title([titleArray{count} ' (Exp)'])
%         %h = stdshade(t_vec_mins,mergedExpFile(1).noBg_mean(:,plotSelect+11,1)/RFUumConvertMG,mergedExpFile(1).noBg_std(:,plotSelect+11)/RFUumConvertMG,0.3,colorCodes);
%         axis([0 (lengthToPlot-1)*timeinterval(count), ...
%             0, ...
%             ylims(count)])
%         ylabel('RNA, nM')
%         grid on
%         legendStr = cellstr(num2str(mergedExpFile(1).concentrations(plotSelect)', ...
%             'pr-gfp-mg15 %0.2g nM'));
%         %legend(h,legendStr,'Location','NorthEast')
%         ax = gca;
%         ax.FontSize = 14;
%     elseif count == 3
%         plotSelect=[5, 7, 8, 10];
% %         figure('Name','GFP kinetics');
%         hold on
%         for dID = dosesToPlot{count}{:}
%             colorzCell{dID} = colorz(dID+2, :);
%         end
%         h = stdshade(t_vec_mins,mergedExpFile(1).noBg_mean(:,11+plotSelect,2)/RFUumConvert/1.8,mergedExpFile(1).noBg_std(:,11+plotSelect,2)/RFUumConvert/sqrt(3)/1.8,0.3,colorzCell);
%         axis([0 (lengthToPlot-1)*timeinterval(count),0,ylims(count)])
%         title([titleArray{count} ' (Exp)'])
%         xlabel('Time [mins]')
%         ylabel('deGFP (uM)')
%         grid on
%         legendStr = cellstr(num2str(mergedExpFile(1).concentrations(plotSelect)', 'pr-gfp-mg15 %0.2g nM'));
%         ax = gca;
%         ax.FontSize = 14;
%         %legend(h,legendStr,'Location','NorthWest')
%     end
%     
%     
%     % simulation results
%     subplot(3, 2, (count-1)*2+2)
%     for dID = dosesToPlot{count}{:}
%         plot(tv(1:lengthToPlot)/60,...
%             mean(da{miToUse(count)}(1:lengthToPlot, msToPlot(count), :, dID), 3),...
%             'LineWidth', 1.5,...
%             'Color', colorz(dID+2, :))
%         hold on
%     end
%     grid on
%     title([titleArray{count} ' (Fit)'])
%     
%     legend(legends{count, :}, 'Location', legLoc{count}, 'FontSize', 14)
%     legend('boxoff')
%     axis([0 (lengthToPlot-1)*timeinterval(count) 0 ylims(count)])
%     if count ==length(miToUse)
%         xlabel('time, minutes', 'FontSize', 14)
%     end
%     ax = gca;
%     ax.FontSize = 14;
% end
% 
% % 
% % [mi(2).namesUnord mat2cell(mvarray1(:, 1:14), ones(size(mvarray1(:, 1:14),1), 1), ones(1, size(mvarray1(:, 1:14),2)))]
% % 
% % ans =
% % 
% %   26×15 cell array
% % 
% %   Columns 1 through 14
% % 
% %     {'TX_elong_glob'    }    {[ 2.5192]}    {[ 2.5233]}    {[ 2.5233]}    {[ 2.6567]}    {[ 2.5938]}    {[ 2.5600]}    {[ 2.5935]}    {[ 2.4986]}    {[ 2.4982]}    {[ 2.5032]}    {[ 2.5032]}    {[ 2.5688]}    {[ 2.5234]}
% %     {'AGTPdeg_time'     }    {[ 8.7841]}    {[ 8.7963]}    {[ 8.7963]}    {[ 8.8857]}    {[ 8.8814]}    {[ 8.7921]}    {[ 8.8814]}    {[ 8.7856]}    {[ 8.8983]}    {[ 8.7837]}    {[ 8.8992]}    {[ 8.8844]}    {[ 8.8999]}
% %     {'AGTPdeg_rate'     }    {[-9.9306]}    {[-9.9039]}    {[-9.9039]}    {[-9.9866]}    {[-9.9518]}    {[-9.9030]}    {[-9.9516]}    {[-9.8910]}    {[-9.9058]}    {[-9.9002]}    {[-9.9032]}    {[-9.8462]}    {[-9.8983]}
% %     {'AGTPreg_ON'       }    {[-3.9120]}    {[-3.9120]}    {[-3.9120]}    {[-3.9120]}    {[-3.9120]}    {[-3.9120]}    {[-3.9120]}    {[-3.9120]}    {[-3.9120]}    {[-3.9120]}    {[-3.9120]}    {[-3.9120]}    {[-3.9120]}
% %     {'TXTL_P70_RNAPbo?'}    {[13.5687]}    {[13.6094]}    {[13.6094]}    {[13.9008]}    {[13.7011]}    {[13.6104]}    {[13.7015]}    {[13.5530]}    {[13.6313]}    {[13.5607]}    {[13.6394]}    {[13.6690]}    {[13.6552]}
% %     {'TXTL_P70_RNAPbo?'}    {[ 1.5000]}    {[ 1.5000]}    {[ 1.5000]}    {[ 1.5000]}    {[ 1.5000]}    {[ 1.5000]}    {[ 1.5000]}    {[ 1.5000]}    {[ 1.5000]}    {[ 1.5000]}    {[ 1.5000]}    {[ 1.5000]}    {[ 1.5000]}
% %     {'TXTL_RNAPBOUND_?'}    {[ 0.5829]}    {[ 0.7089]}    {[ 0.7089]}    {[-0.1236]}    {[ 2.5485]}    {[ 0.6923]}    {[ 2.5520]}    {[ 0.8565]}    {[ 2.6346]}    {[ 0.8781]}    {[ 2.4665]}    {[ 5.3278]}    {[ 3.0333]}
% %     {'TXTL_NTP_RNAP_1?'}    {[ 2.9459]}    {[ 2.9459]}    {[ 2.9459]}    {[ 2.9459]}    {[ 2.9459]}    {[ 2.9459]}    {[ 2.9459]}    {[ 2.9459]}    {[ 2.9459]}    {[ 2.9459]}    {[ 2.9459]}    {[ 2.9459]}    {[ 2.9459]}
% %     {'TXTL_NTP_RNAP_1_F'}    {[      0]}    {[      0]}    {[      0]}    {[      0]}    {[      0]}    {[      0]}    {[      0]}    {[      0]}    {[      0]}    {[      0]}    {[      0]}    {[      0]}    {[      0]}
% %     {'TXTL_NTP_RNAP_2?'}    {[13.9970]}    {[13.9970]}    {[13.9970]}    {[13.9970]}    {[13.9970]}    {[13.9970]}    {[13.9970]}    {[13.9970]}    {[13.9970]}    {[13.9970]}    {[13.9970]}    {[13.9970]}    {[13.9970]}
% %     {'TXTL_NTP_RNAP_2_F'}    {[      0]}    {[      0]}    {[      0]}    {[      0]}    {[      0]}    {[      0]}    {[      0]}    {[      0]}    {[      0]}    {[      0]}    {[      0]}    {[      0]}    {[      0]}
% %     {'TXTL_RNAdeg_Kd'   }    {[15.1215]}    {[15.1812]}    {[15.1812]}    {[15.0607]}    {[15.6255]}    {[15.0806]}    {[15.6252]}    {[15.0825]}    {[15.7743]}    {[15.0749]}    {[15.6916]}    {[15.7752]}    {[15.6094]}
% %     {'TXTL_RNAdeg_F'    }    {[      0]}    {[      0]}    {[      0]}    {[      0]}    {[      0]}    {[      0]}    {[      0]}    {[      0]}    {[      0]}    {[      0]}    {[      0]}    {[      0]}    {[      0]}
% %     {'TXTL_RNAdeg_kc'   }    {[-2.4342]}    {[-2.3222]}    {[-2.3222]}    {[-2.3657]}    {[-2.3941]}    {[-2.1855]}    {[-2.3874]}    {[-2.5578]}    {[-2.1664]}    {[-2.4724]}    {[-2.0728]}    {[-1.7949]}    {[-1.8127]}
% %     {'RNAP'             }    {[ 1.5553]}    {[ 1.5529]}    {[ 1.5529]}    {[ 1.4422]}    {[ 1.4440]}    {[ 1.5166]}    {[ 1.4444]}    {[ 1.5710]}    {[ 1.5354]}    {[ 1.5669]}    {[ 1.5326]}    {[ 1.4886]}    {[ 1.5140]}
% %     {'RNase'            }    {[10.3179]}    {[10.2645]}    {[10.2645]}    {[10.1878]}    {[10.7806]}    {[10.0274]}    {[10.7737]}    {[10.4021]}    {[10.7011]}    {[10.3088]}    {[10.5245]}    {[10.3276]}    {[10.1817]}
% %     {'TL_elong_glob'    }    {[ 3.1708]}    {[ 3.1833]}    {[ 3.1833]}    {[ 3.4693]}    {[ 3.4613]}    {[ 3.1740]}    {[ 3.4609]}    {[ 3.1191]}    {[ 3.3590]}    {[ 3.1442]}    {[ 3.3755]}    {[ 3.4432]}    {[ 3.3434]}
% %     {'TXTL_PROT_deGFP?'}    {[-6.0748]}    {[-6.0748]}    {[-6.0748]}    {[-6.0748]}    {[-6.0748]}    {[-6.0748]}    {[-6.0748]}    {[-6.0748]}    {[-6.0748]}    {[-6.0748]}    {[-6.0748]}    {[-6.0748]}    {[-6.0748]}
% %     {'TXTL_UTR_UTR1_Kd' }    {[ 4.1698]}    {[ 3.8862]}    {[ 3.8862]}    {[-1.7065]}    {[ 5.7743]}    {[ 4.2252]}    {[ 5.7639]}    {[ 4.5721]}    {[ 5.1047]}    {[ 4.6280]}    {[ 5.4686]}    {[-2.4273]}    {[ 6.2585]}
% %     {'TXTL_UTR_UTR1_F'  }    {[-0.2000]}    {[-0.2000]}    {[-0.2000]}    {[-0.2000]}    {[-0.2000]}    {[-0.2000]}    {[-0.2000]}    {[-0.2000]}    {[-0.2000]}    {[-0.2000]}    {[-0.2000]}    {[-0.2000]}    {[-0.2000]}
% %     {'TL_AA_Kd'         }    {[ 6.5566]}    {[ 6.5566]}    {[ 6.5566]}    {[ 6.5566]}    {[ 6.5566]}    {[ 6.5566]}    {[ 6.5566]}    {[ 6.5566]}    {[ 6.5566]}    {[ 6.5566]}    {[ 6.5566]}    {[ 6.5566]}    {[ 6.5566]}
% %     {'TL_AA_F'          }    {[-0.3000]}    {[-0.3000]}    {[-0.3000]}    {[-0.3000]}    {[-0.3000]}    {[-0.3000]}    {[-0.3000]}    {[-0.3000]}    {[-0.3000]}    {[-0.3000]}    {[-0.3000]}    {[-0.3000]}    {[-0.3000]}
% %     {'TL_AGTP_Kd'       }    {[14.5090]}    {[14.5090]}    {[14.5090]}    {[14.5090]}    {[14.5090]}    {[14.5090]}    {[14.5090]}    {[14.5090]}    {[14.5090]}    {[14.5090]}    {[14.5090]}    {[14.5090]}    {[14.5090]}
% %     {'TL_AGTP_F'        }    {[-1.2000]}    {[-1.2000]}    {[-1.2000]}    {[-1.2000]}    {[-1.2000]}    {[-1.2000]}    {[-1.2000]}    {[-1.2000]}    {[-1.2000]}    {[-1.2000]}    {[-1.2000]}    {[-1.2000]}    {[-1.2000]}
% %     {'TXTL_RIBOBOUND_?'}    {[ 2.5637]}    {[ 2.5792]}    {[ 2.5792]}    {[ 2.5062]}    {[ 2.2847]}    {[ 2.5675]}    {[ 2.2849]}    {[ 2.6480]}    {[ 2.4270]}    {[ 2.6265]}    {[ 2.4136]}    {[ 2.3115]}    {[ 2.3851]}
% %     {'Ribo'             }    {[ 5.5851]}    {[ 5.5963]}    {[ 5.5963]}    {[ 4.4510]}    {[ 5.2383]}    {[ 5.7872]}    {[ 5.2456]}    {[ 5.4721]}    {[ 5.1413]}    {[ 5.5046]}    {[ 5.2330]}    {[ 6.2426]}    {[ 5.4866]}
% %     
% 
% % 
% % [mi(2).namesUnord mat2cell(exp(mvarray1(:, 1:22)), ones(size(mvarray1(:, 1:22),1), 1), ones(1, size(mvarray1(:, 1:22),2)))]
% % 
% % ans =
% % 
% %   26×23 cell array
% % 
% %   Columns 1 through 12
% % 
% %     {'TX_elong_glob'    }    {[    12.418]}    {[    12.469]}    {[    12.469]}    {[    14.249]}    {[     13.38]}    {[    12.936]}    {[    13.377]}    {[    12.166]}    {[    12.161]}    {[    12.221]}    {[    12.221]}
% %     {'AGTPdeg_time'     }    {[    6529.5]}    {[    6609.5]}    {[    6609.5]}    {[      7228]}    {[    7196.8]}    {[    6582.2]}    {[    7197.1]}    {[    6539.1]}    {[    7319.4]}    {[    6526.7]}    {[      7326]}
% %     {'AGTPdeg_rate'     }    {[4.8663e-05]}    {[4.9977e-05]}    {[4.9977e-05]}    {[4.6013e-05]}    {[4.7642e-05]}    {[5.0027e-05]}    {[ 4.765e-05]}    {[ 5.063e-05]}    {[4.9885e-05]}    {[5.0164e-05]}    {[5.0015e-05]}
% %     {'AGTPreg_ON'       }    {[      0.02]}    {[      0.02]}    {[      0.02]}    {[      0.02]}    {[      0.02]}    {[      0.02]}    {[      0.02]}    {[      0.02]}    {[      0.02]}    {[      0.02]}    {[      0.02]}
% %     {'TXTL_P70_RNAPbo?'}    {[7.8129e+05]}    {[8.1373e+05]}    {[8.1373e+05]}    {[1.0891e+06]}    {[8.9193e+05]}    {[8.1454e+05]}    {[8.9224e+05]}    {[7.6909e+05]}    {[8.3176e+05]}    {[7.7509e+05]}    {[8.3851e+05]}
% %     {'TXTL_P70_RNAPbo?'}    {[    4.4817]}    {[    4.4817]}    {[    4.4817]}    {[    4.4817]}    {[    4.4817]}    {[    4.4817]}    {[    4.4817]}    {[    4.4817]}    {[    4.4817]}    {[    4.4817]}    {[    4.4817]}
% %     {'TXTL_RNAPBOUND_?'}    {[    1.7912]}    {[    2.0318]}    {[    2.0318]}    {[   0.88372]}    {[    12.788]}    {[    1.9983]}    {[    12.833]}    {[    2.3549]}    {[    13.938]}    {[    2.4064]}    {[    11.781]}
% %     {'TXTL_NTP_RNAP_1?'}    {[    19.028]}    {[    19.028]}    {[    19.028]}    {[    19.028]}    {[    19.028]}    {[    19.028]}    {[    19.028]}    {[    19.028]}    {[    19.028]}    {[    19.028]}    {[    19.028]}
% %     {'TXTL_NTP_RNAP_1_F'}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}
% %     {'TXTL_NTP_RNAP_2?'}    {[ 1.199e+06]}    {[ 1.199e+06]}    {[ 1.199e+06]}    {[ 1.199e+06]}    {[ 1.199e+06]}    {[ 1.199e+06]}    {[ 1.199e+06]}    {[ 1.199e+06]}    {[ 1.199e+06]}    {[ 1.199e+06]}    {[ 1.199e+06]}
% %     {'TXTL_NTP_RNAP_2_F'}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}
% %     {'TXTL_RNAdeg_Kd'   }    {[3.6914e+06]}    {[3.9186e+06]}    {[3.9186e+06]}    {[3.4736e+06]}    {[6.1102e+06]}    {[3.5435e+06]}    {[6.1087e+06]}    {[3.5501e+06]}    {[7.0911e+06]}    {[3.5231e+06]}    {[6.5277e+06]}
% %     {'TXTL_RNAdeg_F'    }    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}
% %     {'TXTL_RNAdeg_kc'   }    {[  0.087664]}    {[   0.09806]}    {[   0.09806]}    {[  0.093879]}    {[  0.091254]}    {[   0.11242]}    {[  0.091866]}    {[  0.077476]}    {[   0.11458]}    {[  0.084382]}    {[   0.12583]}
% %     {'RNAP'             }    {[    4.7367]}    {[    4.7254]}    {[    4.7254]}    {[    4.2299]}    {[    4.2378]}    {[    4.5568]}    {[    4.2392]}    {[    4.8117]}    {[    4.6431]}    {[    4.7917]}    {[    4.6301]}
% %     {'RNase'            }    {[     30269]}    {[     28696]}    {[     28696]}    {[     26578]}    {[     48080]}    {[     22638]}    {[     47747]}    {[     32929]}    {[     44407]}    {[     29996]}    {[     37215]}
% %     {'TL_elong_glob'    }    {[    23.826]}    {[    24.126]}    {[    24.126]}    {[    32.116]}    {[    31.859]}    {[    23.903]}    {[    31.847]}    {[    22.626]}    {[     28.76]}    {[    23.202]}    {[    29.238]}
% %     {'TXTL_PROT_deGFP?'}    {[ 0.0023001]}    {[ 0.0023001]}    {[ 0.0023001]}    {[ 0.0023001]}    {[ 0.0023001]}    {[ 0.0023001]}    {[ 0.0023001]}    {[ 0.0023001]}    {[ 0.0023001]}    {[ 0.0023001]}    {[ 0.0023001]}
% %     {'TXTL_UTR_UTR1_Kd' }    {[    64.705]}    {[    48.727]}    {[    48.727]}    {[   0.18149]}    {[    321.92]}    {[     68.39]}    {[    318.58]}    {[    96.745]}    {[    164.79]}    {[    102.31]}    {[    237.12]}
% %     {'TXTL_UTR_UTR1_F'  }    {[   0.81873]}    {[   0.81873]}    {[   0.81873]}    {[   0.81873]}    {[   0.81873]}    {[   0.81873]}    {[   0.81873]}    {[   0.81873]}    {[   0.81873]}    {[   0.81873]}    {[   0.81873]}
% %     {'TL_AA_Kd'         }    {[    703.87]}    {[    703.87]}    {[    703.87]}    {[    703.87]}    {[    703.87]}    {[    703.87]}    {[    703.87]}    {[    703.87]}    {[    703.87]}    {[    703.87]}    {[    703.87]}
% %     {'TL_AA_F'          }    {[   0.74082]}    {[   0.74082]}    {[   0.74082]}    {[   0.74082]}    {[   0.74082]}    {[   0.74082]}    {[   0.74082]}    {[   0.74082]}    {[   0.74082]}    {[   0.74082]}    {[   0.74082]}
% %     {'TL_AGTP_Kd'       }    {[2.0007e+06]}    {[2.0007e+06]}    {[2.0007e+06]}    {[2.0007e+06]}    {[2.0007e+06]}    {[2.0007e+06]}    {[2.0007e+06]}    {[2.0007e+06]}    {[2.0007e+06]}    {[2.0007e+06]}    {[2.0007e+06]}
% %     {'TL_AGTP_F'        }    {[   0.30119]}    {[   0.30119]}    {[   0.30119]}    {[   0.30119]}    {[   0.30119]}    {[   0.30119]}    {[   0.30119]}    {[   0.30119]}    {[   0.30119]}    {[   0.30119]}    {[   0.30119]}
% %     {'TXTL_RIBOBOUND_?'}    {[    12.984]}    {[    13.187]}    {[    13.187]}    {[    12.258]}    {[    9.8229]}    {[    13.033]}    {[    9.8249]}    {[    14.125]}    {[    11.325]}    {[    13.825]}    {[    11.174]}
% %     {'Ribo'             }    {[    266.42]}    {[    269.44]}    {[    269.44]}    {[    85.711]}    {[    188.34]}    {[     326.1]}    {[    189.73]}    {[    237.97]}    {[    170.95]}    {[    245.82]}    {[    187.35]}
% % 
% %   Columns 13 through 23
% % 
% %     {[    13.051]}    {[    12.471]}    {[    13.555]}    {[    13.507]}    {[     12.33]}    {[    13.487]}    {[    12.133]}    {[    12.755]}    {[    13.756]}    {[    12.328]}    {[    12.702]}
% %     {[    7218.6]}    {[    7331.5]}    {[    7250.3]}    {[    7282.3]}    {[    6978.6]}    {[      6603]}    {[      6922]}    {[    6755.7]}    {[    7353.6]}    {[    6987.1]}    {[    6750.2]}
% %     {[5.2951e-05]}    {[ 5.026e-05]}    {[5.2819e-05]}    {[5.2961e-05]}    {[4.6252e-05]}    {[4.2757e-05]}    {[ 4.611e-05]}    {[  4.62e-05]}    {[5.2669e-05]}    {[4.5805e-05]}    {[4.5873e-05]}
% %     {[      0.02]}    {[      0.02]}    {[      0.02]}    {[      0.02]}    {[      0.02]}    {[      0.02]}    {[      0.02]}    {[      0.02]}    {[      0.02]}    {[      0.02]}    {[      0.02]}
% %     {[8.6375e+05]}    {[8.5184e+05]}    {[9.0272e+05]}    {[ 9.066e+05]}    {[9.8019e+05]}    {[9.0494e+05]}    {[9.4569e+05]}    {[1.0384e+06]}    {[9.7884e+05]}    {[1.0189e+06]}    {[1.0347e+06]}
% %     {[    4.4817]}    {[    4.4817]}    {[    4.4817]}    {[    4.4817]}    {[    4.4817]}    {[    4.4817]}    {[    4.4817]}    {[    4.4817]}    {[    4.4817]}    {[    4.4817]}    {[    4.4817]}
% %     {[    205.98]}    {[    20.765]}    {[    167.13]}    {[    187.79]}    {[    1.7233]}    {[    2.6307]}    {[    1.7048]}    {[   0.16025]}    {[     255.5]}    {[    2.1276]}    {[   0.18543]}
% %     {[    19.028]}    {[    19.028]}    {[    19.028]}    {[    19.028]}    {[    19.028]}    {[    19.028]}    {[    19.028]}    {[    19.028]}    {[    19.028]}    {[    19.028]}    {[    19.028]}
% %     {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}
% %     {[ 1.199e+06]}    {[ 1.199e+06]}    {[ 1.199e+06]}    {[ 1.199e+06]}    {[ 1.199e+06]}    {[ 1.199e+06]}    {[ 1.199e+06]}    {[ 1.199e+06]}    {[ 1.199e+06]}    {[ 1.199e+06]}    {[ 1.199e+06]}
% %     {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}
% %     {[7.0969e+06]}    {[6.0127e+06]}    {[7.3912e+06]}    {[7.6243e+06]}    {[6.8761e+06]}    {[5.7897e+06]}    {[7.2424e+06]}    {[5.3446e+06]}    {[3.8807e+06]}    {[7.8114e+06]}    {[5.4966e+06]}
% %     {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}    {[         1]}
% %     {[   0.16614]}    {[   0.16322]}    {[  0.099666]}    {[  0.094168]}    {[   0.27532]}    {[   0.14506]}    {[   0.32657]}    {[   0.14957]}    {[   0.12586]}    {[   0.31441]}    {[   0.16743]}
% %     {[     4.431]}    {[    4.5447]}    {[     4.302]}    {[    4.3137]}    {[     4.895]}    {[    4.3026]}    {[     4.972]}    {[    4.9443]}    {[     4.243]}    {[    4.9024]}    {[    4.9647]}
% %     {[     30566]}    {[     26414]}    {[     53279]}    {[     58181]}    {[     17842]}    {[     28552]}    {[     15837]}    {[     25562]}    {[     22118]}    {[     17741]}    {[     23474]}
% %     {[    31.286]}    {[    28.316]}    {[    32.941]}    {[    33.235]}    {[    33.035]}    {[    34.936]}    {[    32.839]}    {[    22.401]}    {[    22.766]}    {[    34.885]}    {[    22.591]}
% %     {[ 0.0023001]}    {[ 0.0023001]}    {[ 0.0023001]}    {[ 0.0023001]}    {[ 0.0023001]}    {[ 0.0023001]}    {[ 0.0023001]}    {[ 0.0023001]}    {[ 0.0023001]}    {[ 0.0023001]}    {[ 0.0023001]}
% %     {[  0.088277]}    {[    522.42]}    {[    0.2516]}    {[    0.1364]}    {[     64911]}    {[    586.45]}    {[     88139]}    {[     29455]}    {[    383.51]}    {[1.4636e+05]}    {[     28031]}
% %     {[   0.81873]}    {[   0.81873]}    {[   0.81873]}    {[   0.81873]}    {[   0.81873]}    {[   0.81873]}    {[   0.81873]}    {[   0.81873]}    {[   0.81873]}    {[   0.81873]}    {[   0.81873]}
% %     {[    703.87]}    {[    703.87]}    {[    703.87]}    {[    703.87]}    {[    703.87]}    {[    703.87]}    {[    703.87]}    {[    703.87]}    {[    703.87]}    {[    703.87]}    {[    703.87]}
% %     {[   0.74082]}    {[   0.74082]}    {[   0.74082]}    {[   0.74082]}    {[   0.74082]}    {[   0.74082]}    {[   0.74082]}    {[   0.74082]}    {[   0.74082]}    {[   0.74082]}    {[   0.74082]}
% %     {[2.0007e+06]}    {[2.0007e+06]}    {[2.0007e+06]}    {[2.0007e+06]}    {[2.0007e+06]}    {[2.0007e+06]}    {[2.0007e+06]}    {[2.0007e+06]}    {[2.0007e+06]}    {[2.0007e+06]}    {[2.0007e+06]}
% %     {[   0.30119]}    {[   0.30119]}    {[   0.30119]}    {[   0.30119]}    {[   0.30119]}    {[   0.30119]}    {[   0.30119]}    {[   0.30119]}    {[   0.30119]}    {[   0.30119]}    {[   0.30119]}
% %     {[    10.089]}    {[     10.86]}    {[    9.6256]}    {[    9.5204]}    {[    10.734]}    {[    9.6951]}    {[    10.997]}    {[    13.967]}    {[    13.917]}    {[    10.413]}    {[     14.08]}
% %     {[    514.19]}    {[    241.43]}    {[    519.82]}    {[    485.22]}    {[    127.07]}    {[    499.07]}    {[    123.87]}    {[    465.75]}    {[    280.68]}    {[    144.62]}    {[    423.23]}
% %     
% %     
% %% 
% %%
% %%
% %% SECOND SLICE OF THE PARAMETER MANIFOLD %%
% 
% % HERE WE TRY TO INTERPRET THE PARAMETER SETS, and we do the slicing in a
% % stepwise manner
