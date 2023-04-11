function [SeperatedData,GaitData,Names,Condition,Values] = DataGen(Excel1,Excel2)

[Data1, NoExonames1, NoExogaitdata1,NoExocondition1,NoExosample1,NoExovalues1] = loadExternalData(Excel1);
[Data2, NoExonames2, NoExogaitdata2,NoExocondition2,NoExosample2,NoExovalues2] = loadExternalData(Excel2);

HipData= GaitSeperater(NoExogaitdata1, Data1,NoExogaitdata2, Data2,4); %Compares two hip data (Hip Code 4)
KneeData= GaitSeperater(NoExogaitdata1, Data1,NoExogaitdata2, Data2,3); %Compares two data (Knee Code 3)
SacrumData = GaitSeperater(NoExogaitdata1, Data1,NoExogaitdata2, Data2,8); %Compares two data (Sacrum Code 8)

%Outputs 
SeperatedData = [HipData;KneeData;SacrumData];
GaitData = [NoExogaitdata1,NoExogaitdata2];
Names = [NoExonames1;NoExonames2];
Condition = NoExocondition1;
Values = [NoExovalues1;NoExovalues2];


