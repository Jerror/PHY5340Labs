function [ x, u ] = solve_TISE( x0, xend, init, V, E, tol )
% use RK45 from Project 2 to integrate the TISE for given V(x) and E from x0 to xend
m2_hsqr = 2 / 0.076199682;  % eV^-1 nm^-2
[x, u] = RK45(@(x, u)[u(2), m2_hsqr*(V(x) - E)*u(1)], x0, xend, init, tol);
end

