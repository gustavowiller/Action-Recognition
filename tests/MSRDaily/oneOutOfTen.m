function oneOutOfTen(strategy,ps,d,TMFC,dataset)
	load('../config/parametersMSRDaily.mat');
	load('../../data/config/descritorPose-MSRDailyAct3D.mat','M','D');
	
	cd .. 
	detailsTest('One Out of Ten',strategy,ps,d,TMFC,dataset);
	cd ..

	
	MC_global = zeros(16,16);
	for j = 1:10
		MC = main(Afull,S(j,:),Efull,M,D,ps,d,TMFC,strategy);
		MC_global = MC_global + MC;
	end
	save('tests/data/one_out_of_ten_msrdaily.mat','MC_global');

	%Show Result
	fileID = fopen('log.txt','a');
	result = strcat(' Media=',num2str( sum(diag(MC_global))/sum(sum(MC_global)) ),'\n');
	fprintf(fileID,result);
	disp(result);
	fclose(fileID);
