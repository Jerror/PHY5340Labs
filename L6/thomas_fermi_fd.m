function [n, iter, rel_err] = thomas_fermi_fd(n, r, alpha, tol, max_iter)
N = numel(r);
h = r(2) - r(1);
nn = n;
iter = 0; done = false;
while ~done
    iter = iter + 1;
    if iter > max_iter
        disp('max iteration exceeded')
        break
    end
    for i = [2:N-1]
        % Gauss-Seidel
        n(i) = (nn(i+1) + n(i-1)) / (h^2 * (nn(i) / r(i))^.5 + 2);
        % Over-relaxation
        n(i) = n(i) + alpha * (n(i) - nn(i));
    end
    rel_err = abs((n - nn)./n);
    rel_err(isnan(rel_err)) = 0;
    if all(rel_err < tol)
        done = true;
    end
    nn = n;   
end
end
