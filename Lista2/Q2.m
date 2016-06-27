%% Questão 2

%Inicialização de parâmetros

K = 10;
N = 1000; n = 0; x_out = zeros(N,K); fim =1;
k = 1;
i = 0;

T = [0.1 0.0631 0.05 0.0431 0.0387 0.0356 0.0333 0.0315 0.0301 0.0289];

r = rand(1,N*K*100);


x = [1 2 3 4 5];
J = [0.5 0.2 0.3 0.1 0.4];
Jmin = 100;

x_atual = x(randi(5));

while(fim)
	
	n = n+1;
	i = i+1;
	
	change = randi(5);
	
	x_1 = x(change);
	

	DJ = J(change) - J(x_atual);
	

	
	if(r(n) < exp( -DJ/T(k)))
		x_atual = x_1;
		x_out(i,k) = x_1;
	else
		x_out(i,k) = x_atual;
	end	
	
	if(J(x_atual) < Jmin)
		Jmin = J(x_atual); Xmin = x_atual;
	end
	
	x_out(i,k) = x_atual;
	
	if(rem(n,N) == 0)
		i = 0;
		figure;
		BinEdges = 0.5:5.5;
		histogram(x_out(:,k),BinEdges)
		Temperature = num2str(T(k));
		Default = 'Temperatura = ';
		title([Default Temperature]);
		k = k+1;
		if k > K
			fim = 0;
		end
	end
	
end

%Geração da matriz de transição.
M = zeros(5,5);
for i=1:5
	for j=1:5
		Dj = J(i) - J(j);
		if Dj < 0
			M(i,j) = 1;
		
		else if Dj ~= 0
				M(i,j) = exp(-Dj/0.1);
				M(j,j) = M(j,j) + 1-M(i,j);
			end
		end
	end
end
M = M/4;

%Resolução da base ortonormal (autovetor) para autovalor = 1
EigenVector = null(eye(5)-M);
%Normalizando
EigenVector = EigenVector/sum(EigenVector)

%Calculando Fator de Boltzmann
B = exp(-J/0.1);
B = B/sum(B);
B = B';

%Conferindo
Error = EigenVector-B

