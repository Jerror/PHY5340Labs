function [eigE, eigfuncs, x] = tise_fd(V, x0, xend, N, Ne, numret)
%finite differences for time-independent schroedinger equation
% assuming psi(x0) = 0 = psi(xend)
m2_hsqr = 2 / 0.076199682;  % eV^-1 nm^-2

% linspace is the most reliable way to make N evenly spaced points.
% Jacob's code in C16_3 would be wrong for non-integer x0 and xend
x = linspace(x0, xend, N+2);
x = x(2:end-1);
h = x(2) - x(1);

% I'll generate the sparse matrix directly for efficiency
offdiag = -1/h^2 * ones(1,N-1);
diags = [offdiag,0; 2/h^2 + m2_hsqr*V(x); 0,offdiag].';
D = spdiags(diags, [-1,0,1], N, N);

[eigfuncs, e] = eigs(D, Ne, 'sa');
eigE = diag(e);
eigE = eigE(end-numret+1:end) ./ m2_hsqr;
eigfuncs = eigfuncs(:,end-numret+1:end).';
for i = [1:numret]  % normalize eigenfunctions
    C = discrete_trap(eigfuncs(i,:).^2, x)^-0.5;
    if (eigfuncs(i,floor(0.5*N)-1) < 0)
        C = -C;  % choose wavefunction positive left of centre
    end
    eigfuncs(i,:) = C * eigfuncs(i,:);
end
