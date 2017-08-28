function  outdir = mcmc_init(varargin)
% initializes the various files needed for MCMC to work. this function must
% be called from the level of the directory where it is stored, and the 
% directory structure must be like that in AmazonImageSandbox . It adds
% everything needed to run mcmc, including a txtl toolbox. 
% 
% It accepts the following input arguments: 
% experimentNum: this needs to be the name of the folder that contains the
% matlab files containing the experiment code, and any other code we are
% trying to run. 
% 
% and the following output arguments (all optional)
% outdir: if an input string for the 
% !TODO: add a displayed message on the screen describing which directories
% get added, and add a check for the minimal set of directories and files. 

p = inputParser;
addOptional(p, 'experiment', 'none',@ischar); % 
p.parse(varargin{:});
p=p.Results;

% check if the present working directory is indeed where this mcmc_init
% file is stored. 
fp = mfilename('fullpath');
slashes = regexp(fp, '/');
filedir = fp(1:slashes(end)-1);
if ~strcmp(pwd, filedir)
    cd(filedir)
end

% first remove all paths within the top level directory
addpath(genpath(pwd)); %add all paths 
rmpath(genpath(pwd)); % and then remove them (this avoids pesky warning messages)
% another way would have been to just suppress warnings.

% next re add only the relevant directories. This allows for different
% experiments to be run in the same session, and if a folder or file is
% repeated in two different directories, the old one is cleared and the new
% one is used. 

if exist( p.experiment ,'dir')
    outdir = [pwd '/' p.experiment];
    addpath(genpath(outdir));
elseif ~strcmp(p.experiment, 'none')
    error('The directory name specified as the input to mcmc_init does not exist in the present working directory');
else
    outdir = pwd;
end

%% add paths to
% MCMC package
addpath(genpath([pwd '/MCMCtoolbox']))

% txtl toolbox
addpath([pwd '/txtl-code-166-trunk_AWS'])
currdir = pwd;
cd([pwd '/txtl-code-166-trunk_AWS'])
txtl_init
cd(currdir)


end

