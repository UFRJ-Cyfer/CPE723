%% Questão 3 Problema do Caixeiro Viajante

	%Método do Algoritmo de Metrópolis.

%Inicialização de parâmetros
clear;

K = 1000;
N = 1000; n = 0; k = 0; x_out = zeros(10,N*K); fim =1; 
NumeroCidades = 10; T = 0.1;

J_out = zeros(N*K,1);
J = J_out;

EndPoints = zeros(10,2);

%Criação de uma seed para sempre ter o mesmo setup de cidades.
rng(1,'twister');
ss = rng;
Cidades = rand(NumeroCidades, 2);
Distances = Conversor(Cidades); % Converte a posicao das cidades em uma
								% matriz n x n com as distâncias.

%Geração dos números aleatórios para comparar com q.
r = rand(1,N*K+1);

%Inicialização do caminho Inicial.
x = randperm(10);
x = x';

Jmin = 100;
	l = 0;


while(fim)
	
	n = n+1;
	
% 	change = randi(10);
% 	x_1 = x;
% 	a = x_1(change);						
% 	x_1(change) = x_1(rem(change+1,10)+1);
% 	x_1(rem(change+1,10)+1) = a;

	aux = randperm(10);
	aux = aux';

	x_out(:,n) = aux;
	x_1 = aux;

	J(n) = Custo(x,Distances);
	J(n+1) = Custo(x_1,Distances);


	DJ = Custo(x_1,Distances) - Custo(x,Distances);

	if(r(n) < exp( -DJ/T))
		x = x_1;
		J(n) = J(n+1);
	end

	if(J(n) < Jmin)
		Jmin = J(n); 
		Xmin = x;
	end


	x_out(:,n) = x;

	if(rem(n,N) == 0)

		k = k+1; T = T/log2(k+1);
		l = l+1;
		
	% A sessão abaixo plota as decisões para diferentes temperaturas.
		if l == 1 || l ==10 || l == 100 || l == 1000
			PlotQ3_TSP(Xmin,Cidades)
		end
		if k >= K
			fim = 0;
		end
	end
	
end

PlotQ3_TSP(Xmin,Cidades)
title('Método Metrópolis')

Xmin = Xmin'
Jmin


%Brute Force
	%Método da força bruta.
Jmin_BF = 100;
P = perms(Xmin);
P = P';

for i=1:length(P)
	J = Custo(P(:,i),Distances);
	
	if(J < Jmin_BF)
		Jmin_BF = J;
		Xmin_BF = P(:,i);
	end
	
end

PlotQ3_TSP(Xmin_BF,Cidades)
title('Método Brute Force')
Xmin_BF = Xmin_BF'
Jmin_BF
