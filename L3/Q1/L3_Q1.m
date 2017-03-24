numh = 1000;
H = logspace(-4, -1, numh);

% error for the 3 methods. 1:Trapezoid, 2:Simpson's, 3:Euler-MacLaurin
err = zeros(numh, 3);
i = 1;
for h = H
    % num_erf_err adjusts h to give even int N; reassign H(i) thus.
    [err(i, :), H(i)] = num_erf_err(h, [1, 2, 3]);
    i = i + 1;
end

order = zeros(1, 3);
for i = [1, 2, 3]
    % fit only where error is above precision
    crest = find(err(:, i) > 1e-14, 1);
    loglinfit = polyfit(log(H(crest:end)), log(err(crest:end, i).'), 1);
    % method order of accuracy: negative slope of log linear fit
    order(i) = loglinfit(1);
end

loglog(H, err)
label1 = ['Trapezoid; order ' num2str(order(1))];
label2 = ['Simpson''s; order ' num2str(order(2))];
label3 = ['Euler-MacLaurin; order ' num2str(order(3))];
legend(label1, label2, label3, 'Location', 'northwest')