function q = checkDiagonal(V)
	q = 0;
	C = zeros(1,length(V));
	
	for i =1:length(V) - 1 
		
		C = circshift(V,[0 -i]);
		
		
		if sum( abs(C(1:end-i) - V(1:end-i)) == i) ~= 0
			q = sum( abs(C(1:end-i) - V(1:end-i)) == i);
			break;
		end

% 	if abs(V(i) - V(k)) == (i-k)
% 		q = q+1;
% 	end


	end
	
end

