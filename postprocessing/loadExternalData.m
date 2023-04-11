function [data, names, gait, condition,sample,values,kneevalues] = loadExternalData(datafile)
% datafile = 'Can 4 Gait Cycles v2.xlsx';

[~,~,header] = xlsread(datafile, 'A1:B11');

%Shift
% header{8,2} = round(((header{9,2}-header{8,2})*0.07)+header{8,2});
% header{9,2} = round(((header{10,2}-header{9,2})*0.07)+header{9,2});
% header{10,2} = round(((header{11,2}-header{10,2})*0.07)+header{10,2});
% header{11,2} = round(((header{11,2}-header{10,2})*0.07)+header{11,2});

[~,~,names] = xlsread(datafile, 'A13:R13');
[vals,~,~] = xlsread(datafile, ['A14:R' num2str(header{7,2} + 15)]);
% [~,~,header] = xlsread(datafile, 'A1:B11');


data = vals(header{8,2}:header{11,2}-1, :)';
gait = zeros(1,size(data,2));
gait([0, header{9,2}-header{8,2}, header{10,2}-header{8,2}, header{11,2}-header{8,2}] + 1) = 1;
condition = header{4,2};
values = vals(:,3);
sample = header{5,2};
names = names';
