function groupedData = mcmc_import_data(dataspec)
%mcmc_import_data Takes a data spec and creates a simbiology compatible
%grouped data object compatible with the data associated with that data
%spec. 
%   The data spec is the name of the data file stored in the data
%   directory. 
groupedData = eval(dataspec);



end

