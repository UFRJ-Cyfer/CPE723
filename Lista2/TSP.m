function out = TSP(X,C)
		
	O = C;
	aux = C;
	
	for i=1:length(O)
		O(i) = aux(X(i));
	end

	aux = circshift(O,1);
	A = O-aux;
	A = A.^2;
	
	out = sum( sqrt(sum(A,2)) );

end