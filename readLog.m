function readLog()
	load('log/kmeans2.mat','z');
	load('log/filterSkeletonVariational.mat','nSkeletons','nSkeletonsBefore');
	load('log/pcaTrain.mat','autovalores');
	load('log/applyFilterDimension.mat','number_colums_before','number_colums_after');

	disp(strcat('Numero de Iterações Kmeans: ',num2str(z)));
	disp(strcat('Filtro Skeletons: Antes e Depois: ',num2str(nSkeletonsBefore),' - ',num2str(nSkeletons)));
	disp(strcat('Dimensao da Matriz de Transição Antes e Depois: ',num2str(number_colums_before),' - ',num2str(number_colums_after)));

	%plot(autovalores);
	%title('Autovalores - pcaTrain');
