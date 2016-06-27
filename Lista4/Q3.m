%% Ep
close all
clear all
for r=1:10
GEN = 2000;
N = 30;
PopSize = 600;
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

sig = rand(nSigma, PopSize);

J = -20*exp(-0.2*sqrt(1/N*sum(x.^2,1))) - exp(1/N * sum(cos(2*pi*x),1)) ...
    +20 + exp(1);

J= 200;

Jmin = J;
Xmin = x;
tau1 = sqrt(1/2/N);
tau2 = sqrt(1/2/sqrt(N));

I = 3:2+N*2;


for g=1:GEN
    children = 0;
    
    while(children ~= lambda)
        children = children+1;


%          Father1 = x(:,Position(1,1,g));
%          Father2 = x(:,Position(1,2,g));
         
         
         Father1 = x(:,randi(PopSize));
         Father2 = x(:,randi(PopSize));
      
%         sig1 = sig(:,Position(1,3,g));
%         sig2 = sig(:,Position(1,4,g));
%         
%         sigChild(:,children) = (sig1+sig2)/2;

      
%       
         sig1 = sig(:,randi(PopSize,1,length(I)));
         
         sig1 = sum(sig1,2)/length(I);
         
         sigChild(:,children) = sig1;

        index = randi([0 1],1,N);
        for k=1:N
            if index(k)
                Pos1 = randi(N);
                Child(k,children) = (Father1(Pos1)+Father2(Pos1))/2;
            else
                Pos1 = randi(N);
                Child(k,children) = (Father1(Pos1)+Father2(Pos1))/2;
            end
        end
    end
    
   A = exp(tau1*randn(1,children));
   A = repmat(A,N,1);
    
    B = exp(tau2*randn(size(sigChild)));
    sigChild = sigChild.*A.*B;
    
    sigChild(sigChild < eps) = eps;
    
    Child = Child + sigChild.*randn(size(sigChild));
    
    x1 = cat(2,x,Child);
	sig1 = cat(2, sig, sigChild);
    
    Jp = J;
    Jc = -20*exp(-0.2*sqrt(1/N*sum(x1.^2,1))) - exp(1/N * sum(cos(2*pi*x1),1)) ...
    + 20 + exp(1);
 
    
    [~, rank] = sort(Jc,'ascend');
    
    Jc = Jc(rank(1:PopSize));
    x = x1(:,rank(1:PopSize));
    sig = sig1(:,rank(1:PopSize));
    
    Jc;
    
    min(Jp);
    Jc < min(Jp);
    ps = sum(Jc < min(Jp))/PopSize;
%         saveps(gen) = ps;
% 
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
	JminGen(g) = aux;

    if(aux < Jmin)
        xMin = x(:,index);
        Jmin = aux;
		Jruns(r) = Jmin;
    end
    
    J = Jc;
end



	figure;
	plot(JminGen)
	xlabel('Generations') % x-axis label
	ylabel('Minimum Cost') % y-axis label
	title(strcat('Run',num2str(r)))
	
end

	figure;
	stem(Jruns);
	MeanJ = mean(Jruns);
	refline(0,MeanJ);
	xlabel('Runs') % x-axis label
	ylabel('Minimum Cost') % y-axis label
	title('Cost throught algorithm runs')
	legend('Cost','Average Cost')
	StdJ = std(Jruns)
