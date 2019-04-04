	% In Protocol 4, the most widely adopted, cross-subject validation with
	% subjects 1, 3, 5, 7, and 9 for training, the others for test (HS-V
	% protocol) is adopted.
	objP = classParamProgram;
	objP.cut_ske_perc = .75;
	objP.k1 = 15;
	objP.k2 = 30;
	objP.d = 5;
	objP.maxIter = 400;
	objP.ParamSvm = ones(8,2,3);
	objP.n_it_sc = 1;


	cd ..
	S = [1 0 1 0 1 0 1 0 1 0];



	result = [];
	%Run the test of subsets classes (AS1,AS2,AS3);
	for a = 1:3
		disp(strcat('a',num2str(a)));

		MC1 = zeros(8,8);
		MC2 = zeros(8,8);


		R = [];
		[V DA]     = main(A(a,:),S,Efull,dataset,objP);
		R(:,end+1) = V;
		%R(:,end+1) = main(A(a,:),S,Efull,dataset,30,5,0,st_mod,[]);
		%R(:,end+1) = mode(R,2);

		save(strcat('tests/R',num2str(a),'.mat'),'R');

		%Vetor de acertos
		[nA nT]= size(R); %Number actions and number tests;
		result(a,:) = sum( repmat(DA(:,1),1,nT) == R,1)/nA;
		disp(num2str(result(a,:)));
	end
	result(end+1,:) = mean(result,1);

	%Taxa de acerto - Por action set 
	disp(result)


	%Gera as matrizes de confusão