function [x, w, a, b, q0] = gauss_hermite( N )
% Define recursion coefficients and obtain nodes and weights for order N
%  Gauss-Hermite quadrature.
a = sqrt((1:1:(N-1))/2);
b = zeros(1, N);
q0 = pi^(-1/4);
[x, w] = golubwelsch(a, b, q0);
end