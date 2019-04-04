classdef classParamProgram
	properties
		dataset %dataset escolhido
		d   %Dimensão do PCA
		k1	%Kmeans Grupo 1
		k2	%Kmeans Grupo 2 ; Utiizado para construção da matriz de transição, k2²
		maxIter = 400;%Maxima Interação do Kmeans
		paramSvm %Parametros utilizado no classificador SVM
		cut_ske_perc %Parametro de corte (em porcentagem) da distância dos esqueletos em relação ao esqueleto médio(cinco primeiro frames)
		n_it_sc %Numero de iteração dos metodos de Online Dictionary Learning utilizando Sparse Coding.
		tuningSvm %Boolean - Habilita ou não a função de otimizar os parametros do classificador SVM
		habilitateSparseCoding %Boolean - Que habilita a utilização de sparseCoding
		strategy %Integer - 1 - Habilita a utilização da estratégia de modelagem grafica; 2 - Bag of Features
	end
end