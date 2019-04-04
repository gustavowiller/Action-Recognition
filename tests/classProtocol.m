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
	
		SubjectHalf = [1 0 1 0 1 0 1 0 1 0]; %Escolha dos sujeitos de acordo com o protocolo 4

		Afull = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
		Ga = 	[0,1,1,0,1,1,0,0,0,1,0,0,1,0,0,0,0,1,0,1;
				1,0,0,1,0,0,1,1,1,0,1,1,0,1,0,0,0,0,0,0;
				0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,1,1,1,1,1];


		%Both Dataset: MSRAction | MSRDaily
		%Matrix of Subjects to used: one out of ten
		S_Matrix_one_ten = [0,1,1,1,1,1,1,1,1,1;
							1,0,1,1,1,1,1,1,1,1;
							1,1,0,1,1,1,1,1,1,1;
							1,1,1,0,1,1,1,1,1,1;
							1,1,1,1,0,1,1,1,1,1;
							1,1,1,1,1,0,1,1,1,1;
							1,1,1,1,1,1,0,1,1,1;
							1,1,1,1,1,1,1,0,1,1;
							1,1,1,1,1,1,1,1,0,1;
							1,1,1,1,1,1,1,1,1,0;
							1,1,1,1,1,1,1,1,1,1;];
		Sfull = [1 1 1 1 1 1 1 1 1 1];

		%Dataset Daily Actions
		%Example
		E_MSRDaily 		= [1,0;
					  	   0,1];
		EfullMSRDaily 	=  [1,1];
		
		AfullMSRDaily = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
		A13MSRDaily = [1 1 1 0 1 1 1 1 1 1 1 1 0 1 0 1];
	


	end
	methods
		%Dataset - MSRAction

		%Half Subject
		function obj = setMSRActionProtocol_1(obj)
			obj.A = obj.Afull;
			obj.S = obj.SubjectHalf;
			obj.E = obj.Efull;
		end
		
		% In Protocol 2, a 3-fold
		% cross-validation is adopted with 1/3 of the data used for testing
		% the models and 2/3 for training purposes (3F-1:2)
		function obj = setMSRActionProtocol_2(obj,a,e)
			obj.A = obj.Ga(a,:);
			obj.S = obj.Sfull;
			obj.E = obj.ExampleP2(e,:);
		end
		
		% In Protocol 3, a
		% 3-fold cross-validation is adopted with 2/3 of the data used for
		% testing the models and 1/3 for training the models (3F-2:1).
		function obj = setMSRActionProtocol_3(obj,a,e)
			obj.A = obj.Ga(a,:);
			obj.S = obj.Sfull;
			obj.E = obj.ExampleP3(e,:);
		end

		% Half Subject AS1 AS2 AS3		
		function obj = setMSRActionProtocol_4(obj,a)
			obj.A = obj.Ga(a,:);
			obj.S = obj.SubjectHalf;
			obj.E = obj.Efull;
		end
		


		%---Dataset - MSRDaily----

		%Half Subject
		function obj = setMSRDailyProtocol_1(obj)
			obj.A = obj.A13MSRDaily;
			obj.S = obj.SubjectHalf;
			obj.E = obj.EfullMSRDaily;
		end

		%One out of Ten
		function obj = setMSRDailyProtocol_2(obj,s)
			obj.A = obj.A13MSRDaily;
			obj.S = obj.S_Matrix_one_ten(s,:);
			obj.E = obj.EfullMSRDaily;
		end
	end
end