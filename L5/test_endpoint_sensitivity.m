function [ xd, delta_eigE ] = test_endpoint_sensitivity( trials, partial_shooter, x0, x1, eigE, Ebounds, tol)
d = 1.1 + 0.05 * randn(2, trials);
x0d = x0 * d(1,:);
x1d = x1 * d(2,:);
xd = [x0d; x1d];
delta_eigE = zeros(3, trials);
for i = [1:trials]
    shoot = @(E) partial_shooter( E, x0d(i), x1d(i) );
    eigEd = compute_eigs( shoot, Ebounds, tol );
    delta_eigE(:,i) = eigEd - eigE;
end
end