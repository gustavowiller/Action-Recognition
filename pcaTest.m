%Apply PCA to data testes, and the variables med and u, are the same of PCA training.
function F = pcaTest(M,d,med,u)
	[n,p]=size(M);

	for i=1:n
	    M(i,:)=M(i,:)-med;
	end
		        
	F=M*u(:,1:d);
end
