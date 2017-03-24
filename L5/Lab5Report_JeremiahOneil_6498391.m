%% PHY5340 Laboratory 5: Shooting for Eigenvalues and Eigenfunctions
% Jeremiah O'Neil, SN6498391
format shortG
newV = @(pars) (@(x) pars(1)*x.^2 + pars(2)*x.^3 + pars(3)*x.^4);
tol = 5e-7;  % for bisect; choose lower for shooter
inita = [0, 1e-5];
initb = [0, 1e-5];
%% Case 1: V(x) = 50x^2 + 2500x^4
V = newV([50, 0, 2500]);
x = [-0.5:0.01:0.5];
plot(x, V(x))
%%
% Choose endpoints and bind a function to shoot for E.
x0 = -0.5;  xm = 1e-2;  x1 = 0.5;
type('solve_TISE.m')
type('shooter.m')
% bind parameters, making a shooter function shoot(E)
shoot = @(E) shooter( V, E, x0, x1, xm, inita, initb, 0.2*tol );
%%
% Compute the offset from matching condition 'mismatch' for a grid of
% energies, starting from the minimum potential below which no solution is
% possible.
E = [0:0.1:25];
% map shoot to E grid
mismatch = arrayfun(shoot, E);
%%
% Plot the mismatch to locate eigenvalues (ie., where mismatch = 0)
plot(E, mismatch)
ylim([-500, 500])
%%
% It appears that every other zero-crossing corresponds to an asymptote -- 
% where a wavefunction derivative is zero at xm -- so I'll pick out the
% grid energies about odd-numbered zero crossings in as bounds on my 
% eigenvalues.
type('find_zero_crossings.m')
cross_idcs = find_zero_crossings(mismatch);
target_idcs = cross_idcs(1:2:end);  % skip asymptotes
Ebounds = [E(target_idcs); E(target_idcs + 1)]
Ebounds = Ebounds(:,1:3);  % select first three intervals
%% 
% I'll normalize my eigenfunctions in the standard manner using
% trapezoid-rule quadrature, and I'll use my function 'find_eig' to find
% a solution withing energy bounds by the shooting method, through another
% function 'compute_eigs' which runs find_eig for each interval in Ebounds
% and packs up the solutions.
type('discrete_trap.m')
type('find_eig.m')
type('compute_eigs.m')
[eigE, eigfuncs] = compute_eigs( shoot, Ebounds, tol );
%%
% Plot the results!
type('plot_eigs.m')
plot_eigs( V, eigE, eigfuncs );
ylim([0, 20]);
%%
% To ensure the accuracy of my results I'll test the sensitivity of the
% computed eigenvalues to my choice of endpoints by randomly varying the
% endpoints and observing if the difference with respect to my solution
% above is above tolerance.
type('test_endpoint_sensitivity.m')
% shooter with parameters partially bound
partial_shooter = @(E, x0, x1) shooter( V, E, x0, x1, xm, inita, initb, 0.2*tol );
[xd, delta_eigE] = test_endpoint_sensitivity( 5, partial_shooter, x0, x1, eigE, Ebounds, tol)
% Some choices of endpoints lead to significant differences, but these are
% outliers; most results agree with mine exactly! (Note, bisection of
% nearly identical functions on the same interval to the same tolerance
% should always find the same root though the functions are slightly
% different.)
%% Case 2: V(x) = 50x^2 + 1500x^3 + 2500x^4
% Exactly as above, with a new V(x) and x0, xm, x1. 
V = newV([50, 1500, 2500]);
x = [-0.75:0.01:0.4];
plot(x, V(x))
%%
% I'll choose xm near the center of the lowest part of the well, which I
% expect to align to the centre of the lowest energy eigenfunctions, and x1
% and x0 out in the excluded region to roughly the same potential height.
x0 = -0.9;  xm = -0.4;  x1 = 0.5;
shoot = @(E) shooter( V, E, x0, x1, xm, inita, initb, 0.2*tol );
%%
E = [-25:0.1:5];
mismatch = arrayfun(shoot, E);
%%
plot(E, mismatch)
ylim([-500, 500])
%%
cross_idcs = find_zero_crossings(mismatch);
target_idcs = cross_idcs(1:2:end);
Ebounds = [E(target_idcs); E(target_idcs + 1)]
Ebounds = Ebounds(:,1:3);
%% 
[eigE, eigfuncs] = compute_eigs( shoot, Ebounds, tol );
%%
plot_eigs( V, eigE, eigfuncs );
ylim([-25, 5]);
%%
partial_shooter = @(E, x0, x1) shooter( V, E, x0, x1, xm, inita, initb, 0.2*tol );
[xd, delta_eigE] = test_endpoint_sensitivity( 5, partial_shooter, x0, x1, eigE, Ebounds, tol)
% all good!
%% Appendix: RK45 and bisect
type('RK45.m')
type('bisect.m')
