function plotAdaptedvsAdapted(gait, data, gait_2, data_2, condition, condition_2)

% Hipangle = experimentaldata(4,:);
% Hipangle_2 = experimentaldata_2(4,:);

%[mdr, sdr] = getAdaptation(gait(:,:,1), data(:,:,1));

[m, s] = meanstd(separateGaits(gait(:,:,1), data(:,:,1)));
[m_2, s_2] = meanstd(separateGaits(gait_2(:,:,1), data_2(:,:,1)));
%[m(:,:,2), s(:,:,2)] = meanstd(separateGaits(gait(:,:,1), data(:,:,1)));
%[m(:,:,3), s(:,:,3)] = meanstd(separateGaits(gait(:,:,1), data(:,:,1)));



figure
formatSpec = "%s vs %s";
sgtitle(sprintf(formatSpec,condition,condition_2))
%for i = 1:3
%       subplot(3, 1, i)
        p = plotGaitMeanStd(m(3,:), s(3,:), 'b');
        hold on;
        k = plotGaitMeanStd(m_2(3,:), s_2(3,:), 'r');
        grid off; hold off; box off;
        legend([p,k],{condition,condition_2});
        ylabel('Hip Angle [Rad]')  
        xlabel('Gait Cycle %')
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