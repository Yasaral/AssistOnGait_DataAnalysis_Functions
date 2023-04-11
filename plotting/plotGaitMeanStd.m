function p = plotGaitMeanStd(m, s, color, alpha)

if ~exist('color', 'var')
    color = 'b';
end


freq = 0.25;
x =  0:freq:freq*(max(size(m))-1);

s1 = m + s;
s2 = m - s;
x2 = [x, fliplr(x)];
inBetween = [s1, fliplr(s2)];

fill(x2, inBetween, color, 'edgecolor', color,...
     'facealpha', alpha, 'edgealpha', alpha);
hold on;
p = plot(x, m, color, 'LineWidth', 2);
grid off; hold off; box off;
end
