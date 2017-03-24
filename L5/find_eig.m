function [ E, xpsi, est_err, miss, numiter ] = find_eig( shoot, Ea, Eb, tol )
% Use bisection rootfinding (from Lab2) to shoot for eigenfunctions,
% corresponding to eigenvalues where the mismatch is zero.
[E, est_err, numiter] = bisect(50, tol, shoot, Ea, Eb);
[miss, xa, xb, psia, psib] = shoot(E);
x = [xa, xb];
psi = [psia, psib * psia(end)/psib(1)];
% Normalize
N = (discrete_trap(psi.^2, x))^-0.5;
xpsi = [x; N * psi];
end

