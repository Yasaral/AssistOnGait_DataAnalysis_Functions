function [m, s] = getAdaptationExternal(gait, data, dur)
% getAdaptation get the mean and standart deviations of
% start, mid, and end of an experiment
if ~exist('dur', 'var')
    dur = 6;   % min
end
exclude = 1/2; % min

[m(:,:,1), s(:,:,1)] = meanstd(separateGaits(gait, data));
[m(:,:,2), s(:,:,2)] = meanstd(separateGaits(gait, data));
[m(:,:,3), s(:,:,3)] = meanstd(separateGaits(gait, data));
end