% Generate the IFFL figs (figure 5, and associated Supp files)
% 
% saveFinalFigs = [pwd '\']
saveFinalFigs = 'D:\Dropbox\Documents\a_Journal_Papers\Drafts\txtl_bmc_bioinformatics\figs\may2020_trainingF'
saveFinalFigs = [saveFinalFigs '\']
finafigmode = true

trainingEdir = [pwd '\mcmc_simbio\projects\proj_ZSIFFL_trainingF'];
projdir = [pwd '\mcmc_simbio\projects\proj_ZSIFFL_predictionA'];


% the array of parameters with all the fixed parameters and the
% parameters from the training E dataset.
addpath(projdir)
sls = regexp(projdir, '\', 'split');
extrastring = sls{end};
jpgsave = true;
figsave = false;

% Load model, mcmc_info, and data_info.
% construct simbiology model object(s)
mIFFL = model_txtl_lastetIFFL;
% setup the mcmc_info struct
mcmc_info = mcmc_info_ZSIFFL_predictionA(mIFFL);
di = ZachIFFL_testdata('all_trajectories');
ts1 = '20200510_082735_1_1476';
ts2 = '20200511_052714_1_1476';
ts3 = '20200511_052714_2_738';
ts4 = '20200511_052714_3_369';
ts5 = '20200511_052714_4_148';
ts6 = '20200513_222442_1_738';
ts7 = '20200514_165204_1_738';
ts8 = '20200514_183027_1_738';
ts9 = '20200515_023833_1_738';
ts10 = '20200515_052639_1_738';
ts11 = '20200515_184104_1_738';
ts12 = '20200516_062411_1_738';
ts13 = '20200516_175823_1_738';
ts14 = '20200516_183508_1_738';
ts15 = '20200517_054605_1_738';
ts16 = '20200517_072406_1_738';
tstamp = {ts1 ts2 ts3 ts4 ts5 ts6 ts7 ts8 ts9 ts10 ts11 ...
    ts12 ts13 ts14 ts15 ts16};
tstamp = {ts1 ts2 ts3 ts6 ts7 ts8 ts9 ts10 ts11 ...
    ts12 ts13 ts14 ts15 ts16};
nIterID = {1:2 1:10 1:10 1:10 1:10 1:10 1:2 1:5 1:4 1:20 1:5 ...
    1:12 1 1 1:2 1:15};
nIterID = {1:2 1:10 1:10 1:10 1:2 1:5 1:4 1:20 1:5 ...
    1:12 1 1 1:2 1:15};

        
tsToSave = '20190720_124011_1_327'; % DO NOT CHANGE. this is where the prediction data is kept.
load([pwd '\mcmc_simbio\projects\proj_ZSIFFL_predictionA'...
    '\simdata_' tsToSave '\full_variable_set_' tsToSave '.mat'], ...
    'mi',...
    'mcmc_info',  'ri');
data_info = di; % overwrite with new di, with all three trajectories, not just the mean. 
mai = mcmc_info.master_info;
% mi = mcmc_info.model_info
mai.masterVector
marray_full = mcmc_get_walkers(tstamp,nIterID, trainingEdir);
marray = marray_full(:,:,1:end);
clear marray_full
parnames = [...
    {'pol_{Kd, tet}'}           % 7
    {'pol_{Kd, lac}'}           % 21
    {'pol_{term}'}              % 23
    {'Ribo_{term}'}             % 28
    {'pol'}                     % 31
    {'Ribo'}                    % 33
    {'pol_{Kd,las}'}            % 37
    {'plas_{tf, Kd}'}           % 39
    {'plas-pol_{tf, Kd}'}    ]; % 40

%%
mvarray = masterVecArray(marray(2:end,:,:), mai);
%     clear marray
for miID = 1:5 %1:length(mi)%1:
    currmi = mi(miID);
    dvStr = arrayfun(@num2str, currmi.dosedVals, 'UniformOutput', false);
    % titles array: # dose combs x (exp, sim) ==2 x # measured species.
    nms = length(currmi.measuredSpeciesIndex);
    ndc = size(currmi.dosedVals,2); %# dose combinations
    titls_array = cell(ndc, 2, nms);
    currdi = data_info(currmi.dataToMapTo);
    dn = currdi.dosedNames; %usually the last one will be the thing that is changing...
    % can generalize to use all dose info if it becomes needed.
    for msID = 1:nms
        % for each measured species (ms), plot the trajectories over
        % all the doses, for both experiment and simulation
        if iscell(data_info(currmi.dataToMapTo).measuredNames{msID})
            if ischar( data_info(currmi.dataToMapTo).measuredNames{msID}{1})
                ms = data_info(currmi.dataToMapTo).measuredNames{msID}{1};
            else
                error('what is your data type?')
            end
        elseif ischar( data_info(currmi.dataToMapTo).measuredNames{msID})
            ms = data_info(currmi.dataToMapTo).measuredNames{msID};
        else
            error('what is your data type?')
        end
        for dcID = 1:ndc
            dosestr = [];
            for dnID = 1:length(dn)
                dosestr = [dosestr ' ' dn{dnID} ' ' num2str(currdi.dosedVals(dnID, dcID))];
            end
            % dose combination by (exp, sim) by measured species ID
            titls_array{dcID, 1, msID} = ['Exp ' ms dosestr];
            titls_array{dcID, 2, msID} = ['Sim ' ms dosestr];
        end
    end
    titls_array
    samplePoints = ceil(size(mvarray, 3) * [.95, 1]);
    marrayOrd = mvarray(currmi.paramMaps(currmi.orderingIx),:,samplePoints);
    if finafigmode == false
        mcmc_trajectories(currmi.emo, currdi, currmi, marrayOrd,...
            titls_array, {},...
            'SimMode', 'mean', 'separateExpSim', true,'collateDoses', false,...
            'projdir', projdir, 'tstamp', tsToSave,...
            'extrafignamestring', [num2str(miID) ' ' num2str(msID)]);%,'collateDoses', true,
        %     here we plot the individual trajectories for each species.
       
    end
     ms = currmi.measuredSpecies;
    
end



%%
ms = {{'protein deGFP*'}};
NN = 50; % number of trajectories.
da = cell(NN, 1);
idxnotused = cell(NN, 1);
for miID = 1:5
    currmi = mi(miID);
    currdi = data_info(currmi.dataToMapTo);
    tv = currdi.timeVector;
    dose  = currmi.dosedVals';
    if miID == 2
        dose(end, 1) = 0;
    end
    [da{miID}, idxnotused{miID}] = simulatecurves(currmi.emo,marrayOrd(:,:)', NN, dose, tv, ms);
end

%%

%
ylims = {[4, 4, 4, 4, 12];
    2*[4, 4, 4, 4, 12];
    3*[4, 4, 4, 4, 12]};


lengthToPlotArray = [31, 41, 81];
for outercount = 1:length(lengthToPlotArray)
%     outercount = outercount+1;
    lengthToPlot = lengthToPlotArray(outercount);
        
    figure
    ss = get(0, 'screensize');
    set(gcf, 'Position', [ss(3)*(1-1/1.3) ss(4)*(1-1/1.3) ss(3)/3.5 ss(4)/1.1]);
    
    miToUse = [1 2 3 4 5];
    titleArray = {'3OC12';
        'lasR DNA';
        'aTc';
        'tetR DNA';
        'deGFP DNA'};
    
    legends = [{'10uM', '1uM', '.1uM', '10nM', '1nM', '.1nM', '0nM'};
        {'2nM', '1nM', '.5nM', '.25nM', '125pM', '62.5pM', '0pM'};
        {'10uM', '1uM', '.1uM', '10nM', '1nM', '0.1nM', '0nM'};
        {'1nM', '.1nM', '.01nM', '1pM', '.1pM', '10fM', '0fM'};
        {'4nM', '2nM', '1nM', '.5nM', '.25nM', '.125nM', '0nM'}];
    ms = currmi.measuredSpecies;
    mvarray = masterVecArray(marray(2:end,:,:), mai);
    colorz = flipud(parula(length(legends(1, :))+2));
    for count = 1:length(miToUse)  %1:length(mi)%1:
        currmi = mi(miToUse(count));
        currdi = data_info(currmi.dataToMapTo);
        tv = currdi.timeVector;
        dose  = currmi.dosedVals';
        if miToUse(count) == 2
            dose(end, 1) = 0;
        end
        %[da{count}, idxnotused{count}] = simulatecurves(currmi.emo,marrayOrd(:,:)', 30, dose, tv, ms);
        
        subplot(5, 2, (count-1)*2+1)
        for dID = 1:length(legends(count, :))
            plot(tv(1:lengthToPlot)/60, 0.001*mean(currdi.dataArray(1:lengthToPlot, 1, :, dID),3), 'LineWidth', 1.5, 'Color', colorz(dID+2, :))
            hold on
        end
        title([titleArray{count} ' varying (Experiment)'])
        ylabel('deGFP, uM', 'FontSize', 14)
        axis([0 (lengthToPlot-1)*6, 0 ylims{outercount}(count)])
        if count ==length(miToUse)
            xlabel('time, minutes', 'FontSize', 14)
        end
        ax = gca;
        ax.FontSize = 14;
        
        subplot(5, 2, (count-1)*2+2)
        for dID = 1:length(legends(count, :))
            dID;
            plot(tv(1:lengthToPlot)/60, 0.001*mean(da{count}(1:lengthToPlot, 1, :, dID), 3), 'LineWidth', 1.5, 'Color', colorz(dID+2, :))
            hold on
        end
        title([titleArray{count} ' varying (Prediction)'])
        legend(legends(count, :), 'Location', 'NorthWest', 'FontSize', 13)
        legend('boxoff')
        
        %     ylabel('deGFP, nM')
        axis([0 (lengthToPlot-1)*6 0 ylims{outercount}(count)])
        if count ==length(miToUse)
            xlabel('time, minutes', 'FontSize', 14)
        end
        ax = gca;
        ax.FontSize = 14;
    end
    % UNCOMMEENT TO SAVE
	% print([saveFinalFigs 'prediction_traj_N' num2str(NN) '_' num2str((lengthToPlot-1)*6) 'min'],'-djpeg')

        
    figure
    exp_endpoints = zeros(size(legends)); % number of experiments by number of doses.
    sim_endpoints = zeros(size(legends));
    sim_endpointsSD = zeros(size(legends));
    exp_endpointsSD = zeros(size(legends));
    doseArray = zeros(size(legends));
    for i = 1:5
        doseArray(i, :) = data_info(i).dosedVals;
    end
    doseArray(1, end) = 0.1/100; % 30c12
    doseArray(2, end) = 0.0625/4; % lasR dna
    doseArray(3, end) = 0.1/100; % aTc
    doseArray(4, end) = 0.00001/100; % tetR dna
    doseArray(5, end) = 0.125/4; % deGFP dna
    
    
    for count = 1:length(miToUse)
        currmi = mi(miToUse(count));
        currdi = data_info(currmi.dataToMapTo);
        
        % get the experimental data endpoints
        for dID = 1:length(legends(count, :))
            exp_endpoints(count, dID) = ...
                0.001*mean(currdi.dataArray(lengthToPlot, 1, :, dID),3);
            exp_endpointsSD(count, dID) = ...
               std(0.001*currdi.dataArray(lengthToPlot, 1, :, dID),0,3);
            sim_endpoints(count, dID) = ...
                0.001*mean(da{count}(lengthToPlot, 1, :, dID), 3, 'omitnan');
            sim_endpointsSD(count, dID) = ...
                std(0.001*da{count}(lengthToPlot, 1, :, dID),0,  3, 'omitnan');
        end
    end
    
    figure
    ss = get(0, 'screensize');
    set(gcf, 'Position', [ss(3)*(1-1/1.3) ss(4)*(1-1/1.3) ss(3)/2.5 ss(4)/2]);
    
    
    xTickLabels = [{'10', '10^{-1}', '10^{-3}', '0'};
        {'2', '0.5', '0.125', '0'};
        {'10',  '10^{-1}',  '10^{-3}',  '0'};
        {'1', '10^{-2}',  '10^{-4}',  '0'};
        {'4', '1', '2^{-2}',  '0'}];
    titleArray = {'3OC12';
        'lasR DNA';
        'aTc';
        'tetR DNA';
        'deGFP DNA'};
    xLab = {'3OC12, uM';
        'lasR DNA, nM';
        'aTc, uM';
        'tetR DNA, nM';
        'deGFP DNA, nM'};
    
    for count = 1:length(miToUse)
        
        subplot(2, 3, (count+1))
        ax = gca
        ax.XScale = 'log';
        errorbar(doseArray(count, :),...
            exp_endpoints(count, :),...
            exp_endpointsSD(count, :),...
            'LineWidth', 2);
        
        hold on
        
        errorbar(doseArray(count, :), ...
            sim_endpoints(count, :), ...
            sim_endpointsSD(count, :), ...
            'LineWidth', 2)
        ax = gca
        ax.XScale = 'log';
        
        hold on
        if count ==1
            legend('Experiment', 'Prediction', 'Location', 'NorthWest', ...
                'FontSize', 18)
        end
        
        ax = gca
        ax.XTick = fliplr(doseArray(count, 1:2:end));
        ax.XTickLabel = fliplr(xTickLabels(count, :));
        ax.FontSize = 18
        %     title(titleArray{count})
        ylabel('deGFP, uM');
        xlabel(xLab{count});
        
    end
    % UNCOMMEENT TO SAVE
    %print([saveFinalFigs 'prediction_endpoint_N' num2str(NN) '_' num2str((lengthToPlot-1)*6) 'min'],'-djpeg')
end
