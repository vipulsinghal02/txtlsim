function  mcmc_init(varargin)
% this function is to be called at the beginning of the top level silico
% experiment driver file stored in the ../sysID/silicoexp/ directory, and named
% silicoexpyyyymmdd
%
% It adds everything needed to run mcmc, along with a directory in which any
% supporting files for the current experiment being worked on are stored
% (creating it if no such directory exists). The data and results are kept
% under the data and results directories respectively. The results
% directory stores data in directories labeled by the date and time of the
% simulation, along with a specification on what data was used, and what
% the mcmc settings and arguments were. 
% 
% It accepts the following input arguments: 
% silicoexpdirname: this needs to be the name of the folder that contains
% the supporting code for the current experiment, and is stored in the silicoexp
% directory. If no such directory exists, it gets created. The files in this 
% directory those that set up the model object, special datasets, special settings
% sets, etc. It also contains results subdirectories named by date and time
% of simulations (which in turn contain readme descriptions of the results)
% 



p = inputParser;
addOptional(p, 'proj', 'none',@ischar); % 
p.parse(varargin{:});
p=p.Results;

% get the path of this file
fp = mfilename('fullpath'); 
slashes = regexp(fp, '/');
filedir = fp(1:slashes(end)-1); % ie, ../sysID

% first remove all paths within the directory where this function is stored
%add all paths 
addpath(genpath(filedir)); 

% and then remove them (this avoids pesky warning messages)
rmpath(genpath(filedir)); 
% next re add only the relevant directories. This allows for different
% experiments to be run in the same session, and if a folder or file is
% repeated in two different directories, then when we start working on a
% new project, the old one is cleared and the new one is used. 

projdir = [filedir '/silicoexp/'];


if exist( [projdir p.proj] ,'dir')
    outdir = [projdir p.proj];
    addpath(genpath(outdir));
elseif ~strcmp(p.proj, 'none')
    % create the project directory
    outdir = [projdir p.proj];
    mkdir(outdir)
    addpath(outdir);
    
else
    datestring = datestr(now, 'yyyymmdd_HHMM');
    outdir = [projdir 'silicoexp' datestring];
    mkdir(outdir)
    addpath(outdir);
end

%% add paths to
% MCMC package
addpath(genpath([filedir '/doc']))
addpath(genpath([filedir '/data']))
addpath(genpath([filedir '/src']))


end

