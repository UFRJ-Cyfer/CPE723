function out = J(x)

c = zeros(1,10);

if length(c) ~= length(x)
   error('Vector Must be size 10, the size given was %d',length(x))
end

out = (1+cos( x(1) )^2 )*x(1)^2 + (x(2)-2)^2*(x(3)-5)^2 + (x(3)-5)^2*(1+sin(x(2))^2) ...
      + (x(4)-1)^2*(x(2)-2)^2 + (x(4)-1)^2*(x(5)-pi)^2 + (1+cos(x(5))^2)*(x(5)-pi)^2 ...
      + x(6)^2*(x(7)- exp(1))^2 + (x(7)-exp(1))^2*(x(4)-1)^2 + (x(8)-2.5)^2 ...
      + (x(9)-1.3)^2 + (x(10) - pi)^2;
end