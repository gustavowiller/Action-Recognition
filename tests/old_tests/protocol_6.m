	%Pack One out of Ten
	MC_global = zeros(8,8);
	cd ..
	for a = 1:3
		for j = 1:10
			MC = main(A(a,:),S(j,:),Efull,dataset,ps,d,TMFC,strategy);
			ind = (a-1)*10+j;
			R(ind) = sum(diag(MC))/sum(sum(MC));
			MC_global = MC_global + MC;
		end
	end

	result = strcat(' AS1=',num2str(mean(R(1:10))),...
			' AS2=',num2str(mean(R(11:20))),...
			' AS3=',num2str(mean(R(21:30))),...
			' Media=',num2str(mean(R)),'\n\n');