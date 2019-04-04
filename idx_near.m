function idx_sel = idx_near(FA2,C1,ps)
	n = size(FA2,1);
	idx_sel = zeros(n,1);

	for(f=1:n) %Percorre frames da ação
		Distance = [];
		for(j = 1:ps) %Percorre todos os cluster (poses salientes)
			Distance(j) = norm( FA2(f,:) - C1(j,:) );
		end
		[val cluster] = min(Distance); %Detecta cluster mais próximo.

		idx_sel(f) = cluster; %Armazena o indice do cluster mais próximo do frame investigado.
	end
	