%M 			- Matriz
%idx_col_del - Indice contendo valores binários, que representa as colunas que seram deletadas.
%M2 		- Nova matriz, contendo menos colunas, se for deletado um ou mais colunas.
function M2 = applyFilterDimension(M,cut_min)

	%Analisa a variancia das colunas
	[n d] = size(M); 
	idx_minor_col = zeros(1,d); %Indice que representa quais colunas possuem menor variancia do que a taxa mínima.. para serem utilizado para deletar essas colunas.
	var_d = var(M); %Variação de cada coluna da matriz.

	for j=1:d %J recebe o indice de cada coluna
		if(var_d(j)<=cut_min) %Verifica se a variação é menor que a taxa mínima estipulada
			idx_minor_col(j) = 1; %Sinaliza o indice da coluna com menor variância do que a taxa mínima.
		end
	end
	%Log data
	number_colums_before = d;


	[n d] = size(M);
	qtd_col_delete = sum(idx_minor_col);% Quantidade de colunas a serem deletadas
	M2 = zeros(n,d-qtd_col_delete);% A nova matriz contera o numero de colunas da antiga menos a quantidade a ser deletada pelo algoritmo
    j2 = 1; %indice da nova coluna da matriz M2
	for j = 1:d %Cada j representa o indice da coluna da matriz M
		if(~idx_minor_col(j)) %Verifica se a coluna da matriz M permanece.
			M2(:,j2) = M(:,j); %Copia a coluna da matriz M para uma nova coluna da matriz M2
			j2 = j2+1;
		end
	end


	%Log data
	number_colums_after = d-qtd_col_delete;
	save('log/applyFilterDimension.mat','number_colums_before','number_colums_after');