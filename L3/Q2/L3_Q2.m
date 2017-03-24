A = [[12 13  2  -4  -7]
     [13 14  7  -4  12]
     [ 2  7  6  10   5]
     [-4 -4 10 -12  -1]
     [-7 12  5  -1 -10]];

precise_eigs = eig(A);
my_eigs = lanczos(A, 5);
err = NaN(5);
c = zeros(5, 2);
for i = 1:5
    err(1:i, i) = (lanczos(A, i) - precise_eigs(1:i)) ./ precise_eigs(1:i);
    c(i, 1) = det(A - my_eigs(i)*eye(5));
    c(i, 2) = det(A - precise_eigs(i)*eye(5));
end
err
disp('err(n, m) is relative error in nth eigval for m Lanczos iterations.')
c
disp(['c(n, m) is det(A - e(n)*I) for e of m=1->lanczos(A, 5) and' ...
      ' m=2->eig(A).'])