%% DA: Calculates centroids and returns cost
function [x1, x2, c1, c2, D] = Q1(x, t)

	x1 = []; x2 = []; c1=[]; c2 = []; o=1;

	for i=1:length(t)
		for k=1:length(x)
			
			if(x(k) > t(i))
				x2(o) = x(k);
				o = o+1;
			end


		end
		o = 1;
			x1 = setdiff(x,x2);
			c1(i) = sum(x1)/length(x1);
			c2(i) = sum(x2)/length(x2);
			D(i) = 1/length(x) *( sum( (x1-c1(i)).^2) + sum((x2-c2(i)).^2 ));

end




