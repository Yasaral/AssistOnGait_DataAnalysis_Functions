function ExternalGaitAveraged = GaitSeperater(externalgait, externaldata,externalgait_2, externaldata_2,i)

Hipangle = externaldata(i,:);
Hipangle_2 = externaldata_2(i,:);

Sample1 = separateGaitsExternalData(externalgait, Hipangle);
Sample2 = separateGaitsExternalData(externalgait_2, Hipangle_2);

ExternalGait = [Sample1;Sample2];
ExternalGaitAveraged = mean(ExternalGait);
