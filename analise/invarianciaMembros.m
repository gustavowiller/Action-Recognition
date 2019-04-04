load('../descritor_pose/distance_matrix_MSRAction.mat');

n = size(M,1)

%juntas que representamentam membros
	J=[20     1     2     1     8    10     2     9    11     3     4     7     7     5     6    14    15    16    17;
	    3     3     3     8    10    12     9    11    13     4     7     5     6    14    15    16    17    18    19];

SM = zeros(10,19);
for a =1:10
	idx_act_subj = find(D(:,2)==a);
	M2 = M( idx_act_subj ,:,:);
	
	for j = 1:19
		SM(a,j) = var( M2(:,J(1,j),J(2,j)) );
	end
end