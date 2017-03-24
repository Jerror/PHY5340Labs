function [] = plot_eigs( V, eigE, eigfuncs )
labels = cell(1, 4);
x = [-1:0.01:1];
plot(x, V(x)); hold on;
labels{1} = ['V(x)'];
for i = 1:3
    plot(eigfuncs{i}(1,:), eigE(i) + eigfuncs{i}(2,:));
    labels{i+1} = ['E = ' num2str(eigE(i))];
end
legend(labels); hold off;
end

