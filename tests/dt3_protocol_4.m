% Half Subject AS1 AS2 AS3
function result = dt3_protocol_4(objPtc,objP)
		%Run the test of subsets classes (AS1,AS2,AS3);
		for a = 1:3
			objPtc.setMSRActionProtocol_4(a);
			result(a) = main(objPtc,objP);
		end
		result = [result mean(result)];