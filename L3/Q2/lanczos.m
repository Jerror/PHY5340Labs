function eigvals = lanczos( A, n )
% originally my own, with improvements inspired by C4_1.
a = zeros(n, 1); b = zeros(n+1, 1);
v = randn(length(A), 1);
q = 0;
for i = 1:n
    b(i) = norm(v);
    bq_prev = b(i) * q;
    q = v / b(i);
    v = A * q;
    a(i) = q' * v;
    v = v - a(i) * q - bq_prev;
end
b = b(2:n);
triA = diag(a) + diag(b, -1) + diag(b', 1);
eigvals = sort(eig(triA));
end