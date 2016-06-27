function out = JTeste(x)
	
	center = [1 1 1 1 1 1 1 1 1 1];
	
	out = 1/10 * sqrt(sum((x - center).^2));
end