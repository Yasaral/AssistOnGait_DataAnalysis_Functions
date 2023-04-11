function plotAdaptation(gait, data, ylabels)

[mdr, sdr] = getAdaptation(gait(:,:,1), data(:,:,1));
[mdl, sdl] = getAdaptation(gait(:,:,2), data(:,:,2));
[mfr, sfr] = getAdaptation(gait(:,:,1), gait(1,:,1));
[mfl, sfl] = getAdaptation(gait(:,:,2), gait(1,:,2));

r = length(ylabels);
for j = 1:3
    subplot(r+1, 3, j)
    plotGaitMeanStd(mfr(1,:,j), sfr(1,:,j), 'b')
    hold on;
    plotGaitMeanStd(mfl(1,:,j), sfl(1,:,j), 'r')
    grid on;
    hold off;
    ylabel("FSR Voltage [V]")
end
for i = 1:r
    for j = 1:3
        subplot(r+1, 3, (i-1)*3+j+3)
        plotGaitMeanStd(mdr(i,:,j), sdr(i,:,j), 'b')
        hold on;
        plotGaitMeanStd(mdl(i,:,j), sdl(i,:,j), 'r')
        grid on;
        hold off;
        ylabel(ylabels(i))
    end
end
end
