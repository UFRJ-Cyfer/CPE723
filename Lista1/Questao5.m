%% Questão 5

% Esta função está implementada no arquivo Custo5.m
% e ela possui a seguinte definição:
%
% J = (1 + cos(x0)^ 2) * x0^2 + (2 + sin(x1)) * (x1 ^ 2) + ...
%     ((x2 - 1) * (x3 + 2)) ^ 4 + (x2 + 1) * (x2 + 2);
%
% Esta função foi uma sugestão de um colega, e ela possui como
% mínimos os valores: X = [0 0 -1.5 -2];
%

%Inicialização dos Parâmetros
M = 4;
N = 1000;
K = 1000;
T0 = 1;
ep = 0.1;

T = T0;

fim = 1; n = 0; k = 1; i=0;

X0 = randn(M,1);

%Custo e Estados Iniciais.
X = X0;
J(:,1) = Custo5(X0);

Xmin = X0;
Jmin = J(:,1);

while (fim)
    
    n = n+1;
    i = i+1;
    
    %Cálculo do estado perturbado (por uma distribuição Gaussiana).
    X(:,i+1) = X(:,i) + ep*(2*randn(size(X(:,i))));
    
    %Cálculo dos custos atual e perturbado.
    J(:,i+1) = Custo5(X(:,i+1));
    J(:,i) = Custo5(X(:,i));

    DJ = J(:,i+1) - J(:,i);
    
    if J(:,i) < Jmin
    Jmin = J(:,i); Xmin = X(:,i);
    end
    
    %Algoritmo de Metrópolis
    
    if J(:,i+1) < J(:,i)
        
    else
        if (rand() < exp( ( -DJ )/T))
           
        else
           X(:,i+1) = X(:,i);
        end
    end
        
    if (rem(n,N) == 0)
        k = k+1; T = T0 / log2(1+k);
        if DJ < 1e-12 && k >= K
            fim = 0;
        end
    end    
    
end

Xmin
Jmin