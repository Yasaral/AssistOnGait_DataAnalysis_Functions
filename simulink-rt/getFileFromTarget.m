function getFileFromTarget(target, file)
% Store the file in current working directory.
%
% - INPUTS:
% target: str
%   name of the target PC.
% file: str
%   name of the file to get from the target.

tg = SimulinkRealTime.target(target);
tgdrive = SimulinkRealTime.openFTP(tg);
mget(tgdrive, file);
tgdrive.close();
end
