function [ result ] = simp( f, a, b, N )
x = linspace(a, b, N+1);
result = (b-a)/(3*N) * (f(a) + f(b) + 4*sum(f(x(2:2:end-1))) ...
                        + 2*sum(f(x(3:2:end-1))));
end