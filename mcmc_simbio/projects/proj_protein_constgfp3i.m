%% MCMC toolbox demo - proj_protein_constgfp3i.m
%
% const gfp 3, artificial data, separate, 2 extracts. Check if the CSPs line up exactly. 
% also do it with and without the kf timescale fixed. 
% Make sure you understand that tradeoff. 
% For these low dimensional sets, try to understand most of the parameter tradeoffs. 
% 
% 
% 
% 
% Vipul Singhal, 
% California Institute of Technology
% 2018

%% initialize the directory where things are stored.
close all
[tstamp, projdir, st] = project_init;

%% We first define the model. This model will be used to generate the data. 
mobj = model_protein3;

%% import data as a 4D matlab array, along with a time vector
% and the associated dosing information
%
% the data array is of dimensions: 
%
% dim 1: has length (#timepoints)
% dim 2: species
% dim 3: replicates
% dim 4: dosing / ICs
% dim 5: extract 
% NOT a dimension, but separate cells containing similar 5D arrays of data
% corresponding to other models. 

% the following fuction actually generates the artificial data. 
tv =  0:10:1000;

[da_extract1] = data_artificial(mobj, mi, tv, 'replicates', round(1), 'params', [100; 20; 10]);

[da_extract2] = data_artificial(mobj, mi, tv, 'replicates', round(1), 'params', [100; 40; 20]);

%% convert this section into a data visualization function. 
figure 

    subplot(1,2,1)
    p11 = plot(tv, mean(da_extract1(:, 1, :, 1), 3), 'LineWidth', 2.5);hold on % dose 1
    p21 = plot(tv, mean(da_extract1(:, 1, :, 2), 3), 'LineWidth', 2.5);hold on % dose 2
    p31 = plot(tv, mean(da_extract1(:, 1, :, 3), 3), 'LineWidth', 2.5);hold on % dose 3
    xlabel('Time, (a.u.)', 'FontSize', 16)
    ylabel('Protein conc, (a.u.)', 'FontSize', 16)
    title('Extract 1, artificial data', 'FontSize', 16)
    axis([0 1000 0 14000])
    subplot(1,2,2)
    p12 = plot(tv, mean(da_extract2(:, 1, :, 1), 3), 'LineWidth', 2.5);hold on
    p22 = plot(tv, mean(da_extract2(:, 1, :, 2), 3), 'LineWidth', 2.5);hold on
    p32 = plot(tv, mean(da_extract2(:, 1, :, 3), 3), 'LineWidth', 2.5);hold on
    title('Extract 2, artificial data', 'FontSize', 16)
    xlabel('Time, (a.u.)', 'FontSize', 16)
    ylabel('Protein conc, (a.u.)', 'FontSize', 16)
    axis([0 1000 0 14000])
    legend({'D_{init} = 1 (a.u.)', 'D_{init} = 2', 'D_{init} = 5'},...
        'FontSize', 14,...
        'Location', 'NorthWest')
    
%% concat data along dimension 5 -- the extract dimension
    
da = zeros([size(da_extract1), 2]) ;
da(:,:,:,:,1) = da_extract1;
da(:,:,:,:,2) = da_extract2;
    
%% difine the ESP CSP map wrt the exported model (ie, which indices of the 
% param vector input into the exported model are ESPs (including species)
% and which are CSPs. 
espix = [2, 3];
cspix = 1;

pmap = {espix, cspix};

nparam = size(da, 5)*length(espix) + length(cspix);


    
%% Set up the MCMC estimation 

% define a set of initial points as gaussian balls around the true
% parameters
npts = mi.nW;
espix = pmap{1};
cspix = pmap{2};
nExt = size(da, 5);


% nparam = nExt*length(espix) + length(cspix);
paramranges = mi.paramranges;

boundz = [repmat(paramranges(espix,:), length(espix),1) ; paramranges(cspix,:)];

paramranges = mi.paramranges;
lhsamp = lhsdesign(npts, nparam);
            lhsamp = lhsamp'; % nparam by npts matrix of LHS points
            
            minit= ...
                lhsamp.*(repmat(boundz(:, 2), 1, npts)-repmat(boundz(:, 1), 1, npts))+...
                repmat(boundz(:, 1), 1, npts);
        
prevtstamp = '20180118_212853';
finalsimID = '4';
load([pwd '/mcmc_simbio/projects/proj_protein_model/simdata_' prevtstamp '/mcmc' prevtstamp '_ID' finalsimID '.mat'], 'm');
minit = m(:,:,end);%[0.95*] + 0.01*(rand(size(m(:,:,end)))-0.5);

% minit = 0.01*randn(nparam, mi.nW)+repmat(log([20;10;40;20;100]), 1, mi.nW);

mcmc_runsim_5(tstamp, projdir, tv,da, em, mi, pmap, 'userinitialize', minit); 

%%
 tstamp_to_use = tstamp; % change this to tstamp of a specific value. 
simdatapath = [pwd '/mcmc_simbio/projects/proj_protein_model/simdata_' tstamp_to_use '/' ]; % 'mcmc' tstamp '_ID' finalsimID '.mat'
%% load the estimated parameter points. 
load([simdatapath 'full_variable_set_' tstamp_to_use]);
load([simdatapath 'mcmc' tstamp_to_use '_ID' num2str(1)], 'm');
%%
mcat = m;
for i = 2:mi.niter
    load([simdatapath 'mcmc' tstamp_to_use '_ID' num2str(i)], 'm');
    mcat = cat(3, mcat, m);
end

mstacked = mcat(:,:)';
%%
legendz = mi.names_ord;
legendz = {'k_{c1}', 'pol_1', 'k_{c2}', 'pol_{2}',...
    'k_r'};
plotChains(mcat(:,1:80:end, 1:4:end), mi.nW, legendz);
%%
figure
ecornerplot_vse(mstacked(1:5:end,:),'scatter', true,...
    'transparency',0.05,...
    'color',[.6 .35 .3], 'names', legendz);


%%
figure
XX = mstacked(1:2:end, [1]);
YY = mstacked(1:2:end, [2]);
ZZ = mstacked(1:2:end, [5]);
scatter3(XX,YY,ZZ)
xlabel('kc1', 'FontSize', 20)
ylabel('pol1', 'FontSize', 20)
zlabel('kr', 'FontSize', 20)
title('covariation in Extract 1', 'FontSize', 20)

%%
figure
XX = mstacked(1:2:end, [3]);
YY = mstacked(1:2:end, [4]);
ZZ = mstacked(1:2:end, [5]);
scatter3(XX,YY,ZZ)
xlabel('kc2', 'FontSize', 20)
ylabel('pol2', 'FontSize', 20)
zlabel('kr', 'FontSize', 20)
title('covariation in Extract 2', 'FontSize', 20)
%%
dosingStrat = struct('species', mi.dosednames,...
    'concentrations', {mi.dosedvals});
%%
addpath(genpath(...
    ['/Users/vipulsinghal/Dropbox/Documents/toolbox/txtlsim_vsfork2017/'...
    'mcmc_simbio/projects/']));

load([simdatapath 'full_variable_set_' tstamp_to_use]);

