function matrixTransition(idx,D,k,L)

	G = ones(k,k,L)*0.00000000000000001;
	n = size(idx,1);

	%Construindo a matrix de transição com as n classes de ação. 
	for i=1:n-1
		if D(i,4) == D(i+1,4) %Enquanto as transições for da própria sequencia de ação. | ignora os limites. 
			G(idx(i),idx(i+1),D(i)) = G(idx(i),idx(i+1),D(i)) + 1;
		end
	end	
	
	%%%%%%%
	%SIMPLIFICAR ESSA NORMALIZACAO<<
	%
	%%%%%%%

	%Normalizacao
	for ac=1:L
		for i=1:k
			vsum = sum(G(i,:,ac));
			for (j=1:k)
				G(i,j,ac) = G(i,j,ac)/vsum;		
			end
		end
		%T = reshape(G(:,:,ac),k,k);surf(T);axis([1 k 1 k]);pause(1/5);
	end

	%Save graph actions
	delete('data/action_classes_transition/*');
	for(a = 1:L)
		filename = strcat('data/action_class_transition/',num2str(a,'%02i'),'.act');	
		fileID = fopen(filename,'w');
		for(i = 1:k)
			fprintf(fileID,'%d \t',G(i,:,a));	
			fprintf(fileID,'\n');	
		end
		fclose(fileID);
	end
end
