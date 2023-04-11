function [alldat, t, signals] = loadTargetScopeData(dat_file)
% Load scope data into the workspace.
%
% - INPUT:
% dat_file: str
%   name of the target file.
% 
% - OUTPUTS:
% alldat: matrix
%   returned as an nxN matrix where n is the number of time
%   stamps and N is the number of data columns.
%
% t: vector
%   nx1 vector containing the simulation time.
%
% signals: vector[str]
%   Nx1 vector of data column names.

alldat = SimulinkRealTime.utils.getFileScopeData(dat_file);
signals = alldat.signalNames';

t = getSignals(alldat, "Time");
end
