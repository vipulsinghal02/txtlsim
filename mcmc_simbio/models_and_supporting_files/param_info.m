function pinfo = param_info
	% Specify species initial conditions and parameters for 
	% Simbiology model. It is possible to specify multiple parameter points
	% as initial points. This can be used to plot the model behavior at these 
	% points, or to run mcmc for the remaining undetermined parameters, at 
	% each of these points separately. 
	% 
	% The param_info struct specifies parameters, values, 
	% which reaction each parameter corresponds to, 
	% what typical ranges to search for the parameter value over 
	% (these are not log transformed - and are optional), and 
	% some human readable information about the parameter. 
	% 
	% It also specifies a list of species whose initial concentrations 
	% should be set to specified amounts. 
	% 
	% The fields are: 
	% 'names': 				A string corresponding to the parameter or species name, or 
	% 							a 1 by 2 cell array of strings for forward and backward 
	%							reaction rate parameters for reversible reactions. 
	% 'values': 			A numerical value of the parameter or species initial 
	% 							concentration, or a 1 by 2 vector for reversible reactions. 
	% 'identifier': 		(optional) This is either the reaction string, or any of 
	% 							the strings 'global', 'speciesIC' or 'globalorspeciesIC'.
	%							If the 'names' is a 1 x 2 cell array and the 'values' is a 
	% 							two element vector, then the reaction is reversible, 
	% 							and if the 'names' is a string, then it is an irreversible 
	% 							reaction. When either 'global' or 'speciesIC', we always have a 
	% 							string and a scalar for 'paramNames' and 'values' respectively. 
	% 							If this argument is unspecified, then the string 'globalorspeciesIC' is 
	% 							assumed. 
	% 'ranges': 		(optional) Non-negative orthant values for the parameter or species conc
	% 							upper and lower bounds. For each reaction this is either a 
	% 							2 by 1 vector (for irreversible reactions) or a 2 by 2
	% 							matrix, where the first and second rows are the upper 
	% 							and lower bounds respectively, and the first and second 
	%							columns are the bounds for the forward and reverse rate
	% 							parameters respectively. For species bounds, the same convention
	% 							as that of  If nothing is specified, then 
	% 							the bounds for a parameter with value VAL is [VAL/10; VAL*10]
	% 'notes'			(optional) Human readable notes. 

	% !TODO 2/14/18 complete this later. 
	% 

	% Template code for param_info 

	% set the model parameters according to these walker positions. 

	%%
	% specify paramNames
	pcells = [{'TX_elong_glob',             5.1288      }   %   1 3
	    {'AGTPdeg_time'                     7200        }   %   4 10
	    {'AGTPdeg_rate'                     0.00022425  }   %   -10 -7
	    {'TXTL_P70_RNAPbound_Kd'            12.39       }   %   -1 7
	    {'TXTL_P70_RNAPbound_F'             17.001      }   %   1 7
	    {'TXTL_RNAPBOUND_TERMINATION_RATE'  0.076026    }   %   -5 -1
	    {'TXTL_NTP_RNAP_1_Kd'               2.142       }   %   -2 2
	    {'TXTL_NTP_RNAP_1_F'                9.8854      }   %   1 4
	    {'TXTL_NTP_RNAP_2_Kd'               13.33       }   %   1 4
	    {'TXTL_NTP_RNAP_2_F'                0.75935     }   %   -2 2
	    {'TXTL_RNAdeg_Kd'                   2185.8      }   %   5 10
	    {'TXTL_RNAdeg_F'                      1         }   %   -5 2
	    {'TXTL_RNAdeg_kc'                   0.0022382   }]; %   -7 -3

	% species and typical values. 
	names = [pcells(:,1)
	    {'RNAP';... 
	    'RNase'}]; 
	
	% specify paramVals
	vals = [cell2mat(pcells(:,2))
    42.247
    81.795];



	pinfo = struct('names', names,...
		'values', vals, ...
		'identifier', [],...
		'ranges',[],...
		'notes',[]);

