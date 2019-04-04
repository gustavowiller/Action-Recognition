function confusionMatrix(MConf)
	%load('../data/debug/confusionMatrix.mat','MConf');
	[d d] = size(MConf);
	surf(MConf);
	title('Matriz de confusão');
	xlabel('Previsto')
	ylabel('Real')
	axis([1 d 1 d]);
