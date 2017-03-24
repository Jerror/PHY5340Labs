%% PHY5340 Laboratory Report 2
% Jeremiah O'Neil, SN6498391
%% Question 1: Root Finding
% Rootfinding methods:
type('bisect.m')
type('NR.m')
type('secant_NR.m')
%%
% Numerical extremum classifier:
type('check_extremum.m')
%%
% Potential function and its derivatives:
type('NaCl_pot.m')
type('NaCl_force.m')
type('NaCl_stiffness.m')
%%
% Execute!
type('Lab2Q1.m')
Lab2Q1
%%
% The choice of initial conditions in the use of these methods has a
%  significant impact on convergence. Bisection will fail outright
%  unless there is an odd number of zero-crossings between the limits
%  specified. Since each iteration of the bisection algorithm halves
%  the search domain the number of requisite iterations reliably
%  increases with the binary logarithm of (b - a). The NR method is
%  guided by the derivative of the function, and may fail to converge
%  for functions which are badly behaved (noisy in a spectral sense, I
%  suppose) or whose gradient in the area around the initial position
%  points away from the root(s); for the NaCl interatomic force
%  function NR converges very quickly with a good start, but it fails
%  to converge (runs away) for a bad one (ie., one out on the gaussian
%  tail). The secant method is sensitive to the initial postion in the
%  same way as the NR method, but is additionally sensitive to the
%  chosen initial "previous" point: a large difference between these
%  initial conditions can slingshot the search away from the start in
%  a way that has little to do with the function, and too small a
%  difference can lead to a slow start. In my tests the secant method
%  was never better than, but for certain ICs could be as good as, the
%  NR method. All methods could converge to the wrong root if given
%  poor ICs. In general, for ICs which avoided the root near the origin,
%  bisection converged reliably and in a reliable number of iterations
%  while the NR and secant methods converged more quickly than
%  bisection when they succeeded but required ICs close to the root to
%  succeed at all.
%% Question 2: Solving Linear Systems
% LU factorization method:
type('LU_naive.m')
%%
% LU decomposition linear system solver:
type('solve_linsys_LU.m')
%%
% Input generator:
type('problem_of_size.m')
%%
% Execute!
type('Lab2Q2.m')
Lab2Q2
