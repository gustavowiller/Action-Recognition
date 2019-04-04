function BF_one = histogramByClusters(idx_sel,k)
		n_frames = size(idx_sel,1);
		BF_one = zeros(1,k);
		for(f = [1:n_frames]); %Percorre o frame de cada ação. 
			cluster = idx_sel(f);
			BF_one(cluster) = BF_one(cluster) + 1; %Soma mais um na pose saliente (modelo de observaçõa) visitada.
		end

		BF_one = normalization(BF_one);