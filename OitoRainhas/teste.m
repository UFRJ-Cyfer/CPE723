	for k=1:PopSize
% 		q(k) = checkDiagonal(X(k,:))
% 		if ~(q(k))
% 			x_sol = [x_sol; X(k,:)];
% 		end

	q(k) = checkDiagonal(x_sol(k,:));
	end
	
	q