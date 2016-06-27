PopSize = 100;
GEN = 2000;
N = 8;

NumberOfSolutions = 100;

index = 1;


ChildSize = 2;
InitialParentsSize = 10;
x_sol = zeros(NumberOfSolutions,8);

X = zeros(PopSize,N);
q = zeros(PopSize,1);
Filhos = X;
gen = 0;

togPerm = 0;


Ref = 1:1:N;
tic
for i=1:PopSize
 X(i,:) = randperm(N);
 q(i) = checkDiagonal(X(i,:));
 				if (q(i)) == 0
				tog = 0;
				for l = 1:index

					if sum(x_sol(l,:) == X(i,:)) == 8
						tog = 1;
						break;
					end
				end
				if (~tog)
					x_sol(index,:) = X(i,:);
					index = index+1;
					togPerm = 1;
				end
			end

end

while index ~= NumberOfSolutions
	gen = gen+1;
	Filho1 = [];
	Filho2 = [];
	togFilho = 0;
	
	if togPerm || rem(gen, 1500) == 0
		X = zeros(PopSize,N);
		q = 10*ones(PopSize,1);
		for i=1:PopSize
			X(i,:) = randperm(N);
			q(i) = checkDiagonal(X(i,:));
			
			if q(i) ==0
				tog = 0;
				for l = 1:index

					if sum(x_sol(l,:) == X(i,:)) == 8
						tog = 1;
						break;
					end
				end
				if (~tog)
					x_sol(index,:) = X(i,:);
					index = index+1;
					tog = 1;
				end
			end
			togPerm = 0;
		end
	end
	
		
	
	pais = randi(PopSize, 1,InitialParentsSize);
	xp = X(pais,:);
	q_xp = q(pais);
	
	[~, rank] = sort(q_xp,'ascend');
	xp = xp(rank,:);
	
	if rand() < 1
		togFilho = 1;
		for k=1:ChildSize;
			Pos = randi(N);

			Filho1 = xp(1,1:N);
			Filho1 = [Filho1 setdiff(Ref,Filho1)];

			Filho2 = xp(2,1:N);
			Filho2 = [Filho2 setdiff(Ref,Filho2)];
		end
	
	end
	
	
	if rand() < 0.7 && togFilho
		Pos1 = randi(N);
		Pos2 = randi(N);
		
		aux = Filho1(Pos1);
		
		Filho1(Pos1) = Filho1(Pos2);
		Filho1(Pos2) = aux;
		
	end
	
	if rand() < 0.05 && togFilho
		Pos1 = randi(N);
		Pos2 = randi(N);
		
		aux = Filho2(Pos1);
		
		Filho2(Pos1) = Filho2(Pos2);
		Filho2(Pos2) = aux;
		
	end
	
	if togFilho
		q  = vertcat(q, checkDiagonal(Filho1),checkDiagonal(Filho2));

				if checkDiagonal(Filho1) == 0
						tog = 0;
					for l = 1:index
						if sum(x_sol(l,:)) == 0
							break;
						end
						if sum(x_sol(l,:) == Filho1) == 8
							tog = 1;
							break;
						end
					end
					if (~tog)
						x_sol(index,:) = Filho1;
						index = index+1
						tog = 1;
					end
				end
			
				if checkDiagonal(Filho2) == 0
					tog = 0;
				for l = 1:index

					if sum(x_sol(l,:) == Filho2) == 8
						tog = 1;
						break;
					end
				end
				if (~tog)
					x_sol(index,:) = Filho2;
					index = index+1
					tog = 1;
				end
			end	
		X = cat(1, X, Filho1, Filho2);
	end
	

	

	[~, rankFinal] = sort(q,'ascend');
	
	q = q(rankFinal(1:PopSize));
	
	
	X = X(rankFinal(1:PopSize),:);



end

gen
x_sol(1:NumberOfSolutions-1,:)
toc