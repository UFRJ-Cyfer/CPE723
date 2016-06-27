function out = Custo(x,D)
	
	out = 0;
	for i=1:length(x)-1
		out = out + D(x(i),x(i+1));
	end
	
 	out = out+ D(x(length(x)), x(1));

end