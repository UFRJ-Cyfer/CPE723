	
T = [1 0.1 50]; C = [3 3.4];
x = [0 4 6 9];
figure;
for i=1:length(T)
	
	[p, Z, D, Y] = Q1bcd(x,C,T(i));
	
	hold on
	plot(Y(1,1),Y(2,1),'x','MarkerSize',20, ...
		'LineWidth',2);
	
	
end

hold off