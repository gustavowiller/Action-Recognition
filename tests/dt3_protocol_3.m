% In Protocol 3, a
% 3-fold cross-validation is adopted with 2/3 of the data used for
% testing the models and 1/3 for training the models (3F-2:1).
function result = dt3_protocol_3(objPtc,objP)
		for a = 1:3
			for e = 1:3
				objPtc.setMSRActionProtocol_3(a,e);
				result_example(e) = main(objPtc,objP);
			end
			result(a) = mean(result_example);
		end
		result = [result mean(result)];