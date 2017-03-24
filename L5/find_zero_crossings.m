function [ indices ] = find_zero_crossings( x )
%return the indices {i} of x where x crosses zero from x(i) to x(i + 1)
indices = find(diff(sign(x)));
% diff(sign(y)) is nonzero only where the sign changes, ie., at
% zero-crossings
end

