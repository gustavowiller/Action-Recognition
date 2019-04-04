%One out of ten
function result = dt2_protocol_2(objPtc,objP)
	for s = 1:10
		objPtc.setMSRDailyProtocol_2(s);
		result_subject(s) = main(objPtc,objP);
	end
	result = mean(result_subject);
