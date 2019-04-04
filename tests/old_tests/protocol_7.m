	%Protocolo de testes avulso para o artigo a ser submetido para o congresso da paraiba

	cd ..

	param_svm = ones(20,2);%parameters of the classifier svm
	TMFC = 0;

	%Teste 1
	disp(strcat('Teste:',num2str(1)));
	MC1 = zeros(20,20);
	MC2 = zeros(20,20);
	for j = 1:3 
		R = [];
		[V DA] = main(Afull,Sfull,E1(j,:),dataset,300,20,TMFC,st_bof,param_svm);
		R(:,end+1) = V;
		R(:,end+1) = main(Afull,Sfull,E1(j,:),dataset,30,5,TMFC,st_mod,[]);

		[nA nT]= size(R); %Number actions and number tests;
		
		%Building Geral confusion Matrix.
		for(i=1:nA)
			MC1(DA(i,1),R(i,1)) = MC1(DA(i,1),R(i,1)) + 1; 
			MC2(DA(i,1),R(i,2)) = MC2(DA(i,1),R(i,2)) + 1;  
		end
	end
	cd 'analise'; 
	showConfusionMatrix(MC1,7,1,1);
	showConfusionMatrix(MC2,7,1,2);
	cd '..'


	%Teste 2
	disp(strcat('Teste:',num2str(2)));
	for j = 1:3 %Run each example of all examples. 
		disp(strcat('j',num2str(j)));
		R = [];
		[V DA] = main(Afull,Sfull,E2(j,:),dataset,300,20,TMFC,st_bof,param_svm);
		R(:,end+1) = V;
		R(:,end+1) = main(Afull,Sfull,E2(j,:),dataset,30,5,TMFC,st_mod,[]);

		[nA nT]= size(R); %Number actions and number tests;
		
		%Building Geral confusion Matrix.
		for(i=1:nA)
			MC1(DA(i,1),R(i,1)) = MC1(DA(i,1),R(i,1)) + 1; 
			MC2(DA(i,1),R(i,2)) = MC2(DA(i,1),R(i,2)) + 1;  
		end
	end
	cd 'analise'; 
	showConfusionMatrix(MC1,7,2,1);
	showConfusionMatrix(MC2,7,2,2);
	cd '..'

	%Teste 3 
	disp(strcat('Teste:',num2str(3)));
	MC1 = zeros(20,20);
	MC2 = zeros(20,20);
	R = [];
	S = [1 0 1 0 1 0 1 0 1 0];
	[V DA]     = main(Afull,S,Efull,dataset,300,20,0,st_bof,param_svm);
	R(:,end+1) = V;
	R(:,end+1) = main(Afull,S,Efull,dataset,30,5,0,st_mod,[]);

	%Vetor de acertos
	[nA nT]= size(R); %Number actions and number tests;

	%Building and save confusion Matrix.
	for(i=1:nA)
		MC1(DA(i,1),R(i,1)) = MC1(DA(i,1),R(i,1)) + 1; 
		MC2(DA(i,1),R(i,2)) = MC2(DA(i,1),R(i,2)) + 1;  
	end
	cd 'analise'; 
	showConfusionMatrix(MC1,7,3,1);
	showConfusionMatrix(MC2,7,3,2);
	cd '..'
