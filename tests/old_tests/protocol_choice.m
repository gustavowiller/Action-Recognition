function protocol_choice(type_test,dataset)
	%Carregar os vetores de parametros que configuram os tipos de testes.. E1,E2 (testes), Subject ( ), AS1 AS2 AS3. 
	filename_parameters = strcat('config/parameters_',num2str(dataset),'.mat');
	load(filename_parameters);
	
	%Size number action class. 
	L = sum(Afull);
	
	%variables to use inside protocols
	st_bof = 1; %Bag of Features
	st_mod = 2; %Action Graph - Modelagem Gráfica
	
	%Open and execute the protocol choseed. 
	disp(strcat('p',num2str(type_test)));
	filename = strcat('protocol_',num2str(type_test));
	eval(filename);

	%Mount Results "obtidos no protocolo executado" in vector result.  
	nT = size(R,2)-1; 
	nA = size(R,1);
	result = sum( repmat(R(:,1),1,nT) == R(:,[2:end]) )/nA;


	%Save and show the results
	cd 'tests/';
	save('R.mat','R');
	fileID = fopen('log.txt','a');
	fprintf(fileID,strcat(num2str(result)));
	%disp(result);
	fclose(fileID);
	%filename_log = strcat('log/','dataset-',num2str(dataset),'_test-',num2str(type_test),'.mat');
	%save(filename_log,'MC_global','MCs');
