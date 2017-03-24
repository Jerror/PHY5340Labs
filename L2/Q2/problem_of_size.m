function [b, A, H, a] = problem_of_size(N)
a = linspace(1, 3, N);
b = [1; zeros(N-1, 1)];
H = toeplitz(exp(-a));
A = expm(-1i*H);
end