function result = protocol_4(objPtc,objP)
		%Run the test of subsets classes (AS1,AS2,AS3);
		for a = 1:3
			objPtc.setProtocol_4(a);
			result(a) = main(objPtc,objP);
		end