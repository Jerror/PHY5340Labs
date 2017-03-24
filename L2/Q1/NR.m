function [root, est_err, numiter] = NR(maxiter, tol, func, dfunc, a)
est_err = 1; numiter = 0;
x = a;
while est_err > tol
    numiter = numiter + 1;
    xprev = x;
    x = xprev - func(xprev) / dfunc(xprev);
    est_err = abs((x - xprev) / x);
    if numiter > maxiter, break, end
end
root = x;
end