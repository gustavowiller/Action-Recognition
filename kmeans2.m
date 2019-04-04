function [idx C] = kmeans2(X,k,maxIter)
	
	if(~k)
		idx = [];
		C = [];
		return;
	end

	[n d] = size(X);	

	idx = zeros(n,1);
	z = 0; %Contador de iterações.
	rate_error_conv = 10^-3;
	

	for j=1:k
            C(j,:)=X(round(min(j*n/k+1,n)),:);
    end


    accum1=10^9;
	MD = zeros(n,k);
	for (i = 1:d)		
		X1(:,:,i)=repmat(X(:,i),[1,k]);
	end

	while(z<maxIter)
		z = z+1;
		%Calculate point euclidian distance to all clusters.
		for(i = 1:d)
			C1(:,:,i)=repmat(C(:,i),[1,n])';
		end
		MD=sum(abs(X1-C1),3); % Metrica da soma
%		C1=C1-X1; MD=C1(:,:,1).^2+C1(:,:,2).^2+C1(:,:,3).^2; % Metrica Euclidiana

		%Points Group by nearest cluster. 
        val = min(MD');
		accum2 = sum(val);
		for i = 1:n
			[val k_nearest] = min(MD(i,:));
			%Realiza a movimentação de pontos entre clusters - e atualiza a quantidade do cluster. 		
			idx(i) = k_nearest;
		end

		
		%Calculate mean point of cluster.  
		for i = 1:k
	    	C(i,:) = mean(X(idx==i,:),1);
		end

		rate_conv = 1-(accum2/accum1);
        accum1=accum2;
		if(rate_conv < rate_error_conv)
			break;
		end

	end;
	
	save('log/kmeans2.mat','z');