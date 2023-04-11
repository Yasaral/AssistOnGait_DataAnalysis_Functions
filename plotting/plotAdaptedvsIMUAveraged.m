function plotAdaptedvsIMUAveraged(gait, data, externaldata, condition, condition_2)


[m, s] = meanstd(separateGaits(gait(:,:,1), data(:,:,1)));
%[m(:,:,2), s(:,:,2)] = meanstd(separateGaits(gait(:,:,1), data(:,:,1)));
%[m(:,:,3), s(:,:,3)] = meanstd(separateGaits(gait(:,:,1), data(:,:,1)));

% figure
% formatSpec = "%s vs %s";
% sgtitle(sprintf(formatSpec,condition,condition_2))
% plotGaitNoExo(ExternalGaitAveraged_1, 'r')
% hold on;
% plotGaitNoExo(ExternalGaitAveraged_2, 'b')


figure
formatSpec = "%s vs %s";
sgtitle(sprintf(formatSpec,condition,condition_2))
%for i = 1:3
%       subplot(3, 1, i)
        p = plotGaitMeanStd(m(3,:), s(3,:), 'b');
        hold on;
        k = plotGait(externaldata-10, 'r');
        grid off; hold off; box off;
        legend([p,k],{condition,condition_2});
        ylabel('Hip Angle [Rad]');
        xlabel('Gait Cycle %');
        ylim([-0.3,0.5]);        
%         if i == 1
%            title('Sta')
%         elseif i == 2 
%            title('Mid')
%         else 
%            title('Fin')
%         end
%end

end