% mcmc analysis for the roj_acs_dsg2014.m

addpath(genpath('/Users/vipulsinghal/Dropbox/Documents/toolbox/txtlsim_vsfork2017/mcmc_simbio/projects/proj_acs_dsg2014'));
mstacked = [];
% acsdsg2014_400nW = {'mcmc20171127_172903_ID1'
%     'mcmc20171127_172903_ID2'
%     'mcmc20171128_130412_ID1'
%     'mcmc20171128_130412_ID2'
%     'mcmc20171128_130412_ID3'
%     'mcmc20171128_130412_ID4'
%     'mcmc20171128_130412_ID5'
%     'mcmc20171128_130412_ID6'
%     'mcmc20171128_130412_ID7'
%     'mcmc20171128_130412_ID8'
%     'mcmc20171128_130412_ID9'
%     'mcmc20171128_130412_ID10'};
% m = catMC(acsdsg2014_400nW);
%   mstacked = [mstacked; m(:,:)'];
%   
% acsdsg2014_250nW={'mcmc20171127_210040_ID1'
%     'mcmc20171127_210040_ID2'
%     'mcmc20171127_210040_ID3'
%     'mcmc20171127_210040_ID4'
%     'mcmc20171129_000406_ID1'
%     'mcmc20171129_000406_ID2'
%     'mcmc20171129_000406_ID3'
%     'mcmc20171129_000406_ID4'
%     'mcmc20171129_000406_ID5'
%     'mcmc20171129_000406_ID6'
%     'mcmc20171129_000406_ID7'
%     'mcmc20171129_000406_ID8'
%     'mcmc20171129_000406_ID9'
%     'mcmc20171129_000406_ID10'
%     'mcmc20171129_000406_ID11'
%     'mcmc20171129_000406_ID12'
%     'mcmc20171129_000406_ID13'
%     'mcmc20171129_000406_ID14'
%     'mcmc20171129_000406_ID15'
%     'mcmc20171129_000406_ID16'
%     'mcmc20171129_000406_ID17'
%     'mcmc20171129_000406_ID18'
%     'mcmc20171129_000406_ID19'
%     'mcmc20171129_000406_ID20'
%     'mcmc20171129_000406_ID21'
%     'mcmc20171129_000406_ID22'};
% m = catMC(acsdsg2014_250nW);
%   mstacked = [mstacked; m(:,:)'];
%   
%   
% acsdsg2014_100nW={'mcmc20171128_093523_ID1'
%     'mcmc20171128_093523_ID2'
%     'mcmc20171128_093523_ID3'
%     'mcmc20171128_093523_ID4'
%     'mcmc20171128_093523_ID5'
%     'mcmc20171128_093523_ID6' };
% 
% m = catMC(acsdsg2014_100nW);
%   mstacked = [mstacked; m(:,:)'];
%   
%   
% acsdsg2014_300nW={'mcmc20171127_213356_ID1'
%     'mcmc20171127_213356_ID2'
%     'mcmc20171127_213356_ID3'
%     'mcmc20171127_213356_ID4'
%     'mcmc20171127_213356_ID5'
%     'mcmc20171127_213356_ID6'
%     'mcmc20171127_213356_ID7'};
% 
% m = catMC(acsdsg2014_300nW);
%   mstacked = [mstacked; m(:,:)'];
%   
%   
% acsdsg2014_200nW= {'mcmc20171128_115920_ID1'
% 'mcmc20171128_115920_ID2'
% 'mcmc20171128_115920_ID3'
% 'mcmc20171128_115920_ID4'
% 'mcmc20171128_115920_ID5'
% 'mcmc20171128_115920_ID6'
% 'mcmc20171128_115920_ID7'
% 'mcmc20171128_115920_ID8'
% 'mcmc20171128_115920_ID9'
% 'mcmc20171128_115920_ID10'
% 'mcmc20171128_115920_ID11'
% 'mcmc20171128_115920_ID12'
% 'mcmc20171128_115920_ID13'
% 'mcmc20171128_115920_ID14'
% 'mcmc20171128_115920_ID15'
% 'mcmc20171128_115920_ID16'
% 'mcmc20171128_115920_ID17'};

% m = catMC(acsdsg2014_200nW);
%   mstacked = [mstacked; m(:,:)']; % result: mstacked is tall 
%

    acsdsg2014_250nW={'mcmc20171129_000406_ID21'
    'mcmc20171129_000406_ID22'};


m = catMC(acsdsg2014_250nW);
  mstacked = [m(:,:)'];


close all
legendz = {'tx', 'tl', 'atp \tau', 'atp \delta', 'matur', 'utr1Kd', 'P70Kd', ...
    'txterm', 'ntpKd1', 'ntpKd2', 'AAKd', 'TLatpKd', 'tlterm', 'rnaseKd',...
    'RNAP', 'RIBO', 'RNASE'};

%%
close all
%  plotChains(m(1:8, 1:2:end, :), 40, legendz(1:8 ));
%  plotChains(m(9:17, 1:2:end, :), 40, legendz(9:17 ));
%   plotChains(m(1:16, 1:2:end, :), 100, legendz(1:16));


%  %% Plot the MCMC posterior distributions
% figure
% ecornerplot_vse(mstacked(1:10:end,:),'scatter', true,...
%     'transparency',0.1,...
%     'color',[.6 .35 .3], 'names', legendz);
% %%
% figure
% ecornerplot_vse(mstacked(1:10:end,:),...
%     'ess', 80,...
%     'color',[.6 .35 .3],...
%     'names', legendz);

%%
da1 = permute(da, [1, 3, 2]);

dataspec = reshape(da1, length(tv)*length(mi.dosedvals),...
    length(mi.measuredspecies));

%%


dosingStrat = struct('species', mi.dosednames,...
    'concentrations', {mi.dosedvals});
addpath(genpath(...
    ['/Users/vipulsinghal/Dropbox/Documents/toolbox/'...
    'txtlsim_vsfork2017/mcmc_simbio/projects/proj_acs_dsg2014']));
load full_variable_set_20171128_130412
% 
fig = plotEstimTraces_ver201711(m,em,tv, dataspec,...
   dosingStrat , mi.measuredspecies, 'Visible','on');

load gong.mat;
sound(y);
