function [ xd, Nd, delta_eigE ] = test_sensitivity(trials, partial_solver, ...
                                                   x0, x1, N, eigE)
d = 1.1 + 0.05 * randn(3, trials);
x0d = x0 * d(1,:);
x1d = x1 * d(2,:);
xd = [x0d; x1d];
Nd = ceil(N * d(3,:));
delta_eigE = zeros(numel(eigE), trials);
for i = [1:trials]
    eigEd = partial_solver( x0d(i), x1d(i), Nd(i) );
    delta_eigE(:,i) = eigEd - eigE;
end
end
