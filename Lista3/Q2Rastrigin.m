function Q2Rastrigin

%%Implementação da Função Custo de Rastrigin

function J = CostRastrigin(x)

	d = length(x); sum = 0;
	
	for i=1:d
		sum = sum + x(i)^2 - 10*cos(2*pi*x(i));
		
	end
	J = 10*d + sum;

end

%% Questão 3 Problema 1
% 
%  Utilizando a função custo determinada acima, iremos
% Tentar minimizá-la através do Simmulated Annealing
% 

%Inicialização dos parâmetros
K = 1000;
N = 1000; n = 0; x_out = zeros(N*K,20); fim =1;
x_out_1 = x_out;
k = 0;
ep = 0.2;

T = 1;

J_out = zeros(N*K,1);

r = rand(1,N*K*100);

x = randn(1,20);

Jmin = CostRastrigin(x);

while(fim)
	
	n = n+1;
	
	p = -1 + 2*rand(size(x,1),size(x,2)) ;
	
	x_1 = p;
	x_out_1(n,:) = x_1;

	
	J_1 = CostRastrigin(x_1);
	J = CostRastrigin(x);
	
	DJ = J_1 - J;
	
		
	if(r(n) < exp( -DJ/T))
		x = x_1;
		J = J_1;
	end
	
	if(J < Jmin)
		Jmin = J; Xmin = x;
	end
	J_out(n) = J;
 	x_out(n,:) = x;
	
	if(rem(n,N) == 0)
		k = k+1; 
 		T = T/log2(1+k);
		if k > K
			fim = 0;
		end
	end
	
end


Xmin
Jmin
plot(J);

end

