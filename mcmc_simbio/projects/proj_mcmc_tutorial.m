%% Tutorial file for the mcmc_simbio package
% proj_mcmc_tutorial.m - Basic toturial of the mcmc_simbio package
% demonstrating the estimation of parameters for a constitutive gene
% expression circuit modeled as a single enzymatic reaction. 

%% Initializing the toolbox
% If you have not already initializes the txtlsim and mcmc_simbio
% toolboxes, initialize them by running the txtl_init and mcmc_init
% commands in the command line. You need your working directory to be the
% main directory where the txtlsim toolbox is stored (i.e., the directory
% in which directories like core, components, mcmc_simbio etc are stored). 

%% Run project_init to create a folder where the results of the simulation will be stored. 
[tstamp, projdir, st] = project_init;

%% Define the MATLAB Simbiology model 
% We use the file model_protein3.m to define a constitutive gene expression 
% model using a single enzymatic step. The reactions and species that it
% sets up are: 
% 
% dG + pol <-> dG_pol  (k_f, k_r) 
% dG_pol -> dG + pol + pG (kc) 
% 
% 
mobj = model_protein3;

% The species of the model can be visualized as follows: 
mobj.species

% The reactions may be visualized as
mobj.reactions
% For more on MATLAB Simbiology, see the Simbiology 
% <https://www.mathworks.com/help/simbio/gs/simbiology-command-line-tutorial.html reference> page. 

%% Defining the experiment / model arrangement. 
% We can define the experimental setup and how it related to data, the
% Simbiology model and the estimation problem using what we call an
% mcmc_info struct. For this example, we will be using an
% mcmc_info_constgfp3i.m file to generate the mcmc_info struct that we need
% to define our parameter inference problem. 

mcmc_info = mcmc_info_constgfp3i(mobj);

%% Creating artificial data to fit the model to. 
% Instead of using real data, we will create artificial data for
% demonstration purposes. We will use the data_artificial_v2 fucntion to do
% this. 

% Get the model_info struct needed to generate the artificial data 
mi = mcmc_info.model_info; 

% A list of nominal parameter values to use to generate the data. 
rkfdG = 5; % nM-1s-1
rkrdG = 300; % s-1
rkcp1 = 0.012; %s-1
cpol1 = 100; % nM

% Arrange the parameters in a log transformed vector. 
masterVector = log([rkfdG 
                    rkrdG
                    rkcp
                    cpol]);

% Supply the experimental setup information to the data_artificial_v2 
% function so that it can generate the data_info struct that contains the 
% artificial data. 

di = data_artificial_v2({mobj}, {0:180:7200}, {mi.measuredSpecies}, ...
    {mi.dosedNames}, {mi.dosedVals}, {mi.namesUnord},...
    {exp(masterVector), [exp(masterVector(1:end-2)); 0.024; 200]});

da_extract1 = di(1).dataArray;
da_extract2 = di(2).dataArray;
tv = di(1).timeVector;

mcmc_trajectories([], di, [], [], [], [], 'just_data_info', true);


%     Run the MCMC 
ri = mcmc_info.runsim_info;
mai = mcmc_info.master_info;

% marray = mcmc_get_walkers({'20180311_223247'}, {10}, projdir);
% marray_cut = mcmc_cut(marray, (1:10), flipud((mai.paramRanges)'));
% if size(marray_cut, 2) < ri.nW
%     error('too few initial points');
% elseif size(marray_cut, 2) > ri.nW
%     marray_cut = marray_cut(:,1:ri.nW, :);
% end
%%

mi1 = mcmc_runsim_v2(tstamp1, projdir, di(1), mcmc_info,...
   'InitialDistribution', 'LHS'); % 'InitialDistribution', 'gaussian'
%  'UserInitialize', marray_cut(:,:,end)

%%  plot stuff 
tstamptouse = tstamp1; %'20180311_223247';
marray = mcmc_get_walkers({tstamptouse}, {1:ri.nIter}, projdir);
mcmc_plot(marray, mai.estNames, 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse);
% mcmc_plot(marray, mi1.namesUnord,'ks', true, 'scatter', false);
% mcmc_plot(marray, mi1.namesUnord,'transparency', 0.05);
titls = {'dna 10'; 'dna 30';'dna 60'};
lgds = {};
mvarray1 = masterVecArray(marray, mai);
marrayOrd = mvarray1(mi1.paramMaps(mi1.orderingIx, 1),:,:);
fhandle = mcmc_trajectories(mi1.emo, di(1), mi1, marrayOrd, titls, lgds,...
    'SimMode', 'curves', 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse);
%% 3D plot
pToPlot = [2 3 1];
labellist = mai.estNames;
for plotID = 1:size(pToPlot, 1)
    mstacked = marray1(:,:)';
    figure
    XX = mstacked(1:2:end, [pToPlot(plotID,1)]);
    YY = mstacked(1:2:end, [pToPlot(plotID,2)]);
    ZZ = mstacked(1:2:end, [pToPlot(plotID,3)]);
    scatter3(XX,YY,ZZ)
    xlabel(labellist{pToPlot(plotID,1)}, 'FontSize', 20)
    ylabel(labellist{pToPlot(plotID,2)}, 'FontSize', 20)
    zlabel(labellist{pToPlot(plotID,3)}, 'FontSize', 20)
    title('covariation in Extract 1', 'FontSize', 20)
    saveas(gcf, [projdir '/simdata_' tstamp1 '/3dfig_ext1_' num2str(plotID) '_' tstamp1]);
end
    

mi2 = mcmc_runsim_v2(tstamp2, projdir, di(2), mcmc_info,...
   'InitialDistribution', 'LHS'); % 'InitialDistribution', 'gaussian'
%  'UserInitialize', marray_cut(:,:,end)

%%  plot stuff 
tstamptouse = tstamp2; %'20180311_223247';
marray = mcmc_get_walkers({tstamptouse}, {1:ri.nIter}, projdir);
mcmc_plot(marray, mai.estNames, 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse);
% mcmc_plot(marray, mi1.namesUnord,'ks', true, 'scatter', false);
% mcmc_plot(marray, mi1.namesUnord,'transparency', 0.05);
titls = {'dna 10'; 'dna 30';'dna 60'};
lgds = {};
mvarray1 = masterVecArray(marray, mai);
marrayOrd = mvarray2(mi1.paramMaps(mi1.orderingIx, 1),:,:);
fhandle = mcmc_trajectories(mi2.emo, di(2), mi2, marrayOrd, titls, lgds,...
    'SimMode', 'curves', 'savematlabfig', true, 'savejpeg', true,...
    'projdir', projdir, 'tstamp', tstamptouse);
%% 3D plot
pToPlot = [2 3 1];
labellist = mai.estNames;
for plotID = 1:size(pToPlot, 1)
    mstacked = marray2(:,:)';
    figure
    XX = mstacked(1:2:end, [pToPlot(plotID,1)]);
    YY = mstacked(1:2:end, [pToPlot(plotID,2)]);
    ZZ = mstacked(1:2:end, [pToPlot(plotID,3)]);
    scatter3(XX,YY,ZZ)
    xlabel(labellist{pToPlot(plotID,1)}, 'FontSize', 20)
    ylabel(labellist{pToPlot(plotID,2)}, 'FontSize', 20)
    zlabel(labellist{pToPlot(plotID,3)}, 'FontSize', 20)
    title('covariation in Extract 2', 'FontSize', 20)
    saveas(gcf, [projdir '/simdata_' tstamptouse '/3dfig_ext2_' num2str(plotID) '_' tstamptouse]);
end
    
% marray = mcmc_get_walkers({'20180311_224651'}, {10}, projdir);
% marray_cut = mcmc_cut(marray, (1:10), flipud((mai.paramRanges)'));
% if size(marray_cut, 2) < ri.nW
%     error('too few initial points');
% elseif size(marray_cut, 2) > ri.nW
%     marray_cut = marray_cut(:,1:ri.nW, :);
% end

%  Vipul Singhal, 
%  California Institute of Technology
%  2018
