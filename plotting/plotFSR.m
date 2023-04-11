function plotFSR(gait, freq)
if ~exist('freq', 'var')
    freq = 0.001;
end
plotMultiAxis(gait(1,:,:), "Voltage [V]", [1,1], freq)
grid on;
xlabel('Time [s]')
end
