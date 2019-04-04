function distanceMatrix(M)
	t = 0.05;
	[n nj nj] = size(M); 
	
	for i = 1:n
		MT = reshape(M(i,:,:),nj,nj);
		surf(MT);axis([1 nj 1 nj]);
		pause(t);
	end
