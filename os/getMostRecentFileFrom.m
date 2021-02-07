function fname = getMostRecentFileFrom(folder, ext)
% Get the most recent file name from the folder. This
% function works only if all files in the folder have
% the same naming format with (the same prefix and)
% time tags.
%
% See formattedNow for time tags.
%
% - INPUT:
% folder: str
%   directory name to be searched.
%
% - OUTPUT:
% fname: str
%   name of the found file.
if ~exist('ext', 'var')
    ext = '.dat';
end
names = dir(strcat(folder, '/*', ext));
recent = datetime([1900 1 1 0 0 0]);
idx = 0;
for i = 1:length(names)
    t = datetime(names(i).date, 'Locale', 'system');
    if t > recent
        recent = t;
        idx = i;
    end
end
fname = strcat(folder, '/', names(idx).name);
end
