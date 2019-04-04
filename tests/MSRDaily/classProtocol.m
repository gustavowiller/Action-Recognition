classdef classProtocol < handle
	properties
		A; %Action selected
		S; %Subject selected
		E; %Example selected
	end
	properties (Constant)
		Efull =  [1 1 1]; %Todos os exemplos ativos
		ExampleP2 = [0 1 1;	 % In Protocol 2, a 3-fold
					 1 0 1;	 % cross-validation is adopted with 1/3 of the data used for testing
					 1 1 0]; % the models and 2/3 for training purposes (3F-1:2)
 		ExampleP3 = [0 0 1;  % In Protocol 3, a
					 0 1 0;  % 3-fold cross-validation is adopted with 2/3 of the data used for
					 1 0 0]; % testing the models and 1/3 for training the models (3F-2:1).
	
		Sfull = [1 1 1 1 1 1 1 1 1 1];
		SubjectHalf = [1 0 1 0 1 0 1 0 1 0]; %Escolha dos sujeitos de acordo com o protocolo 4

		Afull = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
		Ga = 	[0,1,1,0,1,1,0,0,0,1,0,0,1,0,0,0,0,1,0,1;
				1,0,0,1,0,0,1,1,1,0,1,1,0,1,0,0,0,0,0,0;
				0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,1,1,1,1,1];

	end
	methods
		function obj = setProtocol_1(obj)
			obj.A = obj.Afull;
			obj.S = obj.SubjectHalf;
			obj.E = obj.Efull;
		end
		function obj = setProtocol_2(obj,a,e)
			obj.A = obj.Ga(a,:);
			obj.S = obj.Sfull;
			obj.E = obj.ExampleP2(e,:);
		end
		function obj = setProtocol_3(obj,a,e)
			obj.A = obj.Ga(a,:);
			obj.S = obj.Sfull;
			obj.E = obj.ExampleP3(e,:);
		end
		function obj = setProtocol_4(obj,a)
			obj.A = obj.Ga(a,:);
			obj.S = obj.SubjectHalf;
			obj.E = obj.Efull;
		end
	end
end