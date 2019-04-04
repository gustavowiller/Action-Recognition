function test
	addpath '../tests'

	%Limpa log de função e cache de função
	delete('../log/*.*');	%Deleta todo o log
	clear all;	%Limpa cache de função


	%inicializa variaveis
	R = [];
	objPtc = classProtocol;
	objP = classParamProgram;
	name_file_result = strcat('log/result/',datestr(now,'yymmdd_HHMMSS'),'.mat');
	cd ..


	%Varia os parametros do programa.
	for dt = 2 %Dataset
	for p = [1 2] %Protocol
	for csp = [.85] %Percentual Cut Skeleton - old .75
	for st = [2] % 1 - Modelagem Grafica; 2 - Bag of Features
	for d = [20] %Dimension - PC - both strategy
	for k1 = [300] %k1 Clusters - both strategy
	for k2 = [0] %k2 Clusters - only bag of features
	for hsc = 0 % Habilitate Sparse Coding - only bag of features
	for nis = 0 % Number of Interaction SC - Sparse Coding
	for ts = 0 % Tuning SVM - bag of features
		
		%Todos os parametros do programa e protocolo	
		objP.dataset = dt;
		objP.cut_ske_perc = csp;
		objP.strategy = st;
		objP.d = d;
		objP.k1 = k1;
		objP.k2 = k2;		
		objP.habilitateSparseCoding = hsc;
		objP.n_it_sc = nis;
		objP.tuningSvm = ts;

		result = [];

		%Executa os testes de acordo com o protocolo definido
		tic
		filename = strcat('dt',num2str(dt),'_protocol_',num2str(p),'(objPtc,objP)');
		result = eval(filename);

		%Influencia dos parametros - Saída.
		R(end+1,:) = [dt p csp st d k1 k2  hsc nis ts result toc] 
		save(name_file_result,'R');
		name_file_result
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end