	% In Protocol 1, a cross-subject
	% validation over the entire set of classes is performed.Cross Subject
	% the subject splitting of the
	% data in training and test set is as follows: subjects 1, 3, 5, 7, and
	% 9 for training, the others in test (HS-V protocol).

	dataset = 3; 
	d = 5;
	TMFC = 0;
	S = [1 0 1 0 1 0 1 0 1 0];

	cd .. 
	[V DA] = main(Afull,S,Efull,dataset,100,d,TMFC,1);
	nA = size(DA,1); %Number actions

	R(:,1) = DA(:,1);
	R(:,2) = V;
	R(:,3) = main(Afull,S,Efull,dataset,300,d,TMFC,1);
	R(:,4) = main(Afull,S,Efull,dataset,100,d,TMFC,2);
	R(:,5) = main(Afull,S,Efull,dataset,150,d,TMFC,2);
	R(:,6) = mode(R(:,[2:5]),2);

