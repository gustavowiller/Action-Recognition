function [F med u]=pcaTrain(M,d)
	[n,p]=size(M);
	F=[];
	med=mean(M,1);

	for i=1:n
	    M(i,:)=M(i,:)-med;
	end

	C=(M)'*(M)/n; %Covariance matrix from M;
	[u,s,v]=svd(C); %Singular value decomposition;
		        	%u é matriz de autovetores
		        	%s tem na diagonal, os autovalores
	%plot(diag(s));pause;
	F=M*u(:,1:d);	%projeta os vetores dim400 no autoespaço definido por 3 componentes principais 



	%Data Log
	autovalores = diag(s);
	save('log/pcaTrain.mat','autovalores');
