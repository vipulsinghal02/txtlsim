function mcmc_descriptions
% Every time you write a data and mcmc_info file, include them in this 
% list. Users can call this list by typing 'help mcmc_descriptions' in 
% the command line. 
% 
% 
% 
% %%%%%%%%% descriptions: %%%%%%%%%%
% - (mcmc_info_basic, model_basic) : gene expression model with enzymatic 
% expression of mrna and protein, and first order degradation. 
% P + D <-> PD (kPDf, kPDr)
% PD -> P + D + m (kTX)
% m + R <-> mR (kmRf, kmRr)
% mR -> m + R + G (kTL)
% G -> null (kGd)
% m -> null (kmd)
%
%
% ----------------------------------------------------------
% - [model_enzymatic] : This is an enzymatic reaction: 
% E + S <-> C -> E + P. 
% The mcmc_info struct is also created by this model file. 
% 
% 
% ----------------------------------------------------------
% - [model_TXTL_geneexpr] : Constitutive gene expression model using the txtl
% modeling toolbox stored in txtl_directory
% 
% This is a simple constitutive gene expression model 
% built using the TXTL modeling toolbox. It models DNA binding 
% to RNAP and nucleotides, followed by transcription. The resulting
% mRNA can degrade and participate in translation. The former is 
% modeled as a enzymatic reaction involving every complex containing 
% mRNA. The latter involves binging to Ribosomes, followed by amino acids 
% and ATP, and finally elongation and termination resulting in protein.
% 
%
% ----------------------------------------------------------
% - [data_dsg2014] : Data from Figure 1 of the 2014 ACS Synthetic Biology 
% paper titled: 
% Gene Circuit Performance Characterization and Resource Usage in a 
% Cell-Free “Breadboard” by Siegal-Gaskins et al. This data involves a
% measurement of malachite green aptamer and green fluorescent protein 
% over a period of 800 minutes in the TX-TL cell free expression system. 
% The DNA initial conditions used are 0.5nM, 2nM, 5nM, and 20nM. 
% 
% ASSOCIATED MCMC_INFO STRUCTS:
% . mcmc_info_dsg2014
% . mcmc_info_dsg2014_version2
% . mcmc_info_dsg2014_version2_mrna
% . mcmc_info_dsg2014_protein
%
% -- mcmc_info_dsg2014
%
% ----------------------------------------------------------
% ADD NEW ENTRY HERE
%
%
% ----------------------------------------------------------
% ADD NEW ENTRY HERE
%
%
% ----------------------------------------------------------
% ...
%
%
% ----------------------------------------------------------
% 
% 
% 
%
%
%
% 
% 
%
%
%
% 

disp('Type ''help mcmc_descriptions'' for info on the various files available')