function [C V] = covarianceMatrixLoad(ps)
	C = [];	%all matrix covariations
	V = []; %all vectors means;
	for(k = 1:ps)
		file = sprintf('data/cov/%02i.cov',k);
		T = load(file);
		V(k,:) = T(1,:); % load vector mean
		C(k,:,:) = T(2:end,:); %matrix covariation
	end
end
