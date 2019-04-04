function [result] = main_mod(Ptc,P)
	L = sum(Ptc.A);
	delete('data/action_class_transition/*');

	
	%Carrega descritor e subdivide em grupos de treinamento e test.
	cd 'descritor_pose'
	[M,D] = loadDatabase(P.dataset);
	[M] = normalizeBySubject(M,D,P.dataset);
	[M] = filterDistances(M,D,P.dataset);
	[M,D] = filterSkeletonVariational(M,D,P.cut_ske_perc); 
	cd '..'

	[M1 D1 M2 D2] = dividePosesToTrainingAndTest(Ptc,M,D);

	[F1 med1 u1] = pcaTrain(M1,P.d);
	[idx_clusters C1] = kmeans2(F1,P.k1,P.maxIter);
	DA1 = sequenceActions(D1); %DA = Vetor de Sequencia de ações - Grupo Treinamento
	numA1 = size(DA1,1); 
	

	%Stage before test with strategys 
	F2 = pcaTest(M2,P.d,med1,u1);
	DA2 = sequenceActions(D2); %DA = Vetor de Sequencia de ações - Grupo Teste
	numA2 = size(DA2,1);

	%Stage Training
	matrixTransition(idx_clusters,D1,P.k1,L); %Create and save L matrix transitions
	covarianceClusters(F1,idx_clusters,P.k1);%Create and save k covariance clusters. 
	
	%Stage Test 
	V = zeros(numA2,1);
	for(i = 1:numA2)
		T = F2(DA2(i,5):DA2(i,6),:);
		V(i) = viterbi(T,P.k1,L);
	end
	
	result = sum(DA2(:,1) == V,1)/numA2;