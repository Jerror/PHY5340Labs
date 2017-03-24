function [ result ] = trap( f, a, b, N )
x = linspace(a, b, N+1);
result = (b-a)/N * ((f(a) + f(b))/2 + sum(f(x(2:end-1))));
end