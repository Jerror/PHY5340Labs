function [open_dir] = check_extremum(func, r, delta)
sgn_diff_l = sign(func(r) - func(r - delta));
sgn_diff_r = sign(func(r) - func(r + delta));
if (sgn_diff_l * sgn_diff_r) ~= 1, open_dir = 0; return, end
open_dir = sgn_diff_l;
end