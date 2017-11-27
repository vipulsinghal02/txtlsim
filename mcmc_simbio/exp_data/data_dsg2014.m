function [tv , da, dv] = data_dsg2014
% Load the digitized data from DSG and ZT's 2014 Resource loading
%ACS paper, fig 1. 
% just the gfp mgaptamer data. 
%
% - da (data array) is a matlab array of numbers with dimensions of size
% #timepoints x #measured variables x #ICs (aka dose combinations)
% 

[tmg, ymg, ~] = load_ACSDSG2014('MGapt'); % y is ntimepoints x ndoses
[~, ygfp, ~] = load_ACSDSG2014('deGFP');
ygfp = ygfp(:,[2 4 5 6]);
tv = tmg*60;
da = zeros(length(tv), 4, 2);
da(:, :, 1) = ymg; % the mg aptameter data
da(:, :, 2) = ygfp; % the gfp data
da = permute(da, [1, 3, 2]);
dv = [0.5, 2, 5, 20]; % dose vals of the dna in nM
end

