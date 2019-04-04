% DA(1,:) = [a s e c i0 i];
% a = action (last action)
% s = Subject (last action)
% e = example (last action)
% c = código da ação (last action)
% i0 = posição inicial
% i = Posição final
%
% D(1,:) = [a s e c];
%
function DA = sequenceActions(D)
	n = size(D,1);
	i0 = 1;
	DA = [];
	D(end+1,4)=-1;%Incluir o "ultimo" frame para servir de ponto de parada.

	%Percorre todas as posições do vetor 'D', que se refere ao conjunto de sequencias de poses. e inclue em para cada sequencia de pose, a posiçõa de inicio de frame e a posição da ultima frame, em relação a matriz M.
	%Estrutura: DA = [ClasseAção N_InicioFrame N_UltimaFrame]

	for(i = 1:n)
		if(D(i,4) == D(i+1,4))
			continue;
		end
		DA(end+1,:) = [D(i,:) i0 i];		
		i0 = i + 1;
	end