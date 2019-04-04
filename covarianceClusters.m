function covarianceClusters(F,idx,k)

	%Sort Vector by clusters 
	[n d] = size(F);
	FC = zeros(n,d,k);
	for i=1:n
		FC(i,:,idx(i)) = F(i,:);
	end

	delete('data/cov/*.cov'); %delete all files folder data_cov	

	%Percorre todos os clusters para criar os modelos de observação	
	for i = 1:k
		V = FC(:,:,i); %Seleciona todas as poses do cluster
		V(all(V==0,2),:) = []; %Remove as linhas nulas.
		[MC med] = covarianceMatrix(V);% Cria matriz de covariância
		covarianceMatrixSave(MC,med,i);% Save
	
		%debug
		VMeanDet(i) = det(MC);
	end
end
