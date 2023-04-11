function gaits = separateGaits(gaitData, data, range, t_sampling)

if exist('t_sampling', 'var')
    sec = 1/t_sampling;
else
    sec = 1000;
end
if exist('range', 'var')
    range = range * sec;
else
    range = [0, inf];
end
data = data';

% All indices of heel strikes. It's marked with a signal set to 1.
heelstrikes = find(gaitData(2,:) == 1);
% Eliminate the strike timings before and after some timestamps.
heelstrikes = heelstrikes(heelstrikes > range(1));
heelstrikes = heelstrikes(heelstrikes < range(2));

nStrikes = length(heelstrikes);
sData = size(data);
gaits = zeros(400, sData(2), nStrikes);
for i = 1:nStrikes - 1
    % num data points in this gait cycle.
    gaitlen = heelstrikes(i+1) - heelstrikes(i);
    if gaitlen > 3*sec
        continue;
    end
    gait = data(heelstrikes(i):heelstrikes(i+1)-1,:);
    gaits(:,:,i) = resample(gait, 400, gaitlen);
end
gaits = permute(gaits, [2 1 3]);
gaits = rad2deg(gaits);
end
