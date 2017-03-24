function [ miss, xa, xb, psia, psib ] = shooter( V, E, x0a, x0b, xm, inita, initb, tol )
% Solve the TISE to xm from x0a on the left and x0b on the right and return
% the offset 'miss' from the matching condition and the solutions for
% increasing x
[xa, ua] = solve_TISE( x0a, xm, inita, V, E, tol );
[xb, ub] = solve_TISE( x0b, xm, initb, V, E, tol );
miss = ua(2,end)/ua(1,end) - ub(2,end)/ub(1,end);
psia = ua(1,:);
psib = fliplr(ub(1,:));
xb = fliplr(xb);
end

