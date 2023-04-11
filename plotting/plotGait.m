function p = plotGait(m, color, i)

if ~exist('color', 'var')
    color = 'b';
end

freq = 0.25;
x =  0:freq:freq*(max(size(m))-1);

p = plot(x, m, color, 'LineWidth', 2);
grid off; hold off;box off;

end