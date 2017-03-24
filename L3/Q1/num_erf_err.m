function [ err, hh, numerical ] = num_erf_err( h, method_handles )
g = @(y)2/sqrt(pi)*exp(-y.^2);
exact = 0.842700792949715;

N = 2*round(1/(2*h)); % ensuring N is even!
hh = 1/N; % interval size after correction for even integer N
nmethods = size(method_handles, 2);
err = zeros(1, nmethods); numerical = zeros(1, nmethods);
i = 1;
for method_handle = method_handles
    switch method_handle
        case 1
            numerical(i) = trap(g, 0, 1, N);
        case 2
            numerical(i) = simp(g, 0, 1, N);
        case 3
            gprime = @(y)-2*y.*g(y);
            numerical(i) = emacl(g, gprime, 0, 1, N);
        otherwise
            numerical(i) = 0;
    end
    err(i) = abs((numerical(i) - exact)/exact);
    i = i + 1;
end
end