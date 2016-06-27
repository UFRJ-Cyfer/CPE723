function Distances = Conversor(Cidades)
Distances= zeros(10,10);

for i=1:10
	for j=1:10
		Distances(i,j) = sqrt(sum((Cidades(i,:) - Cidades(j,:)).^2,2));
	end
end

end