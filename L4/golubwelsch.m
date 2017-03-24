function [ x, w ] = golubwelsch( a, b, q0 )
% Obtain nodes x and weights w for gaussian quadrature given polynomial
%  recursion coefficients a and b, and normalization q0.
% Using the Golub-Welsch algorithm; implementation adapted from C9_1.m
J = diag(a, -1) + diag(a, 1) + diag(b);
[V, D] = eig(J);
x = diag(D)';
w = V(1, :).^2/q0^2;
end