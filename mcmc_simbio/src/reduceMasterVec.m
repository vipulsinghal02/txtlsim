function [rmv, rpr, sgnames] = reduceMasterVec(master_info)
	mv = master_info.masterVector;
	estParamsIx = setdiff((1:length(mv))', master_info.fixedParams);
	logp = mv(estParamsIx);

	% reduce the logp (take only the first element for each group)
    % nreduc = sum(cellfun(@numel, master_info.semanticGroups)) ...
    %             - numel(master_info.semanticGroups);
    % reducedLength = length(logp) - nreduc;

    reducedLength = length(master_info.semanticGroups);

    % reduced master vector (actually the to-be-estimated part of it)
    rmv = zeros(reducedLength, 1);

    % reduced parameter ranges
    pr = master_info.paramRanges;
    rpr = zeros(reducedLength, 2);
    sgnames = cell(reducedLength, 1); % list of names for the sematic groups



	for i = 1:reducedLength 
		sgi = master_info.semanticGroups{i}; % ith sematic group
		
		rmv(i) = logp(sgi(1));
		rpr(i, :) = [max(pr(sgi, 1)) min(pr(sgi, 2))];
		mastnames = master_info.estNames;

		sgnames{i} = mastnames{sgi(1)}; % the first names in the group
	end



end
