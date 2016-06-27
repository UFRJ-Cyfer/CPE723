%% Questao 3
	clear all
	close all
for r=1:10
	r

	xMin = zeros(30,10);


	GEN = 2000;
	N = 30;
	PopSize = 600;
	mi = PopSize;

	GamesPlayed = 10;

	%rng(0,'twister');
	%ss = rng;

	nSigma = N;
	OldPlayer = 0;

	%lambda [e a quenatidade de filhos = 200			
	lambda = 200;
	eps = 1e-4;
	c = 0.9;

	Child = zeros(N,lambda);

	x = 30 - 60*rand(N,PopSize);

	sig = rand(nSigma, PopSize);

	J = -20*exp(-0.2*sqrt(1/N*sum(x.^2,1))) - exp(1/N * sum(cos(2*pi*x),1)) ...
		+20 + exp(1);
	J= 200;

	Jmin = 200;
	Xmin = x;

	tau1 = sqrt(1/2/N);
	tau2 = sqrt(1/2/sqrt(N));

	Points = zeros(1, PopSize*2);

	runs = 1;
% 	contador = 0;
	for g=1:GEN

% 		if contador == 100
% 			disp('RESETEI SIGMA')
% 			sig = rand(nSigma, PopSize);
% 			contador = 0;
% 		end

	% 	if rem(GEN,g)==0
	% 		g
	% 	end
	% 	
	% 	
	% 	if g == N*runs + 1
	% 		
	% 		Points = zeros(1, PopSize*2);
	% 		Jmin = 200;
	% 		x = 30 - 60*rand(N,PopSize);
	% 		sig = randn(nSigma, PopSize);
	% 		
	% 		runs = runs+1;
	% 		
	% 		if runs==RUN+1
	% 			break;
	% 		end
	% 		
	% 	end



			Children = x + sig.*randn(size(sig));


	   A = exp(tau1*randn(1,PopSize));
	   A = repmat(A,N,1);

		B = exp(tau2*randn(size(sig)));
		sigChild = sig.*A.*B;



		X = cat(2,x,Children);
		SIG = cat(2,sig,sigChild);



			J = -20*exp(-0.2*sqrt(1/N*sum(X.^2,1)))...
			- exp(1/N * sum(cos(2*pi*X),1)) ...
			+ 20 + exp(1);

		Jc = -20*exp(-0.2*sqrt(1/N*sum(Children.^2,1)))...
			- exp(1/N * sum(cos(2*pi*Children),1)) ...
			+ 20 + exp(1);

		Jp = -20*exp(-0.2*sqrt(1/N*sum(x.^2,1)))...
			- exp(1/N * sum(cos(2*pi*x),1)) ...
			+ 20 + exp(1);
	% 	
	% 	J = horzcat(Jp,Jc);

		Points = zeros(1, PopSize*2);
		for l = 1:PopSize
			Player1 = l;
			Player2 = randi(PopSize*2);

			for q=1:GamesPlayed
				Player2 = randi(PopSize*2);

				if Player2 == OldPlayer
					Player2 = randi(PopSize*2);	
				end
				if Player2 == l
					Player2 = randi(PopSize*2);
				end
				if J(l) < J(Player2)
					Points(l) = Points(l) + 1;
	% 				Points(Player2) = Points(Player2) - 1;
				end
				if J(l) > J(Player2)
					Points(Player2) = Points(Player2) + 1;
	% 				Points(l) = Points(l) - 1;
				end
				OldPlayer = Player2;

			end
		end


		[~, rank] = sort(Points,'descend');


		[aux, index]= min(J);
		JMinGen(g) = aux;

		if(aux < Jmin)
			xMin = X(:,index);
			genMin(r) = g;
			Jmin = aux;
			Jruns(r) = Jmin;
% 			contador = 0;
		end
	% 	if g>1
	% 		if abs(JMinGen(g) - JMinGen(g-1)) < 1e-3
	% 			contador = contador+1;
	% 		end
	% 	end

		J = J(rank(1:PopSize));
		x = X(:,rank(1:PopSize));			 %
		sig = SIG(:,rank(1:PopSize));


	% 	ps = sum(Jc < min(Jp))/PopSize;    

	% 
	%     if(ps > 0.2)
	%         sig = sig/c;
	%     end
	%     if ps < 0.2
	%         sig = sig*c;
	%     end
	%     if ps == 0.2
	%         sig = sig;
	% 	end

		sig(sig < eps) = eps;


	end
	figure;
	plot(JMinGen)
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
	
% xMin(:,run) = Xmin;


% MeanX = mean(xMin)

% StdX = std(xMin)

% stem(Jruns)