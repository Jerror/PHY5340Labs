%% Question 1 
%a)
N = randn(5,4);
%b)
N(3:end,2:end);
%c)
N(:, [2, 1, 3:end]);
%d)
N(end:-1:1, :);
%% Question 2
%a)
% e_vals = eig(Square_matrix)
%b)
% [e_vecs, e_vals] = eig(Square_matrix)
%% Question 3
%a)
type f.m
%b)
type g.m
%c)
type c.m
%% Question 4
%a)
tic
    n = 1e4; 
    t = sin(1:n) ./ sqrt(1:n);
    a = 3 * t - 1;
    b = prod(a);
vec_time = toc;
tic
    n = 1e4;
    for i = 1:n, t(i) = sin(i) / sqrt(i); end;
    for i = 1:n, a(i) = 3 * t(i) - 1; end;
    b = 1;
    for i = 1:n, b = b * a(i); end;
for_time = toc;
disp('The vectorized code is '), disp(for_time/vec_time), disp(' times faster.')