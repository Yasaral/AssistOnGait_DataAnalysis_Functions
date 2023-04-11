function [VCO2,VO2,HR] = loadExternalMetabolicCostData(datafile)

[~,txtData] = xlsread(datafile, 'A1:H1');

Text = {'V02','VCO2','HR'};
Indexing = {'A','B','C','D','E','F'};
Lines = '%s2:%s1000';


for i = 1:1:3
    for j = 2:1:6
        if isequal(txtData{j},Text{i})
            indexingdata = sprintf(Lines,Indexing{j},Indexing{j});
            if i == 1    
            VO2 = xlsread(datafile, indexingdata);
            elseif i == 2
            VCO2 = xlsread(datafile, indexingdata);
            else
            HR = xlsread(datafile, indexingdata);
            end
        end
    end
end
  
end
