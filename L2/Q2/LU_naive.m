function [L, U] = LU_naive(A)
assert(size(A, 1) == size(A, 2))
L = eye(size(A));
U = zeros(size(A)); U(1, :) = A(1, :);
for n = 1:(size(A, 1) - 1) % nth diag elem, starting target U col and L row
    % Note, 1:0 is 'empty': it indexes to 'empty' and operates as zero.
    L(n:end, n) = (A(n:end, n) - L(n:end, 1:n-1) * U(1:n-1, n)) / U(n, n);
    U(n+1, n+1:end) = A(n+1, n+1:end) - L(n+1, 1:n) * U(1:n, n+1:end);
end
end