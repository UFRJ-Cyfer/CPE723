%% Questão 4

%Inicialização dos parâmetros
N = 1000;
K = 1000;
T0 =  1;
ep = 1;

fim = 1; n = 0; k = 1; i=0;

%Calculo do estado e custo inicial.
x(1) = 0;
J(1) = -x(1) + 100*(x(1)-0.2).^2*(x(1)-0.8).^2;

Jmin = J(1);
Xmin = x(1);
T = T0;

while (fim)
    
    n = n+1;
    i = i+1;
    
    %Calculo do estado perturbado e seu custo.
    x(i+1) = x(i) + ep*(randn);
    J(i+1) = -x(i+1) + 100*(x(i+1)-0.2).^2 .*(x(i+1)-0.8).^2;
    
    DJ = J(i+1) - J(i);
    
    if J(i) < Jmin
        Jmin = J(i); Xmin = x(i);
    end
    
    %Algoritmo de Metrópoles
    
    if J(i+1) < J(i)
        x(i) = x(i+1); 
    else
        r = rand();
        q = exp(-DJ/T);
        if (r < q)
           x(i) = x(i+1);  
        else 
           x(i+1) = x(i);
        end    
    end
    
    if (rem(n,N) == 0)
        k = k+1; T = T0 / log2(1+k);
        if k == K
            fim = 0;
        end
    end    
end
Xmin
Jmin