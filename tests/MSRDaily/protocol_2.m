% In Protocol 2, a 3-fold
% cross-validation is adopted with 1/3 of the data used for testing
% the models and 2/3 for training purposes (3F-1:2)
function result = protocol_2(objPtc,objP)		
		for a = 1:3
			for e = 1:3
				objPtc.setProtocol_2(a,e);
				result_example(e) = main(objPtc,objP);
			end
			result(a) = mean(result_example);
		end