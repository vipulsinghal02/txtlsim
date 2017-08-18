listOfSpecies_justAdded = {'term_Ribo:RNA utr1--deGFP'
'DNA plas_ptet--utr1--deGFP:OC12HSL:protein lasR'
'RNAP:DNA plas_ptet--utr1--deGFP:OC12HSL:protein lasR'
'AGTP:CUTP:RNAP:DNA plas_ptet--utr1--deGFP:OC12HSL:protein lasR'
'AGTP:RNAP:DNA plas_ptet--utr1--deGFP:OC12HSL:protein lasR'
'AGTP:CUTP:RNAP:DNA plas_ptet--utr1--deGFP:OC12HSL:protein lasR:protein tetRdimer'
'AGTP:RNAP:DNA plas_ptet--utr1--deGFP:OC12HSL:protein lasR:protein tetRdimer'
'RNAP:DNA plas_ptet--utr1--deGFP:OC12HSL:protein lasR:protein tetRdimer'}

activ_bound = ['^(RNAP:DNA plas_ptet--utr1--deGFP|DNA plas_ptet--utr1--deGFP):(OC12HSL:protein lasR(-lva)?)$']
[tkn, species_list_2] = regexp(listOfSpecies_justAdded,activ_bound, 'tokens', 'match')
lt = vertcat(tkn{:})
