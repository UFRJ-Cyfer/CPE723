%% Algoritmo Genetico Simples Q1
for roda=1:10
PopSize = 100 ;

% rng(0,'twister');
% ss = rng;

GEN = 1000;
CMin = 100;
Conv = zeros(16,1);
PontoFlutuante = zeros(PopSize,1);

x = randi([0 1], PopSize,16);
Pais = zeros(size(x));


for i=1:15
    
   Conv(i+1) = 2^(1-i);    
    
end

for gen=1:GEN

r = rand(PopSize*10,1);
mut = rand(PopSize,1);
rk = rand(PopSize/2,1);

PontoFlutuante = x*Conv;

for k=1:PopSize
    if x(k,1) == 1
        PontoFlutuante(k) = -PontoFlutuante(k);
    end
end

CustoN = PontoFlutuante.^2 - 0.3*cos(10*pi*PontoFlutuante);


Custo = 5 - CustoN;
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
            
            Pos = randi(16);
            Aux = Pais(2*p-1,Pos:16);

            Pais(2*p-1,Pos:16) = Pais(2*p,Pos:16);
            Pais(2*p,Pos:16) = Aux;        
        
    end
end

 for pp=1:PopSize
       
        if mut(pp) < 0.05
            k = randi(16);
            Pais(pp, k) = 1 - x(pp, k);
        end
 end
  
 x = Pais;
 PontoFlutuante = x*Conv;

 for k=1:PopSize
    if x(k,1) == 1
        PontoFlutuante(k) = -PontoFlutuante(k);
    end
end
 
CustoN = PontoFlutuante.^2 - 0.3*cos(10*pi*PontoFlutuante);

[CminAux jMin] = min(CustoN); 
    if (CminAux < CMin) 
        Cmin = CminAux;
        xMin = x(jMin,:);
        FlutuanteMin = PontoFlutuante(jMin);
    end

end

xMin;

ValorArray(roda) = FlutuanteMin;
CArray(roda) = Cmin;
end

x = ValorArray
Custos = CArray