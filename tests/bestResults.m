function bestResults
	addpath '../tests'

	objPtc = classProtocol;
	objP = classParamProgram;
	R = [];
	name_file_result = strcat('log/result/',datestr(now,'yymmdd_HHMMSS'),'.mat')
	cd ../



	% Best Results - Vector Parameters
	%
	% Model - Description positions of Parametros
	% Vp(end+1,:) = [dataset protocol strategy cut_ske_perc d k1 k2 habilitateSparseCoding n_it_sc tuningSvm ]
	%
	% DataSet 2(MSRDailyReal) - Por Protocolo - Action Graph - Modelagem Gráfica
	%									  Mean	  Time
	% Vp(end+1,:) = [2 1 2 .85 5 25 0 0 0 0];%	  0.2154  88.6211
	% Vp(end+1,:) = [2 2 1 .85 5 25 0 0 0 0];%	  0.3308  225.3444


	% DataSet 2(MSRDailyReal) - Por Protocolo - Bag of Features
	%									  Mean	 Time
	% Vp(end+1,:)= [2 1 2 .85 20 100 0 0 0 0];%  0.4769   89.0856
	% Vp(end+1,:) = [2 2 2 .85 20 40 0 0 0 0]; %  0.4615  204.3786


	% DataSet 3(MSRactionReal) - Por Protocolo - Action Graph - Modelagem Gráfica
	%									  		AS1		AS2		  AS3		Mean	 Time
	% Vp(end+1,:) = [3 1 1 .85 5 25 0 0 0 0];%	  0.3553    		  		    0.3553   34.0033
	% Vp(end+1,:) = [3 2 1 .85 5 25 0 0 0 0];%	  0.8264    0.6542    0.7520    0.7442   54.7013
	% Vp(end+1,:) = [3 3 1 .85 5 25 0 0 0 0];%	  0.7448    0.7255    0.7905    0.7536   88.9173
	% Vp(end+1,:) = [3 4 1 .85 5 25 0 0 0 0];%	  0.6857    0.5446    0.5856    0.6053   32.4213  


	% DataSet 3(MSRactionReal) - Por Protocolo - Bag of Features
	%									  AS1		AS2		  AS3		Mean	 Time
	% Vp(end+1,:) = [3 1 2 .85 20 40 0 0 0 0];  % 0.5788    				    0.5788   65.5405
	% Vp(end+1,:) = [3 2 2 .85 20 300 0 0 0 0]; % 0.9364    0.8814    0.9596    0.9258   417.1713
	% Vp(end+1,:) = [3 3 2 .85 20 40 0 0 0 0];  % 0.8621    0.6928    0.8851    0.8133   187.7315
	% Vp(end+1,:) = [3 4 2 .85 20 40 0 0 0 0];
	



	% Next tests
	Vp = [];
	%Vp(end+1,:) = [2 2 2 .85 100 10 0 0 0 0];

	%Vp(end+1,:) = [2 1 1 .85 5 25 0 0 0 0];
	Vp(end+1,:) = [2 2 1 .85 5 25 0 0 0 0];


	Vp(end+1,:) = [2 1 2 .85 20 40 0 0 0 0];
	Vp(end+1,:) = [2 2 2 .85 20 40 0 0 0 0];
	
	R = [];


	for i = 1:size(Vp,1) %Run tests Vector parameters


		objP.dataset  = Vp(i,1);
		p = Vp(i,2);
		objP.strategy = Vp(i,3); 
		objP.cut_ske_perc = Vp(i,4);
		objP.d = Vp(i,5);
		objP.k1 = Vp(i,6);
		objP.k2 = Vp(i,7);
		objP.habilitateSparseCoding = Vp(i,8);
		objP.n_it_sc = Vp(i,9);
		objP.tuningSvm = Vp(i,10);

		objP.createFileMatrizConfusao(13);

		tic
		filename = strcat('dt',num2str(objP.dataset),'_protocol_',num2str(p),'(objPtc,objP)');
		result = eval(filename);

		%Log Result
		[objP.dataset p objP.strategy result toc]
		R(end+1,:) = [Vp(i,:) result toc];
		save(name_file_result,'R');

	end