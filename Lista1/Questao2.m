%% Questão 2
    %Método 1
       % Este método utiliza o artifício de que arctg(1) - arctg(0) = pi/4
       % E este cálculo é equivalente à resolver a integral de 1/(1+x^2) de
       % 0 a 1.
       
        m = 1e6;
        x = -1 + 2*rand(m,1);
        
        % Estimação da Integral
        Q2_1 = sum(4./(1+x.^2))/size(x,1)
    
        % Neste caso não tem problema fazer a distribuição ser de -1 a 1
        % Pois a transformação remove a informação de sinal (fase).
        
        
        
        
   % Método 2
        % Este método chuta m pontos (x,y) e vê quais
        % caem dentro do círculo de raio 1 
        % inscrito em um quadrado.
        
        % Depois o valor de pi é estimado fazendo 
        %
        % 4*(Número de pontos no circulo)/(Número total de pontos)
        %
        % Isto faz sentido pois em média, a chance de acertar o quadrado
        % chutando números aleatórios é justamente a razão entre as àreas,
        % o que dá pi/4.

        
        m = 1e6;
        k = 0;
        x = -1 + 2*rand(m,1);
        y = -1 + 2*rand(m,1);
        
        for i=1:size(x,1)
            if (x(i)^2+ y(i)^2 < 1)
                k = k+1;
            end 
        end
        
        Q2_2 = 4*k/m
        