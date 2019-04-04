function result = strategy_bag_of_features(Ptc,P,M,D)


	[F med u] = pcaTrain(M,P.d);
	[idx1_clu_all] = kmeans2(F,P.k1,P.maxIter);
	[idx2_clu_all] = kmeans2(F,P.k2,P.maxIter);

	
	DA = sequenceActions(D);
	
    numA = size(DA);
    for(i = 1:numA) %Percorre as sequências de ação do grupo treinamento
        idx_frames_action = [DA(i,5):DA(i,6)];
        idx1_clu_action = idx1_clu_all( idx_frames_action ); %Seleciona os indices do cluster relativo a ação percorrida
        MH(i,:) = histogramByClusters( idx1_clu_action,P.k1 );
         
        if(P.k2) %Verifica se o numero de clusters escolhido é maior que 0 para proseguir com os calculos.
            idx2_clu_action = idx2_clu_all( idx_frames_action ); %Seleciona os indices do cluster relativo a ação percorrida
            MT(i,:) = matrixTransitionByAction( idx2_clu_action,P.k2 );
        end
    end
 
 
    if(P.k2)  %Verifica se o numero de clusters escolhido é maior que 0 para proseguir com os calculos.
        MT = applyFilterDimension(MT,0);
        M = [MH MT];
    else
        M = MH;
    end
 
     
    if(P.habilitateSparseCoding)
        M = M';
        [u,s,v]=svd(M); %Singular value decomposition;
 
        %Tentativa pela função dlfun.m
        dlsKSVD = struct('D',eye(size(M,1)), 'Met','K-SVD', 'vsMet','ORMP', 'vsArg',struct('tnz',4));
        dlsKSVD.snr = zeros(1,P.n_it_sc);
        for i=1:P.n_it_sc
            dlsKSVD = dlfun(dlsKSVD, M, 1); 
        end
        M = dlsKSVD.W';
    end
 
 
    [M1 DA1 M2 DA2] = dividePosesToTrainingAndTest(Ptc,M,DA);
     
    L = sum(Ptc.A); 
    classificatorTrain(M1,DA1,L,P);
 
    numA2 = size(DA2,1);
    V = zeros(numA2,1); %Armazena o Resultado da classificação.
    MC = zeros(L,L); %Matriz de Confusão 
    for(i = 1:numA2)%Percorre as sequencias de ação do grupo de teste
        V(i) = classificatorTest(M2(i,:),L);
        MC(DA2(i,1),V(i)) = MC(DA2(i,1),V(i)) + 1;  
    end

    P.saveMatrizConfusao(MC);
 
    result = sum(DA2(:,1) == V,1)/numA2;