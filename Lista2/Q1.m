%% Questão 1
X = zeros(100,4);
k = 2;
close all;
for i=1:100
    
    
    X0 = randi(3)-1;
    X(i,1) = X0;
    
    for k=1:4
    
    if(rand()>0.5)
        X(i,k+1) = X(i,k);
    else
        if(rand()>0.5)
            X(i,k+1) = rem(X(i,k)+1,3);
        else
            X(i,k+1) = rem(X(i,k)+2,3);
        end    
    end
    
    end
   
       
end

%Plot do histograma usando todas as colunas.
figure;
histogram(X)
title('Todas as Colunas');

%Plot do histograma de cada coluna.
figure;
Standard = 'Coluna número ';
for m=1:4
subplot(2,2,m)
histogram(X(:,m))
Cell = num2str(m);
title([Standard Cell]);
end