function [MC med] = covarianceMatrix(V)
	
	MC = [];
	n = size(V,1);
	m = size(V,2);
	med = mean(V,1);

	if(n<=1)
		disp('Error - N=1 - Null Covariance');
		return;
	end

	%Normalize	
	for i=1:n
    	V(i,:) = V(i,:)-med;
    end

	%Formula Covariance
	MC = (1/n)*V'*V;


	

%	[s u v]=svd(MC);


%	if (u(2,2)/u(1,1)<0.01)
%		if (u(2,2)/u(1,1)<0.5 || u(m,m)/u(1,1)<0.001)
%			u(2,2)/u(1,1)
%			u(m,m)/u(1,1)
%			plot(diag(u))
%			pause
% 	  		MC=s*eye(m)*v'*mean(diag(u));
%			[s2 u2 v2] = svd(MC);
%		plot(diag(u2));
%		pause
%		end
%	end

	%Codigo retirado do validate cluster
		%for j=1:ps
	%	Cj = reshape(C(j,:,:),d,d);
        %       [s u v]=svd(Cj);
	%	VMeanDet(j,:) = diag(u);
	%	%VMeanDet(j) = det(Cj);
	%end
	%save('data_debug/VMeanDet.mat','VMeanDet')
