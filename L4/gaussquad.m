function [ num ] = gaussquad( x, w, f )
% Integrate f by gaussian quadrature rule with nodes x and weights w.
num = f(x)*w.';
end