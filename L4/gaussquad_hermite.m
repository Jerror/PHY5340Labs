function [ num, N, rel_tol ] = gaussquad_hermite( f, targetF, tol )
% Integrate f by Gauss-Hermite quadrature of increasing order until
%  specified relative tolerance is achieved in the function targetF.
N = 1; rel_tol = 1;
[x, w] = gauss_hermite(N);
num = targetF(gaussquad(x, w, f));
while rel_tol > tol,
    num_pre = num;
    N = N + 1;
    [x, w] = gauss_hermite(N);
    num = targetF(gaussquad(x, w, f));
    rel_tol = abs(num_pre/num - 1);
end
end