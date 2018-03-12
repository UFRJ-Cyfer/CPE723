function [J] = Custo5(X)
    

    x0 = X(1);
    x1 = X(2);
    x2 = X(3);
    x3 = X(4);

    

    J = (1 + cos(x0)^ 2) * x0^2 + (2 + sin(x1)) * (x1 ^ 2) + ((x2 - 1) * (x3 + 2)) ^ 4 + (x2 + 1) * (x2 + 2);
end
