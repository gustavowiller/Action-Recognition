function packMeanExample(strategy,ps,d,TMFC,dataset)
	load('../config/parametersMSRDaily.mat');
	load('../../data/config/descritorPose-MSRDailyAct3D.mat','M','D');

	cd .. 
	detailsTest('Pack Mean Example',strategy,ps,d,TMFC,dataset);
	cd ..
	
	MC_global = zeros(8,8,10);
	for a = 1:3
		for j = 1:3
			MC = main(A(a,:),Sfull,E(j,:),M,D,ps,d,TMFC,strategy);
			ind = (a-1)*3+j;
			R(ind) = sum(diag(MC))/sum(sum(MC));
			MC_global(:,:,ind) = MC;
		end
	end

	%Show Result
	fileID = fopen('log.txt','a');
	result = strcat(' AS1=',num2str(mean(R(1:3))),...
			' AS2=',num2str(mean(R(4:6))),...
			' AS3=',num2str(mean(R(7:9))),...
			' Media=',num2str(mean(R)),'\n');
	disp(result);
	fprintf(fileID,result);
	fclose(fileID);