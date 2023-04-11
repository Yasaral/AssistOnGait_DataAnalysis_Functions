function data = getSignals(datastruct, signals)
% Extract the signals given by a list of names.

% Number of desired signals
nsig = length(signals);
% All signals in the struct
names = datastruct.signalNames;

% Get the indices of the desired signals and read the data from struct.
idx = zeros(nsig, 1);
for i = 1:nsig
    idx(i) = find(strcmp(names, signals(i)));
end
data = datastruct.data(:, idx);
end
