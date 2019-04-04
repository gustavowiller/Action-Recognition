%Protocolo para avaliar a influencia dos parametros no resultado, buscar automatizar tudo.

	%Parametros do Programa

	%Examples
	Efull =  [1,1,1];

	%Subject used in protocol 4
	S_4 = [1 0 1 0 1 0 1 0 1 0];

	%Groups actions;
	A(1,:) = [0,1,1,0,1,1,0,0,0,1,0,0,1,0,0,0,0,1,0,1];
	A(2,:) = [1,0,0,1,0,0,1,1,1,0,1,1,0,1,0,0,0,0,0,0];
	A(3,:) = [0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,1,1,1,1,1];
	Afull =  [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];



	objP = classParamProgram;
	objP.cut_ske_perc = .75;
	objP.k1 = 15;
	objP.k2 = 30;
	objP.d = 5;
	objP.maxIter = 400;
	objP.ParamSvm = ones(8,2,3);
	objP.n_it_sc = 1;

	cd ..



	result = [];
	%Run the test of subsets classes (AS1,AS2,AS3);
	for a = 1:3
		[V DA]     = main(A(a,:),S,Efull,dataset,objP);
		nA= size(V,1); %Number actions;
		result(a) = sum(DA(:,1) == V,1)/nA;
	end

	%Taxa de acerto - Por action set 
	disp(result)
	pause