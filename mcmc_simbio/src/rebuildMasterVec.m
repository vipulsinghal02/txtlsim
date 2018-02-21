function [mv] = rebuildMasterVec(rmv, mai)
	% rmv = reduced master vector or array of vectors
	% mai: master_info struct
	% mv = rebuilt master vector. 

	% sg = cell array of semantic group vectors
	sg = mai.semanticGroups;
	mv = zeros(size(mai.paramRanges, 1), size(rmv, 2));
	for i = 1:length(sg)
		mv(sg{i}, :) = repmat(rmv(i, :), numel(sg{i}), 1);
	end
end
