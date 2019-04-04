function invarianciaJuntas(dataset)
	filename = strcat('../descritor_pose/distance_matrix_',num2str(dataset),'.mat');
	load(filename);

	MVar = reshape(var(M),20,20);

	
	surf(MVar);
	figure;
	plot(sum(MVar));
	max(max(MVar))

