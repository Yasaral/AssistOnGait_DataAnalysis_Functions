function [m, s] = getAdaptation(gait, data, dur)
% getAdaptation get the mean and standart deviations of
% start, mid, and end of an experiment
if ~exist('dur', 'var')
    dur = 6;   % min
end
exclude = 1/2; % min

sta = [  1/6     dur/3-exclude]*60; % sec
mid = [  dur/3 2*dur/3-exclude]*60; % sec
fin = [2*dur/3 3*dur/3-exclude]*60; % sec

[m(:,:,1), s(:,:,1)] = meanstd(separateGaits(gait, data, sta));
[m(:,:,2), s(:,:,2)] = meanstd(separateGaits(gait, data, mid));
[m(:,:,3), s(:,:,3)] = meanstd(separateGaits(gait, data, fin));
end
