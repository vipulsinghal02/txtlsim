%% VNPRL fitting
% Vipul Singhal, California Institute of Technology
% 2018
% 
% We set up the estimation of the data from the PRL paper: 
% Karzbrun, Eyal, Jonghyeon Shin, Roy H. Bar-Ziv, and Vincent Noireaux. 
% "Coarse-Grained Dynamics of Protein Synthesis in a Cell-Free System." 
% Physical Review Letters 106, no. 4 (January 24, 2011): 48104. 
% https://doi.org/10.1103/PhysRevLett.106.048104.
% 
% This mcmc has two linked estimation problems: 
% 1) transcription estimation 
% 2) RNA degradation 
% 
% There is a second file in this series, mcmc_info_vnprl2011_protein,
% that tries to fit the protein data, with the mRNA parameters fixed to
% a few values found in this estimation. 
% 
% Finally there is a third file in this series that starts from all the
% parameters estimated in both the first and second estimations, and
% tries to fit all the parameters to all the data simultaneously. 
%
% It is not exactly the data from this paper, instead uses a modification
% of the data from ACS DSG 2014. 
% Some of the main conclusions of that paper were: 
% - Transcriptional Elongation rate: 1 ntp/s
% - Translational Elongation rate: >4 aa/s
% - mRNA exponential decay, even when purified RNA is in excess of 200nM
% - mRNA degradation half life: 10 - 14 min
% - 30nM RNAP conc
% - 1.5nM RNAP - promoter Kd
% - Protein production linear in mRNA (TL machinery not saturated)
% - 1uM protein in 1h, And anywhere between 3 to 10 uM by the end (5 ish
% hours)
% - dp/dt|max is about 30 to 40 nM / min for proteins
% - For 30 nM of DNA, mRNA steady state is 20 - 30 nM. 
% 
% The estimation uses the following fits: 
% - mrna data from ACS DSG with the conc values all divided by 10 (the
% original values in that paper seem unlikey, since they would use too many
% nucleotides. 
% - the rna degradation values just basically are exactly the same as in 
% the ACS paper 
% 
% We do the protein estimation in the file proj_VNPRL_protein.m


%% initialize the directory where things are stored.
[tstamp, projdir, st] = project_init;
% data_init

%% data_info struct. 
di = data_VNPRL2011;
da1 =  squeeze(di(1).dataArray);
da2 =  squeeze(di(2).dataArray);
ntrej = 30;
figure

subplot(2, 2,2) % MGa
tv1hrs = di(1).timeVector(1:end-ntrej)/3600;
mga1 = squeeze(da1(1:end-ntrej,1,:));
plot(tv1hrs, mga1);
xlabel('hours')
ylabel('MGa, nM')
title('MG aptamer/10, ACS DSG 2014')

subplot(2, 2,1) % dgfp post interp 
dgfp1 = diff(squeeze(da1(1:end-ntrej+1,2,:)))...
        ./...
        diff(di(1).timeVector(1:end-ntrej+1));
plot(tv1hrs,dgfp1);
xlabel('hours')
ylabel('dgfp/dt, nM/s')
title('dgfp/dt, post interpolation')

subplot(2, 2,3) % dgfp pre interp
tv2hrs = di(2).timeVector(1:end-ntrej)/3600;
dgfp2 = da2((1:end-ntrej),:);

plot(tv2hrs,dgfp2);
xlabel('hours')
ylabel('dgfp/dt, nM/s')
title('dgfp/dt, pre interpolation')


subplot(2, 2,4) % gfp
gfp = squeeze(da1(1:end-ntrej,2,:));
plot(tv2hrs, gfp);
xlabel('hours')
ylabel('GFP, nM')
title('GFP/1.8, ACS DSG 2014')

close all
%% repopulate the data info structs' data array and time vector with these 
% truncated-in-time data sets. (truncated to show only the data before 10
% hours)
da1 = di(1).dataArray;
da2 = di(2).dataArray;
tv1 = di(1).timeVector;
tv2 = di(2).timeVector; 

ix1 = tv1<10*3600;
tv1 = tv1(ix1);
da1 = da1(ix1, :, :, :);
di(1).dataArray = da1;
di(1).timeVector = tv1;

ix2 = tv2<10*3600;
tv2 = tv2(ix2);
da2 = da2(ix2, :, :, :);
di(2).dataArray = da2;
di(2).timeVector = tv2;


%% construct simbiology model object(s)
mobj = model_dsg2014; % use the same model as dsg2014. (this is just 
% the basic constitutive production model)

%% %% setup the mcmc_info struct - capture all the mcmc information 
% except the data and the model. 
mcmc_info = mcmc_info_vnprl2011_mrna(mobj);
ri = mcmc_info.runsim_info;
mai = mcmc_info.master_info;

%% set up the MCMC estimation
% mcmc20180225_220513_ID3
 marray = mcmc_get_walkers({'20180225_220513'}, {3}, projdir);
% marray_cut = mcmc_cut(marray, (1:10), flipud((mai.paramRanges)'));
% if size(marray_cut, 2) < ri.nW
%     error('too few initial points');
% elseif size(marray_cut, 2) > ri.nW
%     marray_cut = marray_cut(:,1:ri.nW, :);
% end
%%


mi = mcmc_runsim_v2(tstamp, projdir, di, mcmc_info,...
    'UserInitialize', marray(:,:,end));
% 'UserInitialize', marray_cut(:,:,end)
%'InitialDistribution', 'gaussian' 'UserInitialize', marray_cut(:,:,end)); 







