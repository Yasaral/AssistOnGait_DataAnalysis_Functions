function plotHipXY(mot)
figure; hold on
[~, ~, nplot] = size(mot(1,:,:));

for i = 1:nplot
    plot(mot(1,:,i), mot(2,:,i))
end
grid on; axis equal;
ylabel('y [m]')
xlabel('x [m]')
end
