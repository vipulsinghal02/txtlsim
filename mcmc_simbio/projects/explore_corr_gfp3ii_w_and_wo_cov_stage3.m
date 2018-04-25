

%% Actually before we conclude that this is not sufficiently nonidentifiabe to 
% make the variance blow up point, lets try just picking a median point
% from the E2 ESP, and then actually doing a CSP ESTIMATION. I
% think in general that should cause a bad effect. 

% so the flow of this file is: 
% use the const gfp3ii fits to get the ESPs closest to the medians in both
% E1 and E2. Then, fix the E2, and estimate the CSP. 
% Then plug in this CSP and generate the prediction. All of this must be
% done with the data visualization from stage one. 


%% part 1: First we do the median version. See stage 3 file for part 3, which 
% deals with arbitrary points. 

%% Fix ESP medians

%% Estimate CSPs in E2

%% plug into E1 and simulate

%% part 2: then we do the arbitrary point version. 


%% well it looks like this model is pretty identifiable, and so there is really no problem
% I need to find another example, where there is clear non identifiability
% and covariation between esps and csps. 
