function classificatorTrain(BF_all,DA1,L,P)
	delete('data/classificator/*');

	%[BF del_clu] = filterClusterTrain(BF,DA,ps,L);
	z = [];
	for(a = 1:L)
		Y = DA1(:,1);

		idxPos = find(Y==a);
		idxNeg = find(Y~=a);
		Y(idxPos) = 1; 
		Y(idxNeg) = 0;

		if(P.tuningSvm)
			z(a,:) = tuningSvm(BF,Y);
		else
			z(a,:) = [1 1];
		end

		svmStruct = fitcsvm(BF_all,Y,'KernelFunction','rbf','KernelScale',z(a,1),'BoxConstraint',z(a,2));
		filename = strcat('data/classificator/',num2str(a,'%02i'),'.mat');	
		save(filename,'svmStruct','BF_all','Y');
	end
