function covarianceMatrixSave(MC,med,idx)
	filename = strcat('data/cov/',num2str(idx,'%02i'),'.cov');	
	fileID = fopen(filename,'w');

	n = size(MC,1);
	fprintf(fileID,'%f \t',med);
	fprintf(fileID,'\n');
	for(i = 1:n)
		fprintf(fileID,'%f \t',MC(i,:));
	 	fprintf(fileID,'\n');
	end
	fclose(fileID);
end
