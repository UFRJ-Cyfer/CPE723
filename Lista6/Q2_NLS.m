%% Algoritmo Genetico Simples Q1
clear all
for runs= 1:10
PopSize = 100;

% rng(0,'twister');
% ss = rng;

GEN = 1000;
CMax = 0;
L = 25;

x = randi([0 1], PopSize,L);
Pais = zeros(size(x));
gen = 0;


while CMax~=L

Custo = sum(x,2);

 %busca local
%  for k=1:PopSize
% 	 Pos = randi(L);
% 	 Neighbor = x(k,:);
% 	 Neighbor(Pos) = 1 - Neighbor(Pos);
% 	 if sum(Neighbor) > Custo(k)
% 		 x(k,:) = Neighbor;
% 		 Custo(k) = sum(Neighbor);
% 	 end
% 	 
%  end

[CmaxAux, jMax] = max(Custo); 
    if (CmaxAux > CMax) 
        CMax = CmaxAux;
        xMax = x(jMax,:);
	end
	
	if CmaxAux == L
		break
	end

Custo = Custo/sum(Custo);
CumCusto = cumsum(Custo);

% selecao de pais no SUS
r = rand()/PopSize;
index = 1;
nPais = 1;
while nPais <= PopSize
	while r <= CumCusto(index)
		Pais(nPais,:) = x(index,:);
		r = r+1/PopSize;
		nPais = nPais+1;
	end
	index = index+1;	
end

%Recombinação de 1 bit
for p=1:PopSize/2
    if (rand < 0.7)
            
            Pos = randi(L);
            Aux = Pais(2*p-1,Pos);

            Pais(2*p-1,Pos) = Pais(2*p,Pos);
            Pais(2*p,Pos) = Aux;        
        
    end
end

%Mutação - Inversão de 1 bit
 for pp=1:PopSize
       
        if rand < 1/L*10
            k = randi(L);
            Pais(pp, k) = 1 - x(pp, k);
        end
 end
  
 x = Pais;
 
 
 
 gen = gen+1;
 

end
	generations(runs) = gen;

	
	
end

	meanG = mean(generations);
	
	figure;
	stem(generations);
	MeanJ = mean(generations);
	refline(0,meanG);
	xlabel('Runs') % x-axis label
	ylabel('Generations') % y-axis label
	title('Generations Needed to Maximize Without Local Search')
	legend('Cost','Average Cost')
	StdJ = std(generations)

