function [ eigE, eigfuncs, miss, est_err, numiter ] = compute_eigs( shoot, Ebounds, tol )
% find the eigenvalues between specified bounds using the find_eig function
num = size(Ebounds, 2);
eigE = zeros(1, num);
eigfuncs = cell(1, num);
miss = zeros(1, num);
est_err = zeros(1, num); numiter = zeros(1, num);
for i = 1:num
    [eigE(i), eigfuncs{i}, est_err(i), miss(i), numiter(i)] = ...
        find_eig( shoot, Ebounds(1,i), Ebounds(2,i), tol );
end
end