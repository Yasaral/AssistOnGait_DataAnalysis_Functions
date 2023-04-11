function a = plotGaitNoExo(m, color)

if ~exist('color', 'var')
    color = 'b';
end

freq = 0.25;
x =  0:freq:freq*(max(size(m))-1);

a = plot(x, m, color, 'LineWidth', 2);
legend('boxoff')
grid off; hold off;box off;

end