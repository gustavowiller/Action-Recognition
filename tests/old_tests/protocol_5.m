	%One out of ten
	cd ..
	MCs = zeros(20,20,10);
	for j = 1:10
		MC = main(Afull,S(j,:),Efull,dataset,ps,d,TMFC,strategy);
		disp(strcat(num2str(j),' - ',num2str(sum(diag(MC))/sum(sum(MC)))));
		MC_global = MC_global + MC;
		MCs(:,:,j) = MC;
	end								

	result = strcat(' Media=',num2str( sum(diag(MC_global))/sum(sum(MC_global)) ),'\n\n');