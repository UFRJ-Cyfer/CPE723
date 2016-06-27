%% Questão 3 Problema 1
% 
%  Este problema visa minimizar a distância entre X e o vetor 
%  [1 1 1 1 1 1 1 1 1 1] utilizando a mesma como função custo.
% 

%Inicialização dos parâmetros
K = 1000;
N = 1000; n = 0; x_out = zeros(N*K,10); fim =1;
k = 0;
ep = 0.2;

T = 1;

r = rand(1,N*K*100);

x = [1 2 3 4 5 1 2 3 4 5];
x_out = [x_out;x];

Jmin = JTeste(x);

while(fim)
	
	n = n+1;
	
	p = 2*randn(size(x,1),size(x,2) ) ;
	
	x_1 = x + ep*p;
	
	DJ = JTeste(x_1) - JTeste(x);
	
	
	if(JTeste(x) < Jmin)
		Jmin = JTeste(x); Xmin = x;
	end
	
	
	if(r(n) < exp( -DJ/T))
		x = x_1;
	end
	
	
	x_out(n,:) = x;
	
	if(rem(n,N) == 0)
		k = k+1; T = T/log2(1+k);
		if k > K
			fim = 0;
		end
	end
	
end

%Xmin deve ser o mais perto de [1 1 1 1 1 1 1 1 1 1]
Xmin
Jmin
