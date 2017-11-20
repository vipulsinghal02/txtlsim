function txtldir = txtl_init
fp = mfilename('fullpath'); 
slashes = regexp(fp, '/');
filedir = fp(1:slashes(end)-1);
addpath(filedir);
addpath([filedir '/auxiliary'])
addpath([filedir '/components'])
addpath([filedir '/config'])
addpath([filedir '/core'])
addpath([filedir '/examples'])
addpath([filedir '/examples/CompanionFiles'])
addpath([filedir '/modules/paramest'])
addpath([filedir '/tests'])
addpath([filedir '/data'])
addpath([filedir '/sysID'])
addpath([filedir '/sysID/silicoexp'])
txtldir = filedir;
end
