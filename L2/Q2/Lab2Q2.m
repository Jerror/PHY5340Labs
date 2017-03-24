%% Solution for N = 10
[b, A] = problem_of_size(10);
x = solve_linsys_LU(A, b)
%% Benchmark for N = 500
[b, A] = problem_of_size(500);
disp('Solving with my implementation...')
tic; x = solve_linsys_LU(A, b); toc
disp('Solving with the backslash operator...')
tic; x = A\b; toc