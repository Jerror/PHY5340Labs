%% PHY5340 Laboratory Report 3
% Jeremiah O'Neil, SN6498391
%% Question 1: Quadrature
% Numerical integration methods:
type('trap.m')
type('simp.m')
type('emacl.m')
%%
% Error function integration and relative error calculation routine:
type('num_erf_err')
%%
% Execute!
type('L3_Q1.m')
L3_Q1
%%
% The plot shows that the trapezoid method is of order 2 while Simpson's
% method and the Euler-MacLaurin method or of order about 4, with Simpson's
% method being slightly better asymptotically for this problem --- but 
% the Euler-MacLaurin method having a lower constant error. On the plotted
% range, only the trapezoid rule does not achieve machine precision.
%% Question 2: Eigenvalues
% Lanczos algorithm
type('lanczos.m')
%%
% Execute!
type('L3_Q2.m')
L3_Q2
%%
% The Lanczos algorithm with 5 iterations is as good as MATLAB's eig()
% function for this problem, judging by the characteristic ('c', above);
% the difference fluctuates since the Lanczos starting vector is random,
% so it's too close to call!