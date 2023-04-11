function plotAdaptedvsIMU(gait, data, experimentaldata, externaldata,condition,sample)

Hipangle = experimentaldata(4,:);

[mdr, sdr] = getAdaptation(gait(:,:,1), data(:,:,1));
[mdl, sdl] = getAdaptation(gait(:,:,2), data(:,:,2));
[mfr, sfr] = getAdaptation(gait(:,:,1), gait(1,:,1));
[mfl, sfl] = getAdaptation(gait(:,:,2), gait(1,:,2));

externalseperateddata = separateGaitsExternalData(Hipangle, externaldata);

smoothedData(1,:) = smoothdata(externalseperateddata(1,:),'gaussian',20);
smoothedData(2,:) = smoothdata(externalseperateddata(2,:),'gaussian',20);
smoothedData(3,:) = smoothdata(externalseperateddata(3,:),'gaussian',20);

% figure
% plot(externalseperateddata(1,:));
% hold on;
% plot(smoothedData(1,:));
% ylabel('Hip Angle [Rad]');
% xlabel('Gait Phase [%]');
% grid on;


% plotGaitMeanStdModified(mdr(1,:,1),sdr(1,:,1),mdr(2,:,1),sdr(2,:,1),'b','y')

figure
formatSpec = "Condition: %s Sample: %i";
sgtitle(sprintf(formatSpec,condition,sample))
for i = 1:3
    for j = 1:3
        subplot(3, 3, (i-1)*3+j)
        plotGaitMeanStd(mdr(3,:,j), sdr(3,:,j), 'b')
        hold on;
        plotGait(externalseperateddata(i,:), 'r',i)
        grid off; hold off; box off;
        ylabel('Hip Angle [Rad]')     
        ylim([-0.3,0.5]);        
        if j == 1
           title('Sta')
        elseif j == 2 
            title('Mid')
        else 
            title('Fin')
        end
        
    end
end

end
