	filename = strcat('../descritor_pose/distance_matrix_',num2str(dataset),'.mat');
	load(filename,'M');
	M0 = M; 
	M0= reshape(M0,22077,400);

	filename = strcat('../data/config/descriptor_pose_',num2str(dataset),'.mat');
	load(filename,'M');	

	average0 = mean(M0,2); %Average of all skeletons before normalization by subject
	average1 = mean(M,2); %Average of all skeletons after normalization by subject.

	data_0 = average0 - mean(average0);
	data_1 = average1 - mean(average1);

	plot([data_1 data_0])
	legend('after','before')