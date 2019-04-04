function [M1 D1 M2 D2] = dividePosesToTrainingAndTest(Ptc,M,D)
	NewLabelAction = cumsum(Ptc.A);
	[n,p] = size(M);
		
	%Matrix of skeleteons
	M1 = zeros(n,p); %training
	M2 = zeros(n,p); %others
	D1 = zeros(size(D));
	D2 = zeros(size(D));
	j1 = 0;
	j2 = 0;
	
	for i = 1:n
		%Verifica se a ação entra no conjunto de (treinamento e testes) 
		if( Ptc.A(D(i,1)) )
			D(i,1) = NewLabelAction(D(i,1));
		else
			continue;		
		end

		%Verify subject or example pertaining at group training;.
		if( Ptc.S(D(i,2)) && Ptc.E(D(i,3)) ) 
			j1 = j1 + 1;
			M1(j1,:) = M(i,:);			
			D1(j1,:) = D(i,:); 
		else
			j2 = j2 + 1;
			M2(j2,:) = M(i,:);
			D2(j2,:) = D(i,:);
		end
	end
	
	%delete rows with zeros; 
	M1 = M1(1:j1,:);
	M2 = M2(1:j2,:); 
	D1 = D1(1:j1,:);
	D2 = D2(1:j2,:);
