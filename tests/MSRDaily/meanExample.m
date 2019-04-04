function meanExample(strategy,ps,d,TMFC,dataset)
	load('../config/parametersMSRDaily.mat');
	load('../../data/config/descritorPose-MSRDailyAct3D.mat','M','D');
	
	cd ..
	detailsTest('Mean Example',strategy,ps,d,TMFC,dataset);
	cd ..

	
	Afull = [1 1 1 0 1 1 1 1 1 1 1 1 0 1 0 1];
	nA = sum(Afull);

	MC_global = zeros(nA,nA);
	for(i = 1:2)
		MC = main(Afull,Sfull,E(i,:),M,D,ps,d,TMFC,strategy);
		MC_global = MC_global + MC;
	end
	
	fileID = fopen('log.txt','a');
	result = strcat(' Media=',num2str( sum(diag(MC_global))/sum(sum(MC_global)) ),'\n');
	fprintf(fileID,result);
	disp(result);
	fclose(fileID);
	save('tests/data/mean_example_msrdaily.mat','MC_global');
