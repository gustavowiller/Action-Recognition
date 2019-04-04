function [A delete_cluster] = filterClusterTrain(A,DA,ps,L)

	load('data/config/parameters.mat','TMFC'); %taxa minimum filter cluster
	for a = [1:L]

		A2 = A(DA(:,1)==a,:); %somente as linhas referente a uma classe de ação.
		nA2 = size(A2,1);


		%Zerar as colunas referentes as poses, em que foram pouco visitadas, os outliers e o ruído. 
		for i = 1:ps
			numberOfNonZeros(i) = nnz(A2(:,i));
		end
		frequency_clusters(a,:) = (numberOfNonZeros ./ nA2);
	end

	delete_cluster = frequency_clusters < TMFC; 
	n = size(DA,1);
	for i = 1:n
		A(i,logical(delete_cluster(DA(i),:))) = 0; 
	end
		