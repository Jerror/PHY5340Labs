function [x, y, L, U] = solve_linsys_LU(A, b)
assert(size(A, 1) == size(A, 2) && size(A, 1) == size(b, 1))
N = size(b, 1);
y = zeros(N, 1); x = zeros(N, 1);
[L, U] = LU_naive(A);
for i = 1:N
    y(i) = b(i) - L(i, 1:i-1) * y(1:i-1);
end
for i = N - (0:N-1) 
    x(i) = 1/U(i, i) * (y(i) - U(i, i+1:N) * x(i+1:N));
end
end