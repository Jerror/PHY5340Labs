function [root, est_err, numiter] = bisect(maxiter, tol, func, a, b)
% Based on C1_1.m
assert(func(a)*func(b) < 0);
est_err = 1; numiter = 0;
while est_err > tol
    numiter = numiter + 1;
    mid = (a + b) / 2;
    if func(mid)*func(a) < 0
        b = mid;
    elseif func(mid)*func(b) < 0
        a = mid;
    end
    est_err = abs(a - b) / mid;
    if numiter > maxiter, break, end
end
root = mid;
end