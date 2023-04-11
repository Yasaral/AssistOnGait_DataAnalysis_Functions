function plotMultiAxis(y, ylabels, shape, tsamp, lims)
% Displays several channels on a grid of subplots.
% 
% - INPUTS:
% y:    3-D matrix
%   m by n by p matrix where the m rows are separate
%   channels to be plotted on separate subplots, the
%   n columns are the data points at each time stamp,
%   and p pages are plotted on top of the corresponding
%   channels.
%
% ylabels: [optional] Array[Str]
%   m number of labels of the channels. If the length
%   is not m, doesn't add any label.
%
% shape: [optional] 1 by 2 array
%   The shape of the subplot array. E.g. for
%   shape = [2, 3], the subplots are arranged as 2 rows
%   by 3 columns. By default, plots all channels as one
%   column.
% 
% tsamp: [optional] float
%   Sampling time of the data. If not provided, the
%   x-axis represents the number of samples.
%
% lims: [optional] 1 by 2 array
%   Starting and ending indices of the samples. If
%   assigned, crops the data.

[m, n, p] = size(y);

if ~exist('ylabels', 'var')
    ylabels = "no label";
end
if ~exist('shape', 'var')
    shape = [m, 1];
end
if ~exist('lims', 'var')
    lims = [0, n];
end
if exist('tsamp', 'var')
    t = lims(1):tsamp:tsamp*(n-1);
else
    t = lims(1):1:n-1;
end

for i = 1:m
    subplot(shape(1), shape(2), i);
    hold on;    
    for j = 1:p
        plot(t, y(i,:,j))
    end
    if length(ylabels) == m
        ylabel(ylabels(i))
    end
    grid on;
    hold off;
end
xlabel('Time')
end
