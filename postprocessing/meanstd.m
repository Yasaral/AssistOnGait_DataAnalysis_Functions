function [m, s] = meanstd(data)

m = mean(data, 3);
s = std(data, 0, 3);
end
