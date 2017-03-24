function [root, est_err, numiter] = secant_NR(maxiter, tol, func, a1, a0)
est_err = 1; numiter = 0;
xprev = a0; x = a1;
while est_err > tol
    numiter = numiter + 1;
    xnext = x - func(x) * (x - xprev) / (func(x) - func(xprev));
    xprev = x; x = xnext;
    est_err = abs((x - xprev) / x);
    if numiter > maxiter, break, end
end
root = x;
end