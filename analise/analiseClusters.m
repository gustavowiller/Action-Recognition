function analiseClusters
	load('../data/config/kmeans2.mat'); 
	load('../data/config/parameters.mat','ps');
	
	V = zeros(ps,1);
	n = size(idx);
	for i = 1:n 
		V(idx(i)) = V(idx(i)) + 1; 
	end
	disp(strcat('kmeans: ',num2str(min(V)),' _ ',num2str(mean(V)),' _ ',num2str(max(V)) ));
	%plot(V);