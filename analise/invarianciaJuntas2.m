function invarianciaJuntas2(dataset)

	filename = strcat('../data/config/descriptor_pose_',num2str(dataset),'.mat');
	load(filename);

	MVar = var(M);


	
	plot(MVar);
	max(MVar)