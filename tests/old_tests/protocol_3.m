	% In Protocol 3, a
	% 3-fold cross-validation is adopted with 2/3 of the data used for
	% testing the models and 1/3 for training the models (3F-2:1).
	

	dataset = 3;
	TMFC = 0;
	d = 20;
	param_svm = ones(8,2);
	MC1 = zeros(20,20);
	MC2 = zeros(20,20);


	%Run subset
	cd .. 
	for a = 1:3 %Run the test of subsets classes (AS1,AS2,AS3);
		disp(strcat('a',num2str(a)));

		for j = 1:3 %Run each example of all examples. 
			disp(strcat('j',num2str(j)));
			R = [];
			[V DA] = main(A(a,:),Sfull,E2(j,:),dataset,300,20,TMFC,st_bof,param_svm);
			R(:,end+1) = V;
			R(:,end+1) = main(A(a,:),Sfull,E2(j,:),dataset,30,5,TMFC,st_mod,[]);
			%R(:,4) = main(A(a,:),Sfull,E2(j,:),dataset,100,d,TMFC,2);
			%R(:,5) = main(A(a,:),Sfull,E2(j,:),dataset,150,d,TMFC,2);
			%R(:,6) = mode(R(:,[2:5]),2);
	
			[nA nT]= size(R); %Number actions and number tests;
			ind = (a-1)*3+j;
			result(ind,:) = sum( repmat(DA(:,1),1,nT) == R )/nA;
			
			%Building Geral confusion Matrix.
			for(i=1:nA)
				MC1(A2(a,DA(i,1)),A2(a,R(i,1))) = MC1(A2(a,DA(i,1)),A2(a,R(i,1))) + 1; 
				MC2(A2(a,DA(i,1)),A2(a,R(i,2))) = MC2(A2(a,DA(i,1)),A2(a,R(i,2))) + 1;  
			end
		end
	end

	result

	str_r_as1 = strcat(' AS1=',num2str(mean(result(1:3,:))))
	str_r_as2 = strcat(' AS2=',num2str(mean(result(4:6,:))))
	str_r_as3 = strcat(' AS3=',num2str(mean(result(7:9,:))))
	
	str_result = strcat(str_r_as1,str_r_as2,str_r_as3,' Med=',num2str(mean(result)));

	%Gera as matrizes de confusão
	cd 'analise'; 
	showConfusionMatrix(MC1,3,1);
	showConfusionMatrix(MC2,3,2);
	cd '..'