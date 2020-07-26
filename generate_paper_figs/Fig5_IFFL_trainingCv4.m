% Generate the IFFL figs (figure 5, and associated Supp files)
% 
% saveFinalFigs = [pwd '\']
saveFinalFigs = 'D:\Dropbox\Documents\a_Journal_Papers\Drafts\txtl_bmc_bioinformatics\figs\trainingC_v4'
saveFinalFigs = [saveFinalFigs '\']
finafigmode = true

trainingEdir = [pwd '\mcmc_simbio\projects\proj_ZSIFFL_trainingC_v4'];
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

ts17 = '20200603_044203_1_2214'; %200, changed to 500 walkers.
ts18 = '20200603_044203_2_1845';%70
ts19 = '20200604_073858_1_1845'; %110

ts20 = '20200604_073858_2_1476'; % 50
ts21 = '20200605_045501_1_1476';
ts22 = '20200605_045501_2_1181'
ts23 = '20200605_045501_3_1033'
ts24 = '20200605_045501_4_886'
ts25 = '20200605_045501_5_738'

tstamp = {ts17 ...
    ts18 ts19 ts20 ts21 ts22 ts23 ts24 ts25};
nIterID = {1:20 1:7 1:20 1:5  1:20  1:20  1:20  1:20 1:14};


tsToSave = '20200525_011005_1_327'; % DO NOT CHANGE. this is where the prediction data is kept.
load([pwd '\mcmc_simbio\projects\proj_ZSIFFL_predictionCv3'...
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
    {'TX_{cat}'}
    {'TL_{cat}'}
    {'\tau_{atp}'}
    {'rep_{Kd, tet}'}
    {'aTc_{Kd}'}
    {'pol_{Kd, lac}'}
    {'pol_{term}'}
    {'Ribo_{term}'}
    {'pol'}
    {'Ribo'}
    {'3OC12_{Kd}'}
    {'pol_{Kd,las}'}
    {'plas_{tf, Kd}'}
    {'plas-pol_{tf, Kd}'}    ];

% 
% 
% marray_thin = marray(:, :, end-300:15:end);
% marray_flat = marray_thin(:,:)';
% 
% 
% parslices = [...
%     {'TX_{cat}'}        {[0 6]}
%     {'TL_{cat}'}        {[0 6]}
%     {'\tau_{atp}'}      {[9.6 9.9]}
%     {'pol_{Kd, tet}'}   {[17 23]}
%     {'rep_{Kd, tet}'}   {[-4 1]}
%     {'aTc_{Kd}'}        {[-10 5]}
%     {'pol_{Kd, lac}'}   {[16 23]}
%     {'pol_{term}'}      {[2 10.5]}
%     {'Ribo_{term}'}     {[2 10]}
%     {'pol'}             {[4 8]}
%     {'Ribo'}            {[2 12]}
%     {'3OC12_{Kd}'}      {[5 16]}
%     {'pol_{Kd,las}'}    {[25 40]}
%     {'plas_{tf, Kd}'}   {[4 8]}
%     {'plas-pol_{tf, Kd}'}    {[3 10]}];
% % pol kd is cartesian with pol term, rnaseKd, rnase cat. BUT NOT POL. 
% % cartesian with  rnaseKd, rnase cat and POL
% cutted_marray = mcmc_cut(marray_flat, 1:15, flipud(cell2mat(parslices(:, 2))'));
% size(cutted_marray)
% 
% %
% % mcmc_plot(cutted_marray(:,:), parnames(:))
% marray = cutted_marray;

%%
mvarray = masterVecArray(marray([1:3 5:15], :,:), mai);
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
        
    set(0,'Units','normalized')
    figure
    set(gcf,'Units', 'normalized')
    set(gcf, 'Position', [0.05, 0.05, 0.2, 0.9])
    
    
    
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
    mvarray = masterVecArray(marray([1:3 5:15],:,:), mai);
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

    set(0,'Units','normalized')
    figure
    set(gcf,'Units', 'normalized')
    set(gcf, 'Position', [0.05, 0.1, 0.35, 0.5])
    
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
