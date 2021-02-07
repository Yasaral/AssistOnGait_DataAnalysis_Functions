function now = formattedNow(fmt)
% Get the date-time in the specified format. If not specified,
% fmt = 'yy-mm-dd--HH-MM'.
%
% - INPUT:
% fmt: str
%   date-time format. See datestr.
%
% - OUTPUT:
% now: str
%   formatted now.
if ~exist('fmt', 'var')
    fmt = 'yy-mm-dd--HH-MM';
end
now = datestr(datetime, fmt);
end

