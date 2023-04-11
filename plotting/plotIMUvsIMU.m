function plotIMUvsIMU(externaldata, externaldata_2, condition, condition_2)

maxval = max([findpeaks(externaldata),findpeaks(externaldata_2)]);
minval = min(-[findpeaks(-externaldata),findpeaks(-externaldata_2)]);

fig = figure;
removeToolbarExplorationButtons(fig);
formatSpec = "%s vs %s";
sgtitle(sprintf(formatSpec,condition,condition_2))
plotGaitNoExo(externaldata-5.72958, 'r')
hold on;
plotGaitNoExo(externaldata_2-5.72958, 'b')
ylabel('Hip Angle [Deg]') 
xlabel('Gait Cycle %') 
legend(condition,condition_2);
ylim([minval-10 maxval+10])
end