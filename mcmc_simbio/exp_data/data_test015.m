function di = data_test015
% Generate the data_info struct containing the data from Figure 1 of 
% the 2014 ACS Synthetic Biology paper titled: 
% Gene Circuit Performance Characterization and Resource Usage in a 
% Cell-Free “Breadboard” by Siegal-Gaskins et al. This data involves a
% measurement of malachite green aptamer and green fluorescent protein 
% over a period of 800 minutes in the TX-TL cell free expression system. 
% The DNA initial conditions used are 0.5nM, 2nM, 5nM, and 20nM. 
% 
% ------------------------------------------
% The data_info struct has the fields: 
%
% 'dataInfo': A human readable text description of the data. 
% 
% 'timeVector': vector of timepoints
% 
% 'timeUnits': units of the time Vector
% 
% 'dataArray': An array contianing the raw data
% 
% 'measuredNames': A 1 x number of measured species cell array of the strings specifying 
% which species are dosed. These are not strings corresponding to the species 
% in the model. See mcmc_info constructor functions for that. 
% 
% 'dataUnits': A 1 x number measured species cell array of units corresponding to 
% the raw data in the dataArray
%
% 'dimensionLabels': a 1 by length(size(data_info.dataArray)) cell array of 
% labels for the dimensions of the dataArray. 
%
% 'dosedNames': A 1 x number of dosed species cell array of the strings specifying 
% which species are dosed. These are not strings corresponding to the species 
% in the model. See mcmc_info constructor functions for that. 
% 
% 'dosedVals': A matrix of dose values of size
% # of dosed species by # of dose combinations
% 
% 'doseUnits': A 1 x number of dosed species cell array of strings specifying the 
% units of the dosed species. 
%
% Note that data_info can also be an array of these inputs. This is useful in the 
% multi-modal mode (version 2 of the code).
% 
% 
% 
% ------------------------------------------

% Copyright (c) 2018, Vipul Singhal, Caltech
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
%
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.

datadescription = ...
['ptet constitutive calibration data and tetR repression test data, ',...
'used to do calibration correction' ,...
'in the thesis. Calibration using' ];

[tptet , data_ptet, dvptet] = import_ptetconstitutive;
[ttetR , data_tetR, dvtetR] = import_tetR_repression;
tptet = tptet(1:13);
ttetR = ttetR(1:13);


% data_array is nT x nMS x nIC x nEnv. 
% need to separate out the Envs in the different data info entries. 
% need to have data array be time by ms by reps by doses. 
da1temp = data_ptet(1:13, :, :, 1);
da1 = permute(da1temp, [1, 2, 4, 3]);
da2temp = data_ptet(1:13, :, :, 2);
da2 = permute(da2temp, [1, 2, 4, 3]);
da3temp = data_ptet(1:13, :, :, 3);
da3 = permute(da3temp, [1, 2, 4, 3]);


da4temp = data_tetR(1:13, :, :, 1);
da4 = permute(da4temp, [1, 2, 4, 3]);
da5temp = data_tetR(1:13, :, :, 2);
da5 = permute(da5temp, [1, 2, 4, 3]);
da6temp = data_tetR(1:13, :, :, 3);
da6 = permute(da6temp, [1, 2, 4, 3]);

% define the doses: DNA at 0.5, 2, 5 and 20nM
dosedNames1 = {'GFP DNA'};
dosedNames2 = {'GFP DNA', 'tetR DNA'};



mn1 = {'deGFP'};
mn2 = {'deGFP'};

dimlabels = {'time points', 'measured species', 'replicates', 'doses'};

        di1 = struct('dataInfo', {datadescription}, ...
			'timeVector', {tptet}, ...
			'timeUnits', {'seconds'},...
			'dataArray', {da1},...
			'measuredNames', {mn1},...
			'dataUnits', {{'nM', 'nM'}},...
			'dimensionLabels', {dimlabels}, ...
			'dosedNames', {dosedNames1},...
			'dosedVals', {dvptet}, ...
			'doseUnits', 'nM');

        di2 = struct('dataInfo', {datadescription}, ...
			'timeVector', {tptet}, ...
			'timeUnits', {'seconds'},...
			'dataArray', {da2},...
			'measuredNames', {mn1},...
			'dataUnits', {{'nM', 'nM'}},...
			'dimensionLabels', {dimlabels}, ...
			'dosedNames', {dosedNames1},...
			'dosedVals', {dvptet}, ...
			'doseUnits', 'nM');
        di3 = struct('dataInfo', {datadescription}, ...
			'timeVector', {tptet}, ...
			'timeUnits', {'seconds'},...
			'dataArray', {da3},...
			'measuredNames', {mn1},...
			'dataUnits', {{'nM', 'nM'}},...
			'dimensionLabels', {dimlabels}, ...
			'dosedNames', {dosedNames1},...
			'dosedVals', {dvptet}, ...
			'doseUnits', 'nM');   
        
        di4 = struct('dataInfo', {datadescription}, ...
			'timeVector', {ttetR}, ...
			'timeUnits', {'seconds'},...
			'dataArray', {da4},...
			'measuredNames', {mn2},...
			'dataUnits', {{'nM', 'nM'}},...
			'dimensionLabels', {dimlabels}, ...
			'dosedNames', {dosedNames2},...
			'dosedVals', {dvtetR}, ...
			'doseUnits', 'nM');

        di5 = struct('dataInfo', {datadescription}, ...
			'timeVector', {ttetR}, ...
			'timeUnits', {'seconds'},...
			'dataArray', {da5},...
			'measuredNames', {mn2},...
			'dataUnits', {{'nM', 'nM'}},...
			'dimensionLabels', {dimlabels}, ...
			'dosedNames', {dosedNames2},...
			'dosedVals', {dvtetR}, ...
			'doseUnits', 'nM');
        di6 = struct('dataInfo', {datadescription}, ...
			'timeVector', {ttetR}, ...
			'timeUnits', {'seconds'},...
			'dataArray', {da6},...
			'measuredNames', {mn2},...
			'dataUnits', {{'nM', 'nM'}},...
			'dimensionLabels', {dimlabels}, ...
			'dosedNames', {dosedNames2},...
			'dosedVals', {dvtetR}, ...
			'doseUnits', 'nM'); 
        
        

        
        
        di = [di1, di2, di3, di4, di5, di6];
        
end




