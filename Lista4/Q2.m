%% Algoritmo Genetico Simples Q2
%rng(0,'twister');
%ss = rng;

clear all
close all

for roda=1:10
PopSize = 100 ;
GEN = 100;
CMin = [];

Conv = zeros(16,1);
PontoFlutuante = zeros(PopSize,1);

Tamanho = 25;
x = randi([0 1], PopSize,Tamanho);
Pais = zeros(size(x));
Cmax = [];

toggle = 0;
gen = 0;

while(gen~=GEN)
    gen = gen+1;

r = rand(PopSize*10,1);
mut = rand(PopSize,1);
rk = rand(PopSize/2,1);

CustoN = sum(x,2);
Custo = CustoN;
Custo = Custo/sum(Custo);
CumCusto = cumsum(Custo);

% selecao de pais na roleta
for l = 1:PopSize
    for m = 1:length(CumCusto)

        if CumCusto(m) > r(l)
            Pais(l,:) = x(m,:);
            break;
        end
    end
end

for p=1:PopSize/2
    if (rk(p) < 0.7)
            
            Pos = randi(Tamanho);
            Aux = Pais(2*p-1,Pos:Tamanho);

            Pais(2*p-1,Pos:Tamanho) = Pais(2*p,Pos:Tamanho);
            Pais(2*p,Pos:Tamanho) = Aux;        
        
    end
end

 for pp=1:PopSize
       
        if mut(pp) < 1/Tamanho
            k = randi(Tamanho);
            Pais(pp, k) = 1 - x(pp, k);
        end
 end
  
 x = Pais;

 
CustoN = sum(x,2);

CminAux(gen) = min(CustoN); 
CmaxAux(gen) = max(CustoN);
CMean(gen) = mean(CustoN);

if max(CustoN) == 25 && toggle == 0;
   terminada(roda) = gen;
    toggle =1;
end

    if gen==GEN && toggle == 0
        terminada(roda) = gen;
        toggle = 1;
    end
end
% figure;
% plot(Cmax)
% figRure;
% Cmin
figure
hold on
plot(CmaxAux);
plot(CminAux);
plot(CMean);
hold off

Media(roda) = mean(terminada);

DesvioPadrao(roda) = std(terminada);







end

Media = Media
DesvioPadrao = DesvioPadrao
