function [] = plot_eigs( x, V, eigE, eigfuncs )
labels = cell(1, 4);
plot(x, V(x)); hold on;
labels{1} = ['V(x)'];
for i = [1:numel(eigE)]
    plot(x, eigE(i) + eigfuncs(i,:));
    labels{i+1} = ['E = ' num2str(eigE(i))];
end
legend(labels); hold off;
end
