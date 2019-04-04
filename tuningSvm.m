function z = tuningSvm(BF,Y)

	n = size(Y,1);

	c = cvpartition(n,'KFold',10);
	minfn = @(z)kfoldLoss(fitcsvm(BF,Y,'CVPartition',c,...
	'KernelFunction','rbf','BoxConstraint',exp(z(2)),...
	'KernelScale',exp(z(1))));
	opts = optimset('TolX',5e-4,'TolFun',5e-4);

	m = 20;
	fval = zeros(m,1);
	z = zeros(m,2);
	for j = 1:m;
	    [searchmin fval(j)] = fminsearch(minfn,randn(2,1),opts);
	    z(j,:) = exp(searchmin);
	end
	[v arg] = min(fval);
	z = z(arg,:);
	