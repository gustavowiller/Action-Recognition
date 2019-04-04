function best_action = classificatorTest(BF_one_of_class_action,L)
	for a = 1:L
		%A2 = A( logical(del_clu(a,:)) ) = 0; %Filter cluster (null not work)
		filename = strcat('data/classificator/',num2str(a,'%02i'),'.mat');	
		load(filename,'svmStruct');
		[~,confidence(a,:)] = predict(svmStruct,BF_one_of_class_action);
		clear('svmStruct');
	end
	[var best_action] = max(confidence(:,2));