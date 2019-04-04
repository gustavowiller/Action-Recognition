function result = protocol_3(objPtc,objP)
		for a = 1:3
			for e = 1:3
				objPtc.setProtocol_3(a,e);
				result(a) = main(objPtc,objP);
			end
		end