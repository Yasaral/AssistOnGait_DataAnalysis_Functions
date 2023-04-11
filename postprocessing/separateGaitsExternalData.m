function gaits = separateGaitsExternalData(gaitdata, Hipangle)

sec = 1000;
Hipangle = Hipangle';
% All indices of heel strikes. It's marked with a signal set to 1.
heelstrikes = find(gaitdata(1,:) == 1);
% Eliminate the strike timings before and after some timestamps.
% heelstrikes = heelstrikes(heelstrikes > range(1));
% heelstrikes = heelstrikes(heelstrikes < range(2));

nStrikes = length(heelstrikes);
gaits = zeros(nStrikes-1,400);
for i = 1:nStrikes-1
    % num data points in this gait cycle.
    gaitlen = heelstrikes(i+1) - heelstrikes(i);
    if gaitlen > 3*sec
        continue;
    end
    gait = Hipangle(heelstrikes(i):heelstrikes(i+1)-1);
    samples = 1:1:length(gait(:,1));
    up_sample = linspace(1,length(samples),400);
    gaits(i,:) = interp1(samples,gait(:,1),up_sample);
    %gaits(i,:) = resample(gait, 400, gaitlen);
end

end
