function descritorPose
	t = 0.01;
	load('../data/descriptor/3.mat');

	[n d] = size(M); 
	maxvalue = max(max(M));
	for i = 1:n
		plot(M(i,:));
		title( strcat('descritor Pose - Ação:',num2str(D(i)),' Sujeito:',num2str(D(i,2)),' Exemplo:',num2str(D(i,3))));
		axis([1 d 1 maxvalue*1.2])
		pause(t);
		pause
	end
