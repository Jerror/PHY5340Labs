tol = 1E-6;
%% Bisection
disp(' ')
disp('Solving by bisection...')
[eq_pos, est_err, numiter] = bisect(50, tol, @(r)NaCl_force(r), 0.1, 15)
if check_extremum(@(r)NaCl_pot(r), eq_pos, 10*tol) == -1
    disp('This is a point of minimum potential.')
end
%% Newton-Raphson
disp(' ')
disp('Solving by the Newton-Raphson method...')
[eq_pos, est_err, numiter] = NR(50, tol, @(r)NaCl_force(r),...
                                @(r)NaCl_stiffness(r), 1)
if check_extremum(@(r)NaCl_pot(r), eq_pos, 10*tol) == -1
    disp('This is a point of minimum potential.')
end
%% Secant
disp(' ')
disp('Solving by the secant method...')
[eq_pos, est_err, numiter] = secant_NR(50, tol, @(r)NaCl_force(r), 1, 0.5)
if check_extremum(@(r)NaCl_pot(r), eq_pos, 10*tol) == -1
    disp('This is a point of minimum potential.')
end