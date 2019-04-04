function [result] = main(Ptc,P)


	cd 'descritor_pose'
	[M,D] = loadDatabase(P.dataset);
	[M] = normalizeBySubject(M,D,P.dataset);
	[M] = filterDistances(M,D,P.dataset);
	[M,D] = filterSkeletonVariational(M,D,P.cut_ske_perc); 
	cd ..


	if(P.strategy == 1)
		result = strategy_mod_graph(Ptc,P,M,D);
	elseif(P.strategy == 2)
		result = strategy_bag_of_features(Ptc,P,M,D);
	end


