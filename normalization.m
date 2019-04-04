function M = normalization(M)
		n = size(M,1);
		for i = 1:n
			sum_row = sum(M(i,:));
			if(sum_row)
				M(i,:) = M(i,:) ./ sum_row;
			end
		end
