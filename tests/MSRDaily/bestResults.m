function bestResults
	addpath '../MSRAction'

	objPtc = classProtocol;
	objP = classParamProgram;
	cd ../../


	%Vetor de Parametros - DataSet 3 - Por Protocolo - Action Graph - Modelagem Gráfica
	%									  AS1		AS2		  AS3		Mean	 Time
	Vp(3,1,1,:) = [.85 5 25 0 0 0 0];%	  0.3553    0.3553    0.3553    0.3553   34.0033
	Vp(3,2,1,:) = [.85 5 25 0 0 0 0];%	  0.8264    0.6542    0.7520    0.7442   54.7013
	Vp(3,3,1,:) = [.85 5 25 0 0 0 0];%	  0.7448    0.7255    0.7905    0.7536   88.9173
	Vp(3,4,1,:) = [.85 5 25 0 0 0 0];%	  0.6857    0.5446    0.5856    0.6053   32.4213  


	%Vetor de Parametros - DataSet 3 - Por Protocolo - Bag of Features
	%									  AS1		AS2		  AS3		Mean	 Time
	Vp(3,1,2,:) = [.85 20 40 0 0 0 0];  % 0.5788    0.5788    0.5788    0.5788   65.5405
	Vp(3,2,2,:) = [.85 20 300 0 0 0 0]; % 0.9364    0.8814    0.9596    0.9258   417.1713
	Vp(3,3,2,:) = [.85 20 40 0 0 0 0];  % 0.8621    0.6928    0.8851    0.8133   187.7315
	Vp(3,4,2,:) = [.85 20 40 0 0 0 0];
	
	for dt = 3 %Dataset 
	for p = [4] %Protocolo
	for st = 1 %Strategy

		objP.dataset = dt;
		objP.cut_ske_perc = Vp(dt,p,st,1);
		objP.strategy = st; 
		objP.d = Vp(dt,p,st,2);
		objP.k1 = Vp(dt,p,st,3);
		objP.k2 = Vp(dt,p,st,4);
		objP.habilitateSparseCoding = Vp(dt,p,st,5);
		objP.n_it_sc = Vp(dt,p,st,6);
		objP.tuningSvm = Vp(dt,p,st,7);

		tic
		filename = strcat('protocol_',num2str(p),'(objPtc,objP)');
		result = eval(filename);

		[dt p st result mean(result) toc] 
	end
	end
	end