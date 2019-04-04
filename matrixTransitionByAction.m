function VT = matrixTransitionByAction(idx_sel,k)

	if(~k)
		VT = [];
		return;
	end

	%Construção da matriz de transição de tamanho kxk.
	MT = zeros(k,k); %Inicialmente as transições entre ações são nulas.
	n = size(idx_sel,1); %Quantidade de poses/frames da ação.

	%Construindo a matrix de transição percorrendo cada pose da ação. 
	for i=1:n-1 %A variavel i representa o indice de cada pose
		MT(idx_sel(i),idx_sel(i+1)) = MT(idx_sel(i),idx_sel(i+1)) + 1;%A cada transição de pose, é somado mais um, no campo referente da ação dentro da matriz. 
	end
	MT = normalization(MT); %É feita uma normalização da matriz de transição.
	VT = reshape(MT,1,k^2); %Transforma a matriz em um vetor de transicao
end
