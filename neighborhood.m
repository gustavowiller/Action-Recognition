function a = neighborhood(A,nClasses)

	load('data/config/bagOfFeatures.mat','P');
	for(i = 1:nClasses)
		Dist(i) = norm(A-P(i,:));
	end
	[var a] = min(Dist);
	save('data/debug/neighborhood.mat','Dist');
