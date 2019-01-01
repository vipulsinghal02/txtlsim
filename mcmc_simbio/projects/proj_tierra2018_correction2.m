% correction step 2 for the tierra data test 1 
% (direct aTc correction for calibration via constitutive expression 
% of the ptet promoter. )
%
% Vipul Singhal, Caltech, 2018
%


%% get the ESPs from the calibration experiments (this is the same as in the
% first part of the file: 
% ['/Users/vipulsinghal/Dropbox/Documents/toolbox/txtlsim_vsfork2017'...
% '/mcmc_simbio/projects/proj_tierra2018_correction1.m']
calib_projdir = ...
    ['/Users/vipulsinghal/Dropbox/Documents/toolbox/txtlsim_vsfork2017/'...
    'mcmc_simbio/projects/proj_tierra2018_calibration'];
marraytemp = mcmc_get_walkers({'20181105_112220'}, {1:10}, calib_projdir); 

msz=size(marraytemp)
marraytemp2 = marraytemp(:, :)';
clear marraytemp
msz=size(marraytemp2)

% take the median value for the krdg parameter, 
% and use the index of that value to pick the point to use. 
[sorted_krdg, Ix] = sort(marraytemp2(:,1));
mediansIx = Ix(ceil(length(Ix)/2));
median_fullparam_log = marraytemp2(mediansIx, :)
format short g
median_fullparam = exp(median_fullparam_log)

% Using these, we can pick the ESPs for both the reference and 
% candidate extracts: 
ref_esp_ix = [2,4];
can_esp_ix = [3,5];

ref_esp = median_fullparam(ref_esp_ix);
can_esp = median_fullparam(can_esp_ix);
csp_cutpoint = median_fullparam(1);

%% get the CSPs from correction step 1: 

% use the CSPs such that the krdG value is the closest to the 
% one fixed in the calibration step. 
projdir_corr1 = ['/Users/vipulsinghal/Dropbox/Documents/toolbox/txtlsim_vsfork2017/'...
    'mcmc_simbio/projects/proj_tierra2018_correction1'];
tstamp_corr1 = '20181107_145154'; 
% 10 iterations
num_iter = 10;
load([projdir_corr1 '/simdata_' tstamp_corr1...
    '/full_variable_set_' tstamp_corr1 '.mat']) 
% do this properly, with only the right variables. 

%% correction step 1 runsim info and master info
ri = mcmc_info.runsim_info;
mai = mcmc_info.master_info;

%%
marray_corr1 = mcmc_get_walkers({tstamp_corr1}, {1:num_iter}, projdir_corr1); 
marray_corr1=marray_corr1(:, :, 51:100);
msz=size(marray_corr1) 

%%
% code to use from test015:
mstacked_corr1 = marray_corr1(:,:)';
log(csp_cutpoint)

% the corresponding CSPs are: 
tol = 2; % pretty bad tol.
% ie, the param for csp estimated from the calibration experiment is
% totally off from the set of values used in the correction step. oh well. 
% this does not violate the parameter consistency theorem in any way, but 
% might lead to a future result. 

cc = intersect(find(mstacked_corr1(:, 1)>log(csp_cutpoint)-tol),...
    find(mstacked_corr1(:, 1)<log(csp_cutpoint)+tol));
size(cc)

csp_corr1  = mstacked_corr1(cc(1), :);% I will not use this. I will just sample 
% randomly from the CSP set. 


%% use the corr 1 parameters to generate a prediction. 

% Take 500 samples from the CSP set from correction step 1
npts = 500;
nptstotal = size(mstacked_corr1, 1);
paramid = randperm(nptstotal, npts);
params_to_use_corr = mstacked_corr1(paramid, :);

% Now generate the corrected plots. Use the same code as the one used to
% generate the correction figure in the thesis. 

% use the mcmc_trajectories function to plot the results 
% first one: the candidate extract test data with the 
% model fits. This was already generated in the correction step 1 file
% proj_tierra2018_correction1.m


lgds = {};
mvarray = masterVecArray(marray_corr1, mai);
%
marrayOrd = mvarray(mi(1).paramMaps(mi(1).orderingIx, 1),:,:);
%
di = tierradataset;
di(5).timeVector = di(5).timeVector(1:121);
di(6).timeVector = di(6).timeVector(1:121);
di(5).dataArray = di(5).dataArray(1:121, :,:,:);
di(6).dataArray = di(6).dataArray(1:121, :,:,:);

titls = {'candidate extract (eEC5) aTc 10000';'aTc 1000';'aTc 100';'aTc 10';'aTc 1'};
[fhandle1, da_corrstep1] = mcmc_trajectories(mi(1).emo, di(6), ...
    mi(1), marrayOrd,...
    titls, lgds,...
    'SimMode', 'meanstd', 'ExpMode', 'curves', 'savematlabfig', true,...
    'savejpeg', false,...
    'projdir', projdir_corr1, 'tstamp', tstamp_corr1,...
    'extrafignamestring', '_tierra_corr1_t1_plotscript');

% plot the same but with the reference ESPs instead. 

mobj = model_aTc_induc1;
mcmc_info_espswapped = mcmc_info_tierra2018_corr(mobj, ref_esp, csp_cutpoint);
mai_espswapped = mcmc_info_espswapped.master_info;
mvarray_esp_swapped = masterVecArray(marray_corr1, mai_espswapped);
marrayOrd_espswapped = ...
    mvarray_esp_swapped(mi(1).paramMaps(mi(1).orderingIx, 1),:,:);

%
titls = {'reference extract (eEC4) aTc 10000';'aTc 1000';'aTc 100';'aTc 10';'aTc 1'};

[fhandle2, da_corrstep2] = mcmc_trajectories(mi(1).emo, di(5), ...
    mi(1), marrayOrd_espswapped,...
    titls, lgds,...
    'SimMode', 'meanstd', 'ExpMode', 'curves', 'savematlabfig', true,...
    'savejpeg', false,...
    'projdir', projdir_corr1, 'tstamp', tstamp_corr1,...
    'extrafignamestring', '_tierra_corr2_t1_plotscript');

%%
figure
% 5 groups (5 aTc conc) of 3 bars: 
% bar 1: reference extract
% bar 2: candidate extract
% bar 3: corrected candidate extract
yy = zeros(5, 3);
ee = yy;
timeix = 121;
atclevel = {'10uM', '1uM', '100nM', '10nM', '1nM'}
for i = 1:5
    subplot(1, 5, i)
    yy(i, 1) = mean(di(5).dataArray(timeix, 1, :, i), 3); % reference 
    yy(i, 2) = mean(di(6).dataArray(timeix, 1, :, i), 3); % candidate
    yy(i, 3) = mean(da_corrstep2(timeix, 1, :, i), 3); % corrected to reference
    
    ee(i, 1) = std(di(5).dataArray(timeix, 1, :, i),0, 3)
    ee(i, 2) = std(di(6).dataArray(timeix, 1, :, i),0 , 3); % candidate
    ee(i, 3) = std(da_corrstep2(timeix, 1, :, i),0, 3); % corrected to reference
    bar(1:3, yy(i,:));
    hold on
    errorbar(1:3, yy(i,:),ee(i,:),'c.', 'LineWidth', 3)
    ca = gca
    ca.YLim = [0. 15000]
    hold on
    title(atclevel{i})
    
end
yy
ee
%




%%
mean_velocity = [0.2574, 0.1225, 0.1787]; % mean velocity
std_velocity = [0.3314, 0.2278, 0.2836];  % standard deviation of velocity
figure
hold on
bar(1:3,mean_velocity)
errorbar(1:3,mean_velocity,std_velocity,'.')
%%

% 
% %%%
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% errorpoint =
% 
% %% Correction Demo Figure (same as in the thesis, code modified from 
% % test015_plot_everything.m
% % 
% % Next we create the correction demo figure. This figure is arranged into 3
% % columns and nICs number of rows. Each row corresponds to one dose
% % (initial condition). Within each row, the subplot corresponding to the first
% % column has the test circuit behavior in the two environments of interest, 
% % the candidate environment eSG and the reference environment (eVS). The
% % second column has the same two trajectories, bu in addition has the model
% % fit to the candidate environment data. The third column has the
% % 'corrected' behavior, along with the two data trajectories. 
% 
% envrefID = 1; % can be changed to 2 to generate the correction from 3 to 2. 
% envcandID = 2; 
% 
% envname = {'eEC4', 'eEC5'};
% 
% !replace
% % load(  't015_corr1_20171023_151627_11_MBP', 'tvec', 'nW', 'model_corr',...
% %     'dosevals_corr','dosemap_corr', 'correction_data', 'pmap_corr',...
% %     'nSp_corr', 'idMS_corr' )
% 
% nMS = 1; % nMS = 1 here, since only GFP is measured
% nICs = 5; % ICs, tetR DNA = [0 0.25 0.5 0.75 1 2 5 10] (nM)
% 
% nEnv_total = 2; 
% % the total number of environments for which we have data. 
% nEnv_used = 2; 
% % the number of environments considered to demonstrate the correction procedure.
% nEnv_estimated = 1; 
% % the number of environments on which the parameter estimation was performed. 
% 
% espIX = pmap_corr{1};
% esspIX = pmap_corr{2};
% cspIX = pmap_corr{3};
% 
% nESP = length(espIX); % the ESP indices in the model (not in logpjoint)
% nESSP = length(esspIX);
% % the Env specific species indices in the model (not in logpjoint)
% nCSP = length(cspIX); % the CSP indices in the model (not in logpjoint)
% 
% icvec = zeros(nSp_corr, 1);
% 
% %%
% % we will have 2 sets of simulated trajectories, one for the candidate env
% % and one for the reference. Therefore, the number of environments used is
% % nEnv_used (= 2). 
% simulatedtraj_corrstep1 = zeros(length(tvec(1:13)),nMS, nICs , npts); 
% simulatedtraj_corrstep2 = zeros(length(tvec(1:13)),nMS, nICs , npts);
% 
% simtraj_cs2_cspfix = zeros(length(tvec(1:13)),nMS, nICs , npts);
% %%
% % simulate the correction model for all the randomly picked points from
% % the posterior distribution, fixing the ESPs and ESSPs to the candidate
% % environments values. 
% 
% for kk = 1:npts
%     logpjoint_corr1 = [-0.2821 1.3714 params_to_use_corr(kk, :)];
%     cspindices = ((nESSP + nESP)*nEnv_estimated+1):length(logpjoint_corr1);
%     paramvec = zeros(nESP+nCSP, 1);
%     logpcsp = logpjoint_corr1(cspindices);
%     paramvec(cspIX) = logpcsp;
%     logpesp = logpjoint_corr1(1:nESP);
%     paramvec(espIX) = logpesp;
%     esspindices = (nESP + 1):(nESP+nESSP);
%     
%     % set the values of the initial condition vector to the parameters
%     icvec(esspIX) = exp(logpjoint_corr1(esspindices));
%     
%     for doseID = 1:nICs
%         icvec(dosemap_corr) = dosevals_corr(:, doseID);
%         % simulate the model
%         [~, simudata] = model_corr(paramvec, icvec, tvec(1:13));
%         for msid = 1:nMS
%             simulatedtraj_corrstep1(:,msid,...
%                 doseID, kk) = simudata(:, idMS_corr(msid));
%         end
%     end
% end
% 
% %%
% % Compute the mean and standard deviations for correction step 1
% meanvals_corrstep1 = mean(simulatedtraj_corrstep1, 4); 
% sdvals_corrstep1= std(simulatedtraj_corrstep1,0, 4);
% maxvals_corrstep1 = squeeze(max(max(max(meanvals_corrstep1+sdvals_corrstep1,...
%     [], 1), [], 3), [], 5)); % 1 by nMS array. 
% %%
% % Also, simulate the trajectories in the reference environment. here we
% % randomly mix and match points from the reference environments environment
% % specific parameters and species, and the CSP from correction step 1. 
% 
% refsID = ((envrefID-1)*(nESSP + nESP)+1); % reference ESP start ID
% refeID = (envrefID*(nESSP + nESP)); % reference ESP end ID
% 
% refmedians = calib_arbitrary_point(:, refsID:refeID);
% ref_ESPs_sharedCSPs = common_calib(refsID:refeID);
% 
% %%
% % other option: params_to_use_calib(kk,...
% % ((envrefID-1)*(nESSP + nESP)+1):(envrefID*(nESSP + nESP))), though this is a
% % bit buggy right now
% for kk = 1:npts
%     logpjoint_corrstep2 = [refmedians  params_to_use_corr(kk, :)];
%     cspindices = ((nESSP + nESP)+1):length(logpjoint_corrstep2);
%     paramvec = zeros(nESP+nCSP, 1);
%     logpcsp = logpjoint_corrstep2(cspindices);
%     paramvec(cspIX) = logpcsp;
%         logpesp = logpjoint_corrstep2(1:nESP);
%         paramvec(espIX) = logpesp;
%         esspindices = (nESP + 1):(nESP+nESSP);
%         
%         % set the values of the initial condition vector to the parameters
%         icvec(esspIX) = exp(logpjoint_corrstep2(esspindices));
%         
%         for doseID = 1:nICs
%             icvec(dosemap_corr) = dosevals_corr(:, doseID);
%             
%             % simulate the model
%             [~, simudata] = model_corr(paramvec, icvec, tvec(1:13));
%             for msid = 1:nMS
%                 simulatedtraj_corrstep2(:,msid, doseID, kk) =...
%                     simudata(:, idMS_corr(msid));
%             end
%         end
% end
% 
% % Compute the mean and standard deviations for correction step 1
% meanvals_corrstep2 = mean(simulatedtraj_corrstep2, 4); 
% sdvals_corrstep2= std(simulatedtraj_corrstep2,0, 4);
% maxvals_corrstep2 = squeeze(max(max(max(meanvals_corrstep2+sdvals_corrstep2,...
%     [], 1), [], 3), [], 5)); % 1 by nMS array. 
% 
% %%
% %%
% % other option: params_to_use_calib(kk,...
% % ((envrefID-1)*(nESSP + nESP)+1):(envrefID*(nESSP + nESP))), though this is a
% % bit buggy right now
% for kk = 1:npts
%     logpjoint_corrstep2_cspfix =...
%         [ref_ESPs_sharedCSPs params_to_use_corr(kk, :)];
%     cspindices = ((nESSP + nESP)+1):length(logpjoint_corrstep2_cspfix);
%     paramvec = zeros(nESP+nCSP, 1);
%     logpcsp = logpjoint_corrstep2_cspfix(cspindices);
%     paramvec(cspIX) = logpcsp;
%         logpesp = logpjoint_corrstep2_cspfix(1:nESP);
%         paramvec(espIX) = logpesp;
%         esspindices = (nESP + 1):(nESP+nESSP);
%         
%         % set the values of the initial condition vector to the parameters
%         icvec(esspIX) = exp(logpjoint_corrstep2_cspfix(esspindices));
%         
%         for doseID = 1:nICs
%             icvec(dosemap_corr) = dosevals_corr(:, doseID);
%             
%             % simulate the model
%             [~, simudata] = model_corr(paramvec, icvec, tvec(1:13));
%             for msid = 1:nMS
%                 simtraj_cs2_cspfix(:,msid, doseID, kk) =...
%                     simudata(:, idMS_corr(msid));
%             end
%         end
% end
% 
% % Compute the mean and standard deviations for correction step 1
% meanvals_corrstep2_cs2_cspfix = mean(simtraj_cs2_cspfix, 4); 
% sdvals_corrstep2_cs2_cspfix= std(simtraj_cs2_cspfix,0, 4);
% maxvals_corrstep2_cs2_cspfix =...
%     squeeze(max(max(max(meanvals_corrstep2_cs2_cspfix+...
%     sdvals_corrstep2_cs2_cspfix,...
%     [], 1), [], 3), [], 5)); % 1 by nMS array. 
% 
% % compute the max of the axis jointly for corrstep 1 and 2. 
% maxvals_corr = max([maxvals_corrstep1; maxvals_corrstep2;...
%     maxvals_corrstep2_cs2_cspfix], [], 1);
% 
% %%
% % Inialize arrays for handles to the graphics objects. 
% lineStyles = linspecer(2*nICs,'sequential');
% hd_cand = zeros(nICs, 4); % data trajectory handles for candidate environment
% hd_ref = zeros(nICs, 4); % data trajectory handles for reference environment
% hm_cand = zeros(nICs, 1); % model fit mean trajectory handles
% hsd_cand = zeros(nICs, 1); % model fit sd trajectory handles (patch objects)
% hm_ref = zeros(nICs, 1); % model prediction mean trajectory handles
% hsd_ref = zeros(nICs, 1); % model prediction sd trajectory handles (patch objects)
% 
% %% 
% % create the 3 column subplot
% nMS = 1
% tvec = di(5).timeVector;
% 
% nICs = 5;
% for msid = 1:nMS
%     maxvals_corr(msid) = 10000;
%     figure
%     ss = get(0, 'screensize');
%     set(gcf, 'Position', [50 100 ss(3)/1.6 ss(4)/1.4]);
%     
% % for each initial condition row
%     for i = 1:nICs
%         % column 1: just the experimental data
%         linearidx = 4*(i-1)+1; 
%         subplot(nICs, 4,linearidx);
%         
%         % reference extract test data
%         hd_ref(i, 1)=plot(tvec/3600,...
%             mean(di(5).dataArray(1:length(tvec), msid, :, i), 3), ...
%             'color',lineStyles(i, :) ,'linewidth',0.8);
%         hold on
%         
%         % candidate extract test data
%         hd_cand(i, 1)=plot(tvec/3600,...
%             mean(di(6).dataArray(1:length(tvec), msid, :, i), 3), ...
%             'color',lineStyles(nICs+i, :) ,'linewidth',0.8);
%         
%         
%         hold on
%         set(gca, 'Ylim', [0, 12000]);% do manually % round(maxvals_corr(msid))
%         set(gca, 'Xlim', [0, 12]) ; % 12 hours?
%         title(sprintf('Experimental data, aTc = %0.2g',...
%             mi.dosedVals(3, i)), 'FontSize', 12)
%         xlabel('time, hours')
%         ylabel('GFP, au')
%         legend([hd_ref(i, 1), hd_cand(i, 1)], ...
%             {'Reference Extract', 'Candidate Extract'}, 'Location', 'NorthWest')
%         
%         % column 2: overlay correction step 1 fit (CSP estimation)
%         linearidx = 4*(i-1)+2;
%         subplot(nICs, 4,linearidx);
%         
%         % redo reference extract test data
%         hd_ref(i, 2)=plot(tvec/3600,...
%             mean(di(5).dataArray(1:length(tvec), msid, :, i), 3), ...
%             'color',lineStyles(i, :) ,'linewidth',0.8);
%         hold on
%         % redo candidate extract test data
%         hd_cand(i, 2)=plot(tvec/3600,...
%             mean(di(6).dataArray(1:length(tvec), msid, :, i), 3), ...
%             'color',lineStyles(nICs+i, :) ,'linewidth',0.8);
%       !
%         hold on
%         [hm_cand(i), hsd_cand(i)] = boundedline(tvec/3600,...
%            meanvals_corrstep1(:, msid, i, 1), sdvals_corrstep1(:, msid, i, 1));
%         set(hsd_cand(i), 'FaceColor', lineStyles(nICs+i, :).^4, 'FaceAlpha', 0.1);
%         set(hm_cand(i), 'Color', lineStyles(nICs+i, :).^4, 'LineStyle', ':');
%         hold on
%         set(hm_cand(i), 'LineWidth', 1)
%         set(gca, 'Ylim', [0, round(maxvals_corr(msid))])
%         set(gca, 'Xlim', [0, 1.6])
%         title(sprintf('Correction Step 1, tetR DNA = %0.2g',...
%             dosevals_corr(2, i)), 'FontSize', 12)
%         xlabel('time, hours')
%         legend([hd_ref(i, 2), hd_cand(i, 2), hm_cand(i)], ...
%             {'Reference Extract', 'Candidate Extract', 'Model Fit (mean, sd)'},...
%             'Location', 'NorthWest')
% %         ylabel('GFP, nM')
%         
%         % column 3: overlay correction step 2 prediction istead of
%         % correction step 1 fit. ("corrected behavior")
%         linearidx = 4*(i-1)+3;
%         subplot(nICs, 4,linearidx);
%         hd_ref(i, 3)=plot(tvec(1:13)/3600,...
%             1000*correction_data(1:13,msid, i, envrefID),...
%             'color',lineStyles(i, :) ,'linewidth',0.8);
%         hold on
%         hd_cand(i, 3)=plot(tvec(1:13)/3600,...
%             1000*correction_data(1:13,msid, i,envcandID ),...
%             'color',lineStyles(nICs+i, :) ,'linewidth',0.8);
%         hold on
%         [hm_ref1(i), hsd_ref1(i)] = boundedline(tvec(1:13)/3600,...
%             meanvals_corrstep2(:, msid, i, 1), sdvals_corrstep2(:, msid, i, 1));
%         set(hsd_ref1(i), 'FaceColor', lineStyles(i, :).^4, 'FaceAlpha', 0.1);
%         set(hm_ref1(i), 'Color', lineStyles(i, :).^4, 'LineStyle', ':');
%         hold on
%         set(hm_ref1(i), 'LineWidth', 1)
%         set(gca, 'Ylim', [0, round(maxvals_corr(msid))])
%         set(gca, 'Xlim', [0, 1.6])
%         title(sprintf('Correction Step 2, tetR DNA = %0.2g',...
%             dosevals_corr(2, i)), 'FontSize', 12)
%         xlabel('time, hours')
%         legend([hd_ref(i, 3), hd_cand(i, 3), hm_ref1(i)],...
%             {'Reference Extract', 'Candidate Extract', ...
%             '''Corrected'' Trajectories (mean, sd)'}, 'Location', 'NorthWest')
% %         ylabel('GFP, nM')   
% 
% 
%         % column 4: overlay correction step 2 prediction instead of
%         % correction step 1 fit. ("corrected behavior") WITH CSP FIXING
%         linearidx = 4*(i-1)+4;
%         subplot(nICs, 4,linearidx);
%         
%         % reference experimental data
%         hd_ref(i, 4)=plot(tvec(1:13)/3600,...
%             1000*correction_data(1:13,msid, i, envrefID),...
%             'color',lineStyles(i, :) ,'linewidth',0.8);
%         hold on
%         
%         % candidate experimental data
%         hd_cand(i, 4)=plot(tvec(1:13)/3600,...
%             1000*correction_data(1:13,msid, i,envcandID ),...
%             'color',lineStyles(nICs+i, :) ,'linewidth',0.8);
%         hold on
%         
%         % plot the corrected traj mean and standard deviation (as a matlab
%         % patch class object)
%         [hm_ref2(i), hsd_ref2(i)] = boundedline(tvec(1:13)/3600,...
%             meanvals_corrstep2_cs2_cspfix(:, msid, i, 1), ...
%             sdvals_corrstep2_cs2_cspfix(:, msid, i, 1));
%         set(hsd_ref2(i), 'FaceColor', lineStyles(i, :).^4, 'FaceAlpha', 0.1);
%         set(hm_ref2(i), 'Color', lineStyles(i, :).^4, 'LineStyle', ':');
%         hold on
%         
%         set(hm_ref2(i), 'LineWidth', 1)
%         set(gca, 'Ylim', [0, round(maxvals_corr(msid))])
%         set(gca, 'Xlim', [0, 1.6])
%         
%         title(sprintf('Correction Step 2, tetR DNA = %0.2g',...
%             dosevals_corr(2, i)), 'FontSize', 12)
%         xlabel('time, hours')
%         legend([hd_ref(i, 4), hd_cand(i, 4), hm_ref2(i)],...
%             {'Reference Extract', 'Candidate Extract', ...
%             '''Corrected'' Trajectories (mean, sd)'}, 'Location', 'NorthWest')
% 
% %       % Compute the \% correction 
% %       normorig = norm(1000*correction_data(1:13,msid, i,...
% %           envrefID) - 1000*correction_data(1:13,msid, i,envcandID ))
% %       normreduced = norm(1000*correction_data(1:13,msid, i,...
% %           envrefID) - meanvals_corrstep2(:, msid, i, 1))
% 
%     end
% end
% 
% %% compute the % correction
% nICs = 4;
% normorig = zeros(nICs, 1);
% normreduced = zeros(nICs, 1);
% alpha = zeros(nICs, 1);
% normreduced_cspfix = zeros(nICs, 1);
% alpha_cspfix = zeros(nICs, 1);
% for msid = 1:nMS
% % for each initial condition row
%     for i = 1:nICs
%       % distance between the reference and candidate experimental data. 
%       normorig(i) = norm(1000*correction_data(1:13,msid, i,...
%           envrefID) - 1000*correction_data(1:13,msid, i,envcandID ));
%       
%       % distance between the mean of the 
%       normreduced(i) = norm(1000*correction_data(1:13,msid, i, envrefID)...
%           - meanvals_corrstep2(:, msid, i, 1));
%       
%       normreduced_cspfix(i) = norm(1000*correction_data(1:13,msid, i, envrefID)...
%           - meanvals_corrstep2_cs2_cspfix(:, msid, i, 1));
%       
%       alpha(i) = ...
%           max(sdvals_corrstep2(:, 1, i, 1))/max(sdvals_corrstep1(:, 1, i, 1));
%       
%       alpha_cspfix(i) = ...
%           max(sdvals_corrstep2_cs2_cspfix(:,...
%           1, i, 1))/max(sdvals_corrstep1(:, 1, i, 1));
%       % One idea of defining the metric could be to weight the correction
%       % by the standard deviation somehow. see the notability note: 
%       % Note Apr 1, 2018 April-Sep logbook --- aug 10 entry. 
%       
% %       nrm2(i) = ((normorig(i)-normreduced(i))/(normorig(i)));
%         
% %       % infty norm (want the max difference to come down by 2X
% %       normorigi(i) = norm(1000*correction_data(1:13,msid, i, envrefID)...
% % - 1000*correction_data(1:13,msid, i,envcandID ), Inf);
% %       normreducedi(i) = norm(1000*correction_data(1:13,msid, i, envrefID)...
% % - meanvals_corrstep2(:, msid, i, 1), Inf);
% %       nrmi(i) = ((normorigi(i))/(normreducedi(i)));
% %       nrm2i(i) = ((normorigi(i)-normreducedi(i))/(normorigi(i)));
% %       
%     end
% end
% 
% RR11 = sum(normreduced)/sum(normorig);
% RR12 = sum(alpha.*normreduced)/sum(normorig);
% RR13 = sum(normreduced_cspfix)/sum(normorig);
% RR14 = sum(alpha_cspfix.*normreduced_cspfix)/sum(normorig);
% 
% RR21 = sum(normreduced./normorig)/nICs;
% RR22 = sum(alpha.*normreduced./normorig)/nICs;
% RR23 = sum(normreduced_cspfix./normorig)/nICs;
% RR24 = sum(alpha_cspfix.*normreduced_cspfix./normorig)/nICs;
% 
% metricvals = [RR11 RR12 RR13 RR14 RR21 RR22 RR23 RR24]
% 
% 
