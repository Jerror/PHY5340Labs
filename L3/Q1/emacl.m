function [ result ] = emacl( f, fprime, a, b, N )
result = trap(f, a, b, N) + ((b-a)/N)^2/12 * (fprime(a) - fprime(b));
end