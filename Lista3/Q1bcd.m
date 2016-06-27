function [p, Z, D, Y] = Q1bcd(x,y,T)

	p = zeros(length(y),length(x));
	Y = zeros(size(p,1),1);
	dist = p;
	Z = zeros(1,length(x));
	
	for j=1:size(p,2)
		for i=1:size(p,1)
				p(i,j) = exp(-(x(j)-y(i))^2/T);	
				dist(i,j) = (x(j) - y(i))^2;
		end

		Z(j) = sum(p(:,j));
		p(:,j) = p(:,j)/Z(j);
		Y(:,j) = p(:,j)*x(j);
	end
	
	Y = sum(Y,2);
	Y = Y./sum(p,2);
	sum(p,2)
	

 D = 1/length(x) * sum(sum(p.*dist,2),1);

end