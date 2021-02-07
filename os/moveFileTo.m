function dest = moveFileTo(file_name, folder, suffix, new_name)
% Move file to a directory by optionally renaming it.
%
% - INPUTS:
% file_name: str
%   file name with an extension.
%
% folder: str
%   destination directory.
%
% suffix [optional]: str
%   to be appended to the file name.
%
% new_name [optional]: str
%   to rename the file with the suffix.
%
% - OUTPUT:
% dest: str
%   destination file name.

if ~exist('suffix', 'var')
    suffix = '';
end
if ~exist('new_name', 'var')
    new_name = file_name;
end
new_name = split(new_name, '.');
dest = strcat(folder, '/', new_name{1}, '-', suffix, '.', new_name{2});
movefile(file_name, dest)
end

