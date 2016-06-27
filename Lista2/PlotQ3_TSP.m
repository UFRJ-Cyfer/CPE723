function PlotQ3_TSP(Xmin,Cidades)

	figure;
scatter(Cidades(:,1),Cidades(:,2))
labels = cellstr(num2str([1:10]'));
text(Cidades(:,1), Cidades(:,2), labels, 'VerticalAlignment','bottom', ...
                             'HorizontalAlignment','right')
hold on

size = length(Xmin);
for i=1:size
	
	if i~=size
	line([Cidades(Xmin(i),1) , Cidades(Xmin(i+1,+1),1)],[Cidades(Xmin(i),2),...
		Cidades(Xmin(i+1),2)]);
	else
		line([Cidades(Xmin(size),1) , Cidades(Xmin(1,+1),1)],[Cidades(Xmin(size),2),...
		Cidades(Xmin(1),2)]);
	end
end


hold off

end