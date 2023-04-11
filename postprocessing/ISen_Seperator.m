function [Obq,Rot] = ISen_Seperator(datafile)
% Designed for ISen Data, Excel file should be modified according to gait events

Index = xlsread(datafile, 'I:I');
PelvicObq = xlsread(datafile, 'E:E');
PelvicRot = xlsread(datafile, 'G:G');

if exist('t_sampling', 'var')
    sec = 1/t_sampling;
else
    sec = 1000;
end
if exist('range', 'var')
    range = range * sec;
else
    range = [0, inf];
end

% All indices of heel strikes. It's marked with a signal set to 1.
heelstrikes = find(Index(:,1) == 1);
% Eliminate the strike timings before and after some timestamps.
heelstrikes = heelstrikes(heelstrikes > range(1));
heelstrikes = heelstrikes(heelstrikes < range(2));

%% Pelvis Obq 
nStrikes = length(heelstrikes);
sData = size(PelvicObq);
Obq = zeros(400, sData(2), nStrikes);
for i = 1:nStrikes - 1
    % num data points in this gait cycle.
    gaitlen = heelstrikes(i+1) - heelstrikes(i);
    if gaitlen > 3*sec
        continue;
    end
    gait_1 = PelvicObq(heelstrikes(i):heelstrikes(i+1)-1,:);
    samples = 1:1:length(gait_1(:,1));
    up_sample = linspace(1,length(samples),400);
    Obq(:,:,i) = interp1(samples,gait_1(:,:),up_sample);
end


%% Rotation 

nStrikes = length(heelstrikes);
sData = size(PelvicRot);
Rot = zeros(400, sData(2), nStrikes);
for i = 1:nStrikes - 1
    % num data points in this gait cycle.
    gaitlen = heelstrikes(i+1) - heelstrikes(i);
    if gaitlen > 3*sec
        continue;
    end
    gait_1 = PelvicRot(heelstrikes(i):heelstrikes(i+1)-1,:);
    samples = 1:1:length(gait_1(:,1));
    up_sample = linspace(1,length(samples),400);
    Rot(:,:,i) = interp1(samples,gait_1(:,:),up_sample);
end


end
%gaits = permute(gaits, [2 1 3]);
% end
