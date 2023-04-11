function names = getFilesFromFolder(folder, prefix, ext)
% Get all file names matching the `prefix` from the folder.
% 
% - INPUTs:
% folder: str
%   directory name to be searched.
%
% prefix: str
%   to be searched in the file names.
%
% ext: [optional] str
%   extension of the files. '.dat' by default.
%
% - OUTPUT:
% files: Array[str]
%   names of the found files.
if ~exist('ext', 'var')
    ext = '.dat';
end
files = dir(strcat(folder, '/', prefix, '*', ext));
names = string();
for i = 1:length(files)
    names(i) = string(files(i).name);
end
