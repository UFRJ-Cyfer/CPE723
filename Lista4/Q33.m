%% Questao 3


GEN = 1000;
N = 30;
PopSize = 30;
mi = PopSize;

%rng(0,'twister');
%ss = rng;

nSigma = N;

%lambda [e a quenatidade de filhos = 200
lambda = 200;
eps = 1e-8;
c = 0.9;

Child = zeros(N,lambda);
sigChild = zeros(nSigma,lambda);

x = 30 - 60*rand(N,PopSize);

sig = 10*rand(nSigma, PopSize);

J = -20*exp(-0.2*sqrt(1/N*sum(x.^2,1))) - exp(1/N * sum(cos(2*pi*x),1)) ...
    +20 + exp(1);

J= 200;

Jmin = J;
Xmin = x;
tau1 = 1/10*sqrt(1/2/N);
tau2 = 1/10*sqrt(1/2/sqrt(N));

I = 3:2+N*2;

Position = randi(PopSize,1,2+N*2,GEN);
for g=1:GEN
    children = 0;
    
    while(children ~= lambda)
        children = children+1;


        
         Father1 = x(:,Position(1,1,g));
         Father2 = x(:,Position(1,2,g));
      
%         sig1 = sig(:,Position(1,3,g));
%         sig2 = sig(:,Position(1,4,g));
        
%         sigChild(:,children) = (sig1+sig2)/2;

      
      
         sig1 = sig(:,Position(1,I,g));
         
         sig1 = sum(sig1,2)/length(I);
         
         sigChild(:,children) = sig1;

        index = randi([0 1],1,N);
        for k=1:N
            if index(k)
                Child(k,children) = Father1(k);
            else
                Child(k,children) = Father2(k);
            end
        end
    end
    
   A = exp(tau1*randn(1,children));
   A = repmat(A,N,1);
    
    B = exp(tau2*randn(size(sigChild)));
    sigChild = sigChild.*A.*B;
    
    sigChild(sigChild < eps) = eps;
    
    Child = Child + sigChild.*randn(size(sigChild));
    
    x1 = Child;
    
    Jp = J;
%     saveJp(gen) = Jp;
%     
    Jc = -20*exp(-0.2*sqrt(1/N*sum(x1.^2,1))) - exp(1/N * sum(cos(2*pi*x1),1)) ...
    + 20 + exp(1);
 
%     saveJc(gen) = Jc;
    
    [dummy rank] = sort(Jc,'ascend');
    
    Jc = Jc(rank(1:PopSize));
    x = x1(:,rank(1:PopSize));
    sig = sigChild(:,rank(1:PopSize));
    
    Jc;
    
    min(Jp);
    Jc < min(Jp);
    ps = sum(Jc < min(Jp))/PopSize;
%         saveps(gen) = ps;

    if(ps > 0.2)
        sig = sig/c;
    end
    if ps < 0.2
        sig = sig*c;
    end
    if ps ==0.2
        sig = sig;
    end
    
    sig(sig < eps) = eps;

    
    
    [aux index]= min(Jc);

    if(aux < Jmin)
        xMin = x(:,index);
        Jmin = aux;
    end
    
    J = Jc;
end

xMin
Jmin

