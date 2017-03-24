function [ result ] = discrete_trap( f, x )
% Trapezoid rule quadrature, for discrete f above x, for arbitrary spacing.
result = 0.5 * sum(diff(x) .* (f(1:end-1) + f(2:end)));
end