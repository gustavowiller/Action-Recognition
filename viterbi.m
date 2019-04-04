function argmax = viterbi(E,ps,L)
	[n d] = size(E);%n -> numero de frames do teste E
	
	%probability Position Cluster
	P = zeros(n,ps);% Matrix of Probability E - V
	[C V] = covarianceMatrixLoad(ps);

	for(i=1:n)
		for(j=1:ps)
			Cj = reshape(C(j,:,:),d,d);
			P(i,j) = exp( -.5 * (E(i,:) - V(j,:)) * inv(Cj) * (E(i,:) - V(j,:))');% / ((2*pi)^(d/2)*sqrt(det(Cj)));
		end		
	end
	%surf(P) pause
	
	Z = zeros(L,n);
	Zmax = zeros(1,L);

	for k = 1:L
		D = zeros(ps,n);
		
		for j=1:ps
			D(j,1) = P(1,j);  		
		end	
		%Z(k,1) = max(D(:,1));
 
		%Load the Matrix Transition
		file_mt = sprintf('data/action_class_transition/%02i.act',k);
		MT = load(file_mt);

		for i = 2:n
			for j=1:ps				
				D(j,i) 	= max( D(:,i-1) .* MT(:,j)  )*P(i,j);		
			end
			Z(k,i) = max(D(:,i));
		end	
	end	
	
	%Normalize, to show matrix and evident the max values of colums
	for(i = 2:n)
		vsum = max(Z(:,i));
		Z(:,i) = Z(:,i) ./ vsum;
	end	
	%surf(Z); axis([1 n 1 L]);pause;
	
	%Run last choices Z and save the most evident choice.
	for(i = round(.7*n) : n )
		[value argmax] = max(Z(:,i));
		Zmax(argmax) = Zmax(argmax) + 1;
	end
	[value argmax] = max(Zmax);
end
