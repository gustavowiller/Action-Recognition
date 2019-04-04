function A = filterClusterTrain2(A,DA,ps,L)

	load('data/config/parameters.mat','TMFC'); %taxa minimum filter cluster

	for a = [1:L]
		A2 = A(DA(:,1)==a,:); %somente as linhas referente a uma classe de ação.
		frequency_clusters(a,:) = mean(A2);
	end

	delete_cluster = frequency_clusters < TMFC; 



	n = size(DA,1);
	for i = 1:n
		A(i, logical(delete_cluster(DA(i),:)) ) = 0; 
	end
