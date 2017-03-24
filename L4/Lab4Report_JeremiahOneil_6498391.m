%% PHY5340 Laboratory 4: Gaussian Quadrature
% Jeremiah O'Neil, SN6498391
%% Question 1
type('gauss_hermite.m')
type('golubwelsch.m')
[x, w] = gauss_hermite(10);
plot(x, w)
%%
% Under the change of variables x0 = sqrt(hbar / (m * w)),
% H = hbar * w / 2 * (x^2 / x0^2 + x0^2 * d^2/dx^2); and for units of 
% length such that x0 = 1, H = hbar * w / 2 * (x^2 + d^2/dx^2).
%% Question 2
% In units x0 = 1, the integrand is just c^2 times the Gauss-Hermite
% weight function; so, I'll just integrate f = 1 (vector of length N).
% I'll obtain the exact result with the minimum order N = 1, since f is 
% a zeroeth order polynomial (ie., constant).
% The exact result is of course c = q0 = pi^(-1/4).
[x, w] = gauss_hermite(1);
f2 = @(x)ones(1, length(x));
type('gaussquad.m')
c = 1/sqrt(gaussquad(x, w, f))
%% Question 3
% Removing the factor hbar * w, performing the derivatives, and pulling out
% the Gauss-Hermite weight exp(-x^2), the function under Gauss-Hermite
% integration is c^2 / 2 --- once again, a constant. Order N = 1 will give
% the exact answer.
f3 = @(x)f2(x) * c^2 / 2;
gaussquad(x, w, f3)
%% Question 4
% Now the function isn't constant --- or even polynomial! I won't be able
% to get an exact result. I'll use a function to compute Gauss-Hermite
% quadrature iteratively to the desired relative tolerance, 1E-4.
type('gaussquad_hermite.m')
f4 = @(x)exp(-2 * x.^4);
targetF = @(num)1/sqrt(num);
[d, N] = gaussquad_hermite(f4, targetF, 1E-4)
%% Question 5
% As above.
f5 = @(x)(16*x.^6 + 8*x.^4 - 10*x.^2 - 1) .* f4(x) * d^2 / 2;
targetF = @(num)num;
[num, N] = gaussquad_hermite(f5, targetF, 1E-4)