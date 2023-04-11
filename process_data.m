clear
addpath('./AssistOnGait-proc/simulink-rt/',...
        './AssistOnGait-proc/os/',...
        './AssistOnGait-proc/postprocessing/',...
        './AssistOnGait-proc/plotting/',...
        './ExoData/XYData/',...
        './IMUData/Cagatay/',...
        './IMUData/Can/',...
        './IMUData/Cansu/',...
        './IMUData/Deniz/',...
        './IMUData/Ece/',...
        './IMUData/Ekrem/',...
        './IMUData/Emel/',...,
        './IMUData/Feyza/',...
        './IMUData/Gokce/',...
        './IMUData/Kemal/',...
        './IMUData/Mehmet/',...
        './ExoData');
% load hip_moment.mat
%% READ DATA FROM TARGET 1
% clc;
% close all;

ExoCondition1 = 'H0';
folder1 = 'Exp-AliY-%s';
index = 1;
% indexs = '12';
folders = 'Exp-AliYH0-%s';
% storeTargetFile('alldata.dat', folder);
folder1 = sprintf(folder1,ExoCondition1);
% fname = getMostRecentFileFrom(folder);
sample1 = getFilesFromFolder(folder1, 'subject');
fname1 = [folder1 '/' char(sample1(index))];
[alldat1, t1, signals1] = loadTargetScopeData('alldata-Locked.dat');
%% READ DATA FROM TARGET COMPARISON DATA 2
% % close all;
% ExoCondition2 = 'H0';
% folder2 = 'Exp-AliY-%s';
% % storeTargetFile('alldata.dat', folder);
% folder2 = sprintf(folder2,ExoCondition2);
% % fname = getMostRecentFileFrom(folder);
% sample2 = getFilesFromFolder(folder2, 'subject');
% fname2 = [folder2 '/' char(sample2(1))];
% [alldat2, t2, signals2] = loadTargetScopeData(fname2);
% %% READ DATA FROM TARGET COMPARISON DATA 3
% % close all;
% ExoCondition3 = 'H1';
% folder3 = 'Exp-AliY-%s';
% % storeTargetFile('alldata.dat', folder);
% folder3 = sprintf(folder3,ExoCondition3);
% % fname = getMostRecentFileFrom(folder);
% sample3 = getFilesFromFolder(folder3, 'subject');
% fname3 = [folder3 '/' char(sample3(12))];
% [alldat3, t3, signals3] = loadTargetScopeData(fname3);
% %% READ DATA FROM TARGET COMPARISON DATA 4
% % close all;
% ExoCondition4 = 'H2';
% folder4 = 'Exp-AliY-%s';
% % storeTargetFile('alldata.dat', folder);
% folder4 = sprintf(folder4,ExoCondition4);
% % fname = getMostRecentFileFrom(folder);
% sample4 = getFilesFromFolder(folder4, 'subject');
% fname4 = [folder4 '/' char(sample4(12))];
% [alldat4, t4, signals4] = loadTargetScopeData(fname4);
%% INSPECT FORCE REACTIONS
ft   = getFTdata(alldat1);
gait = getGaitData(alldat1);%, [4 4]);
mot  = getMotData(alldat1);
pos = getMotRefData(alldat1);

%Comparison Data 2
% ft2   = getFTdata(alldat2);
% gait2 = getGaitData(alldat2);%, [4 4]);
% mot2  = getMotData(alldat2);
% pos2 = getMotRefData(alldat2);
% 
% %Comparison Data 3
% ft3   = getFTdata(alldat3);
% gait3 = getGaitData(alldat3);%, [4 4]);
% mot3  = getMotData(alldat3);
% pos3 = getMotRefData(alldat3);
% 
% 
% %Comparison Data 4
% ft4   = getFTdata(alldat4);
% gait4 = getGaitData(alldat4);%, [4 4]);
% mot4  = getMotData(alldat4);
% pos4 = getMotRefData(alldat4);

% refM = getMotRefData(alldat);
% refF = getForceRefData(alldat);
% motD = getDiskMotData(alldat);
% mT   = getMotorDemTorques(alldat);
%%
%IMU GAIT DATA,

% Names = {'Can','Cansu','Deniz','Ece','Ekrem','Emel','Feyza','Gokce','Kemal','Mehmet','Cagatay'};
% 
% NoExoHip = [];
% NoExoKnee = [];
% NoExoAnkle = [];
% NoExoHipAbd = [];
% H0Hip = [];
% H0Knee = [];
% H0Ankle = [];
% H0HipAbd = [];
% H1Hip = [];
% H1Knee = [];
% H1Ankle = [];
% H1HipAbd = [];
% H2Hip = [];
% H2Knee = [];
% H2Ankle = [];
% H2HipAbd = [];
% 
% % MaxHipSep = [];
% % MaxKneeSep = [];
% % MaxAnkleSep = [];
% % MaxHipAbdSep = [];
% 
%  for i = 1:1:3
%     for j = 1:1:10
%       ExcelName = '%s %i v3.xlsx';    
%       folder1 = sprintf(ExcelName,Names{i},j);
%       %SubName = sprintf(ExcelName,'Can',j);
%         
%     [Data,Name,GaitData,Condition,Sample] = loadExternalData(folder1);
%         
%          Hip = Data(4,:);
%          Knee = Data(3,:);
%          Ankle = Data(2,:);
%          HipAbd = Data(5,:); 
% %          HipSeperated = maxseparateGaitsExternalData(GaitData, Hip);
% %          HipSeperated_Cor = Corrector(separateGaitsExternalData(GaitData, Hip));
%          HipSeperated = mean(Corrector(separateGaitsExternalData(GaitData, Hip)));
%          KneeSeperated = mean(Corrector(separateGaitsExternalData(GaitData, Knee)));
%          AnkleSeperated = mean(Corrector(separateGaitsExternalData(GaitData, Ankle)));
%          HipAbdSeperated = mean(Corrector(separateGaitsExternalData(GaitData, HipAbd)));
%          
%          
%         
% %          MaxHipSep = Corrector(separateGaitsExternalData(GaitData, Hip));
% %          MaxKnee = Corrector(separateGaitsExternalData(GaitData, Knee));
% %          MaxAnkle = Corrector(separateGaitsExternalData(GaitData, Ankle));
% %          MaxHip = Corrector(separateGaitsExternalData(GaitData, HipAbd));
%     
%         if isequal('No Exo', Condition )
%             NoExoHip = cat(1,NoExoHip,HipSeperated);
%             NoExoKnee = cat(1,NoExoKnee,KneeSeperated);
%             NoExoAnkle = cat(1,NoExoAnkle,AnkleSeperated);
%             NoExoHipAbd = cat(1,NoExoHipAbd,HipAbdSeperated);      
%         elseif isequal('H0', Condition )
%             H0Hip = cat(1,H0Hip,HipSeperated);
%             H0Knee = cat(1,H0Knee,KneeSeperated);
%             H0Ankle = cat(1,H0Ankle,AnkleSeperated);
%             H0HipAbd = cat(1,H0HipAbd,HipAbdSeperated);
%         end
%         
%         if isequal('H1', Condition)
%             H1Hip = cat(1,H1Hip,HipSeperated);
%             H1Knee = cat(1,H1Knee,KneeSeperated);
%             H1Ankle = cat(1,H1Ankle,AnkleSeperated);
%             H1HipAbd = cat(1,H1HipAbd,HipAbdSeperated);
%         elseif isequal('H2', Condition )
%             H2Hip = cat(1,H2Hip,HipSeperated);
%             H2Knee = cat(1,H2Knee,KneeSeperated);
%             H2Ankle = cat(1,H2Ankle,AnkleSeperated);
%             H2HipAbd = cat(1,H2HipAbd,HipAbdSeperated);
%         end   
%       
%     end
%  end



 
 


% for i = 1:1:1
%     for j = 1:1:10
%       ExcelName = '%s %i v3.xlsx';    
%       folder1 = sprintf(ExcelName,Names{i},j);
%       %SubName = sprintf(ExcelName,'Can',j);
%         
%     [Data,Name,GaitData,Condition,Sample] = loadExternalData(folder1);
%         
%          Hip = Data(4,:);
%          Knee = Data(3,:);
%          Ankle = Data(2,:);
%          HipAbd = Data(5,:); 
% %          HipSeperated = maxseparateGaitsExternalData(GaitData, Hip);
% %         
% %HipSeperated_Cor = Corrector(separateGaitsExternalData(GaitData, Hip));
%          HipSeperated = Corrector(separateGaitsExternalData(GaitData, Hip));
%          KneeSeperated = Corrector(separateGaitsExternalData(GaitData, Knee));
%          AnkleSeperated = Corrector(separateGaitsExternalData(GaitData, Ankle));
%          HipAbdSeperated = Corrector(separateGaitsExternalData(GaitData, HipAbd));
%          
%          if isequal('No Exo', Condition )
%             NoExoHip = cat(1,NoExoHip,HipSeperated);
%             NoExoKnee = cat(1,NoExoKnee,KneeSeperated);
%             NoExoAnkle = cat(1,NoExoAnkle,AnkleSeperated);
%             NoExoHipAbd = cat(1,NoExoHipAbd,HipAbdSeperated);      
%         elseif isequal('H0', Condition )
%             H0Hip = cat(1,H0Hip,HipSeperated);
%             H0Knee = cat(1,H0Knee,KneeSeperated);
%             H0Ankle = cat(1,H0Ankle,AnkleSeperated);
%             H0HipAbd = cat(1,H0HipAbd,HipAbdSeperated);
%         end
%         
%         if isequal('H1', Condition)
%             H1Hip = cat(1,H1Hip,HipSeperated);
%             H1Knee = cat(1,H1Knee,KneeSeperated);
%             H1Ankle = cat(1,H1Ankle,AnkleSeperated);
%             H1HipAbd = cat(1,H1HipAbd,HipAbdSeperated);
%         elseif isequal('H2', Condition )
%             H2Hip = cat(1,H2Hip,HipSeperated);
%             H2Knee = cat(1,H2Knee,KneeSeperated);
%             H2Ankle = cat(1,H2Ankle,AnkleSeperated);
%             H2HipAbd = cat(1,H2HipAbd,HipAbdSeperated);
%         end
% 
% 
% 
%          HipSeperated_C = max(Corrector(separateGaitsExternalData(GaitData, Hip)),[],2);
%          KneeSeperated_C = max(Corrector(separateGaitsExternalData(GaitData, Knee)),[],2);
%          AnkleSeperated_C = max(Corrector(separateGaitsExternalData(GaitData, Ankle)),[],2);
%          HipAbdSeperated_C = max(Corrector(separateGaitsExternalData(GaitData, HipAbd)),[],2);
%     end 
% end
% 
% 

% for i = 1:1:6
%    figure
%    findpeaks(NoExoAnkle(i,:))
%    hold on
%    findpeaks(-NoExoAnkle(i,:))
%    legend('Max','Min')
% end
% 
% plot(H0Ankle(1,:))


% NoExoSample1 = 'Can 1 Gait Cycles v2.xlsx';
% NoExoSample2 = 'Can 2 Gait Cycles v2.xlsx';
% H2Sample1 = 'Can 3 Gait Cycles v2.xlsx';
% H2Sample2 = 'Can 4 Gait Cycles v2.xlsx';
% H1Sample1 = 'Can 5 Gait Cycles v2.xlsx';
% H1Sample2 = 'Can 6 Gait Cycles v2.xlsx';
% H0Sample1 = 'Can 7 Gait Cycles v2.xlsx';
% H0Sample2 = 'Can 8 Gait Cycles v2.xlsx';
% NoExo2Sample1 = 'Can 9 Gait Cycles v2.xlsx';
% NoExo2Sample2 = 'Can 10 Gait Cycles v2.xlsx';

% [C1Data,C1gaitdata,C1Names,C1Condition,C1Values] = DataGen(NoExoSample1,NoExoSample2);
% [C2Data,C2gaitdata,C2Names,C2Condition,C2Values] = DataGen(H0Sample1,H0Sample2);    
% 
% [C3HipData,C3KneeData,C3gaitdata,C3Names,C3Condition,C3Values] = DataGen(H1Sample1,H1Sample2);    
% [C4HipData,C4KneeData,C4gaitdata,C4Names,C4Condition,C4Values] = DataGen(H2Sample1,H2Sample2);  
% [C5HipData,C5KneeData,C5gaitdata,C5Names,C5Condition,C5Values] = DataGen(NoExo2Sample1,NoExo2Sample2); 
% 
% Exo = 'Exo %s';
% ExoCondition1 = sprintf(Exo,ExoCondition1);
% ExoCondition2 = sprintf(Exo,ExoCondition2);
% ExoCondition3 = sprintf(Exo,ExoCondition3);
% ExoCondition4 = sprintf(Exo,ExoCondition4);
 
% m = [];
% 
% 
% 
%     
%     m = [];
%     for t = 1:1:3
%      m = findpeaks(Hippeaks(t,:))
%     end 


%HipMean 
% NoExoHipMean =  mean(NoExoHip);
% NoExoHipStd =  std(NoExoHip);
% 
% H0HipMean =  mean(H0Hip);
% H0HipStd =  std(H0Hip);
% 
% H1HipMean =  mean(H1Hip);
% H1HipStd =  std(H1Hip);
% 
% H2HipMean =  mean(H2Hip);
% H2HipStd =  std(H2Hip);
% 
% %KneeMean
% NoExoKneeMean =  mean(NoExoKnee);
% NoExoKneeStd =  std(NoExoKnee);
% 
% H0KneeMean =  mean(H0Knee);
% H0KneeStd =  std(H0Knee);
% 
% H1KneeMean =  mean(H1Knee);
% H1KneeStd =  std(H1Knee);
% 
% H2KneeMean =  mean(H2Knee);
% H2KneeStd =  std(H2Knee);
% 
% %AnkleMean
% NoExoAnkleMean =  mean(NoExoAnkle);
% NoExoAnkleStd =  std(NoExoAnkle);
% 
% H0AnkleMean =  mean(H0Ankle);
% H0AnkleStd =  std(H0Ankle);
% 
% H1AnkleMean =  mean(H1Ankle);
% H1AnkleStd =  std(H1Ankle);
% 
% H2AnkleMean =  mean(H2Ankle);
% H2AnkleStd =  std(H2Ankle);
% 
% %HipAbdMean
% NoExoHipAbdMean =  mean(NoExoHipAbd);
% NoExoHipAbdStd =  std(NoExoHipAbd);
% 
% H0HipAbdMean =  mean(H0HipAbd);
% H0HipAbdStd =  std(H0HipAbd);
% 
% H1HipAbdMean =  mean(H1HipAbd);
% H1HipAbdStd =  std(H1HipAbd);
% 
% H2HipAbdMean =  mean(H2HipAbd);
% H2HipAbdStd =  std(H2HipAbd);


steps =  separateGaits_interpolation(gait(:,:,1), mot(:,:,1));

% [m1, s1] = meanstd(separateGaits_interpolation(gait(:,:,1), mot(:,:,1)));
% [m2, s2] = meanstd(separateGaits_interpolation(gait3(:,:,1), mot3(:,:,1)));
% [m3, s3] = meanstd(separateGaits_interpolation(gait4(:,:,1), mot4(:,:,1)));


%% IMU STD  
% %HIP 
% figure('DefaultAxesFontSize',18);
% noexo = plotGaitMeanStd(NoExoHipMean, NoExoHipStd, 'r',0.4);
% hold on
% h0 = plotGaitMeanStd(H0HipMean, H0HipStd, 'c',0.4);
% hold on
% h1 = plotGaitMeanStd(H1HipMean, H1HipStd, 'g',0.4);
% hold on
% h2 = plotGaitMeanStd(H2HipMean, H2HipStd, 'b',0.4);
% % 
% [mrlocked(:,:,1), sllocked(:,:,1)] = meanstd(separateGaits_interpolation(gait(:,:,1), (mot(:,:,1))));
% hold on
% hLocked = plotGaitMeanStd(rad2deg(mrlocked(3,:,1)), rad2deg(sllocked(3,:,1)), 'k',0.4);
% % 
% legend([noexo h0 h1 h2 hLocked],{'NoExo','Passive Mode','Compensated Mode','Virtual Constraint Mode','Locked Mode'},'Location','southwest');
%  ylabel('Hip Flextion-Extension Angle [Deg]')  
%  xlabel('Gait Cycle %')
%  legend('boxoff')
% 
%     set(gcf,'PaperOrientation','landscape');
%      print(gcf,'HIP','-dpdf','-bestfit','-painters')
% 
% RMSPESH0 = sqrt(mean((((H0HipMean)-(NoExoHipMean)))/(H0HipMean)).^2)*100;
% 
% RMSPESH1 = sqrt(mean((((H1HipMean)-(NoExoHipMean)))/(H1HipMean)).^2)*100; 
%  
% RMSPESH2 = sqrt(mean((((H2HipMean)-(NoExoHipMean)))/(H2HipMean)).^2)*100;  
% 
% RMSPESLocked = sqrt(mean(((rad2deg(mrlocked(3,:,1))-(NoExoHipMean)))/rad2deg(mrlocked(3,:,1))).^2)*100; 
% % 

%MAX MİN
% maxNo = findpeaks(NoExoHipMean-5.72958);
% minNo = -findpeaks(-(NoExoHipMean-5.72958));
% maxH0 = findpeaks(H0HipMean-5.72958);
% minH0 = -findpeaks(-(H0HipMean-5.72958));
% maxH1 = findpeaks(H1HipMean-5.72958);
% minH1 = -findpeaks(-(H1HipMean-5.72958));
% 
% maxslf = (maxNo + maxH0 + maxH1)/3
% minslf = (minNo + minH0 + minH1)/3
% maxslf - minslf
% 
% maxLocked = findpeaks(rad2deg(mrlocked(3,:,1)));
% minLocked = -findpeaks(-(rad2deg(mrlocked(3,:,1))));
% maxH2 = findpeaks(H2HipMean-5.72958);
% minH2 = -findpeaks(-(H2HipMean-5.72958));


%      set(gcf,'PaperOrientation','landscape');
%      print(gcf,'IMULockedNoExo','-dpdf','-bestfit','-painters')
 
%% KNEE
% figure('DefaultAxesFontSize',18);
% noexo = plotGaitMeanStd(NoExoKneeMean, NoExoKneeStd, 'r',0.4);
% hold on
% h0 = plotGaitMeanStd(H0KneeMean, H0KneeStd, 'b',0.4);
% hold on
% h1 = plotGaitMeanStd(H1KneeMean, H1KneeStd, 'g',0.4);
% hold on
% h2 = plotGaitMeanStd(H2KneeMean, H2KneeStd, 'k',0.4);
% legend([noexo h0 h1 h2],{'NoExo','Passive Mode','Compensated Mode','Virtual Constraint Mode'},'Location','northwest');
%  ylabel('Knee Flextion-Extension Angle [Deg]')  
%  xlabel('Gait Cycle %')
%   legend('boxoff')
% 
%      set(gcf,'PaperOrientation','landscape');
%      print(gcf,'KNEE','-dpdf','-bestfit','-painters')
%  
%  maxpeaksNoExo = max(findpeaks(NoExoKneeMean-5.72958));
%  minpeaksNoExo = min(-findpeaks(-(NoExoKneeMean-5.72958)));
%  
%  maxpeaksH0 = max(findpeaks(H0KneeMean-5.72958));
%  minpeaksH0 = min(-findpeaks(-(H0KneeMean-5.72958)));

%PeaktoPeakKnee = sqrt(mean((((maxpeaksH0-minpeaksH0)-(maxpeaksNoExo-minpeaksNoExo))/(maxpeaksH0-minpeaksH0)).^2))*100;
% RMSPEKNEE= sqrt(mean((((H0KneeMean-5.72958)-(NoExoKneeMean-5.72958)))/(H0KneeMean-5.72958)).^2)*100;
%% ANKLE 
% figure('DefaultAxesFontSize',18);
% noexo = plotGaitMeanStd(NoExoAnkleMean + 20, NoExoAnkleStd, 'r',0.4);
% hold on
% h0 = plotGaitMeanStd(H0AnkleMean + 20, H0AnkleStd, 'b',0.4);
% hold on
% h1 = plotGaitMeanStd(H1AnkleMean + 20, H1AnkleStd, 'g',0.4);
% hold on
% h2 = plotGaitMeanStd(H2AnkleMean + 20, H1AnkleStd, 'k',0.4);
% legend([noexo h0 h1 h2],{'NoExo','Passive Mode','Compensated Mode','Virtual Constraint Mode'},'Location','southwest');
%  ylabel('Ankle Plantarflexion-Dorsiflexion Angle [Deg]')  
%  xlabel('Gait Cycle %')
%   legend('boxoff')
% %  
%      set(gcf,'PaperOrientation','landscape');
%      print(gcf,'ANKLE','-dpdf','-bestfit','-painters')

%Max Min
% MaxKontAnkle = findpeaks(NoExoAnkleMean + 20);
% MaxKontAnkle = MaxKontAnkle(3);
% MinKontAnkle = findpeaks(-(NoExoAnkleMean + 20));
% MinKontAnkle = min(-MinKontAnkle);
% 
% MaxH0Ankle = findpeaks(H0AnkleMean + 20);
% MaxH0Ankle = MaxH0Ankle(1);
% MinH0Ankle = findpeaks(-(H0AnkleMean + 20));
% MinH0Ankle = min(-MinH0Ankle);
% 
% MaxH1Ankle = findpeaks(H1AnkleMean + 20);
% MaxH1Ankle = max(MaxH1Ankle);
% MinH1Ankle = findpeaks(-(H1AnkleMean + 20));
% MinH1Ankle = min(-MinH1Ankle);
% 
% MaxH2Ankle = findpeaks(H2AnkleMean + 20);
% MaxH2Ankle = max(MaxH2Ankle);
% MinH2Ankle = findpeaks(-(H2AnkleMean + 20));
% MinH2Ankle = min(-MinH2Ankle);
% 
% RMSPEAnkleH2= sqrt(mean((((MaxH2Ankle-MinH2Ankle)-(MaxKontAnkle-MinKontAnkle))/(MaxH2Ankle-MinH2Ankle)).^2))*100;
% 
% RMSPEAnkleH1= sqrt(mean((((MaxH1Ankle-MinH1Ankle)-(MaxKontAnkle-MinKontAnkle))/(MaxH1Ankle-MinH1Ankle)).^2))*100;
% 
% RMSPEAnkleH0 = sqrt(mean(((MaxH0Ankle-MinH0Ankle)-(MaxKontAnkle-MinKontAnkle))/(MaxH0Ankle-MinH0Ankle)).^2)*100; 
% 
% MintominH2 = sqrt(mean(((MinH2Ankle)-(MinKontAnkle))/(MinH2Ankle)).^2)*100;
%  %% HIP ABDUCTION 
%  
% figure('DefaultAxesFontSize',18);
% noexo = plotGaitMeanStd(NoExoHipAbdMean-5.72958, NoExoHipAbdStd, 'r');
% hold on
% h0 = plotGaitMeanStd(H0HipAbdMean-5.72958, H0HipAbdStd, 'b');
% hold on
% h1 = plotGaitMeanStd(H1HipAbdMean-5.72958, H1HipAbdStd, 'g');
% hold on
% h2 = plotGaitMeanStd(H2HipAbdMean-5.72958, H2HipAbdStd, 'k');
% legend([noexo h0 h1 h2],{'NoExo','H0','H1','H2'},'Location','northwest');
%  ylabel('Hip Abd [Deg]')  
%  xlabel('Gait Cycle %')
% 
%% IMU vs Adopted

% figure;
% noexo1 = plotGaitMeanStd(NoExoHipMean-5.72958, NoExoHipStd, 'r');
% hold on
% h01 = plotGaitMeanStd(m1(3,:), s1(3,:), 'b');
% hold on;
% h11 = plotGaitMeanStd(m2(3,:), s2(3,:), 'g');
% hold on;
% h21 = plotGaitMeanStd(m3(3,:), s3(3,:), 'k');
% 
% [mrlocked(:,:,1), sllocked(:,:,1)] = meanstd(separateGaits_interpolation(gait(:,:,1), (mot(:,:,1))));
% hold on
% hLocked = plotGaitMeanStd(mrlocked(3,:,1), sllocked(3,:,1), 'c');
% 
% legend([noexo1 h01 h11 h21 hLocked],{'NoExo','H0','H1','H2','Locked'},'Location','southeast');  
%  xlabel('Gait Cycle %')
%  ylabel('Hip Angle [Deg]') 

% load H0HipMeanStd.mat 
% load H1HipMeanStd.mat 
% load H2HipMeanStd.mat 
% 
% H0HipMean = mean(H0HipMean);
% H0HipStd = mean(H0HipStd);
% H1HipMean = mean(H1HipMean);
% H1HipStd = mean(H1HipStd);
% H2HipMean = mean(H2HipMean);
% H2HipStd = mean(H2HipStd);
% 
% figure
% noexo = plotGaitMeanStd(NoExoHipMean-5.72958, NoExoHipStd, 'r');
% hold on
% h0 = plotGaitMeanStd(H0HipMean, H0HipStd, 'b');
% hold on
% h1 = plotGaitMeanStd(H1HipMean, H1HipStd, 'g');
% hold on
% h2 = plotGaitMeanStd(H2HipMean, H2HipStd, 'k'); 
% hold on
% [mrlocked(:,:,1), sllocked(:,:,1)] = meanstd(separateGaits_interpolation(gait(:,:,1), (mot(:,:,1))));
% hold on
% hLocked = plotGaitMeanStd(rad2deg(mrlocked(3,:,1)), rad2deg(sllocked(3,:,1)), 'c');
% 
% legend([noexo h0 h1 h2 hLocked],{'NoExo','H0','H1','H2','Locked'},'Location','southeast');



% 
% % PEAK TO PEAK HİP
% 
% MaxNoExo = findpeaks(NoExoHipMean-5.72958);
% MinNoExo = -findpeaks(-NoExoHipMean-5.72958);
% 
% MaxH0 = findpeaks(H0HipMean);
% MinH0 = -findpeaks(-H0HipMean);
% 
% MaxH1 = findpeaks(H1HipMean);
% MinH1 = -findpeaks(-H1HipMean);
% 
% MaxH2 = findpeaks(H2HipMean);
% MinH2 = -findpeaks(-H2HipMean);
% 
% MaxLocked = findpeaks(mrlocked(3,:,1));
% MinLocked = -findpeaks(-mrlocked(3,:,1));
% 
% 
% RMSH0 = sqrt(mean((((MaxH0-MinH0)-(MaxNoExo-MinNoExo))/(MaxH0-MinH0)).^2))*100;
% 
% RMSH1 = sqrt(mean((((MaxH1-MinH1)-(MaxNoExo-MinNoExo))/(MaxH1-MinH1)).^2))*100;
% 
% RMSH2 = sqrt(mean((((MaxH2-MinH2)-(MaxNoExo-MinNoExo))/(MaxH2-MinH2)).^2))*100;
% 
% RMSLocked = sqrt(mean((((MaxLocked-MinLocked)-(MaxNoExo-MinNoExo))/(MaxLocked-MinLocked)).^2))*100;



 
% %  print('IMUvsAdopted Hip Angle wth std','-dpdf')
% 
% %RMSPE Values for IMUvsAdopted
% RMSPESH0 = sqrt(mean(((m1(3,:)-(NoExoHipMean-5.72958)))/m1(3,:)).^2)*100;
% 
% RMSPESH1 = sqrt(mean(((m2(3,:)-(NoExoHipMean-5.72958)))/m2(3,:)).^2)*100;
% 
% RMSPESH2 = sqrt(mean(((m3(3,:)-(NoExoHipMean-5.72958)))/m3(3,:)).^2)*100;
% 
% 
% %RMSPE Values for IMUvsIMU
% RMSPESH0I = sqrt(mean((((H0HipMean-5.72958)-(NoExoHipMean-5.72958)))/(H0HipMean-5.72958)).^2)*100;
% 
% RMSPESH1I = sqrt(mean((((H1HipMean-5.72958)-(NoExoHipMean-5.72958)))/(H1HipMean-5.72958)).^2)*100;
% 
% RMSPESH2I = sqrt(mean((((H2HipMean-5.72958)-(NoExoHipMean-5.72958)))/(H2HipMean-5.72958)).^2)*100;

%% OTHER SEC

% plotIMUvsIMU(C1Data(2,:), C2Data(2,:), C1Condition, C2Condition)
% plotAdaptedvsIMUAveraged(gait,mot,C1,ExoCondition1,C1Condition)
% plotAdaptedvsAdapted(gait,mot,gait2,mot2,ExoCondition1,ExoCondition2)

%plotAdaptationOrdered(gait, mot, ["Rx", "Ry"],[1,2])

% formatpdf = "%s vs %s.pdf";
% % formatSpec = "%s vs %s";
% print(sprintf(formatpdf,C1Condition,C5Condition),'-dpdf')
% movefile(sprintf(formatpdf,C1Condition,C5Condition),"F:\AssistOn-GAit\Experimental Data\Figures");
% % 
%     C1AllData_rad = deg2rad(C1AllData);
%     C1AllData_rad_edited = C1AllData_rad - 0.1;
%     samples = 1:1:length(C1AllData_rad);
%     up_sample = linspace(1,length(samples),length(mot));
%     g(:,1) = interp1(samples,C1AllData_rad,up_sample);

    
    
% [m0, s0] = meanstd(separateGaits_interpolation(gait(:,:,1), mot(:,:,1)));
% [gm1, gs1] = meanstd(separateGaits_interpolation(gait(:,:,1), g));
% [m2, s2] = meanstd(separateGaits_interpolation(gait3(:,:,1), mot3(:,:,1)));
%[m(:,:,2), s(:,:,2)] = meanstd(separateGaits(gait(:,:,1), data(:,:,1)));
%[m(:,:,3), s(:,:,3)] = meanstd(separateGaits(gait(:,:,1), data(:,:,1)));

% figure
% formatSpec = "%s vs %s";
% sgtitle(sprintf(formatSpec,condition,condition_2))
% plotGaitNoExo(ExternalGaitAveraged_1, 'r')
% hold on;
% plotGaitNoExo(ExternalGaitAveraged_2, 'b')

% C1_Edited = C1 - 0.1;
% % C2_Edited = C2 - 0.1;
% % C3_Edited = C3 - 0.1;
% % C4_Edited = C4 - 0.1;
% 
% figure      
%         sgtitle('NoExoEdited vs Exo')
%         a = plotGaitNoExo(C1_Edited, 'k');
%         hold on;
%         p = plotGaitMeanStd(m0(3,:), s0(3,:), 'b');
%         hold on;
%         k = plotGaitMeanStd(gm1, gs1, 'r');
%         hold on;
%         t = plotGaitMeanStd(m2(3,:), s2(3,:), 'g');
%         grid off; hold off; box off;
%         legend([a p k t],{C1Condition,ExoCondition1,ExoCondition2,ExoCondition3});
%         ylabel('Hip Angle [Rad]')  
%         xlabel('Gait Cycle %')
%         ylim([-0.3,0.6]); 
% 
%         print('NoExo_Edited vs Exo','-dpdf')
% 

% b = separateGaits_interpolation(gait2(:,:,1), mot2(:,:,1));
% c = separateGaits_interpolation(gait3(:,:,1), mot3(:,:,1));
% 
% figure
% 
% for i = 80:1:90
%     
% plot(a(1,:),a(2,:),'g')
% hold on
% ylabel('Y Axis [mm]')  
% xlabel('X Axis [mm]')
% 
% end
% 
% figure
% for i = 60:1:70
%     
% plot(b(1,:),b(2,:),'r')
% hold on
% ylabel('Y Axis [mm]')  
% xlabel('X Axis [mm]')
% 
% end



% figure;
% for i = 30:1:40
%     plot(a(1,:,i),a(2,:,i),'g','LineWidth', 1);
%     hold on
% end


% 
% [mrH1(:,:,index), sl(:,:,index)] = meanstd(separateGaits_interpolation(gait(:,:,1), mot(:,:,1)));
% 
% MRH2 = separateGaits_interpolation(gait(:,:,1), mot(:,:,1));
% 
% [mlH1(:,:,index), sl(:,:,index)] = meanstd(separateGaits_interpolation(gait(:,:,2), mot(:,:,2)));


% load RightMot.mat
% load LeftMot.mat
% load RightMot_H1.mat
% load LeftMot_H1.mat
% load RightMot_H2.mat
% load LeftMot_H2.mat

% mr = mean(mr,3);
% ml(:,:,2) = [];
% ml = mean(ml,3);
% 
% mrH1 = mean(mrH1,3);
% mlH1(:,:,2) = [];
% mlH1 = mean(mlH1,3);
% 
% mrH2 = mean(mrH2,3);
% mlH2(:,:,2) = [];
% mlH2 = mean(mlH2,3);

%% RENDERING DATA

%plot(mot(2,:,1),'color','r','LineWidth',1)


%% XY Circle Data

% t = 0:0.001:5.826;
% 
% x = 20*sin(1.5*t+pi/2);
% y = 20*sin(1.5*t);
% 
% circle1 = [x;y];
% circleactual = [mot(1,end-6250:end,1);mot(2,end-6250:end,1)];
% circleref = [pos(1,end-6250:end,1);pos(2,end-6250:end,1)];
% 
% figure('DefaultAxesFontSize',18);   
%     a1 = plot(mot(1,end-9109:end,1),mot(2,end-9109:end,1),'b','LineWidth',1);
%     hold on
%     a2 = plot(pos(1,end-9109:end,1),pos(2,end-9109:end,1),'color','r','LineWidth',1);
%     xlim([-25,25]);
%     ylim([-25,25]);
%     xlabel('X Axis [mm]');
%     ylabel('Y Axis [mm]');
%     box off
%     legend([a1,a2],{'Measured','Referance'});
%     legend('boxoff')
% 
%     set(gcf,'PaperOrientation','landscape');
%      print(gcf,'Circular','-dpdf','-bestfit','-painters')
% %     
%  RMSPES = sqrt(mean((circleactual-circleref)/circleactual).^2)*100;
% % % 
% % RMSPEXc =  sqrt(mean((mot(1,60000:65826,1)-x)/mot(1,60000:65826,1)).^2)*100;
% 
% %% X and Y Trajectory 
% 
%  XActual = [mot(1,135000-6200:135000,2)];
%  XDesired = [pos(1,135000-6200:135000,2)];
% % 
% figure('DefaultAxesFontSize',18);   
%     a1 = plot(mot(1,135000-6200:135000,1),'b','LineWidth',1);
%     hold on
%     a2 = plot(pos(1,135000-6200:135000,1),'--','color','r','LineWidth',1);
%      xlim([0,6200]);
%      ylim([-25,25]);
%     xlabel('Time Step');
%     ylabel('X Axis [mm]');
%     box off
%     legend([a1,a2],{'Measured','Referance'},'Location','southeast'); 
%     legend('boxoff')
    

% 
%      set(gcf,'PaperOrientation','landscape');
%      print(gcf,'CircularSin','-dpdf','-bestfit','-painters')
%     
%       RMSPEXsinX = sqrt(mean((XActual-XDesired)/XActual).^2)*100;
%     
%     YActual = [mot(2,136136-6300:136136,2)];
%     YDesired = [pos(2,136136-6300:136136,2)];
% 
% figure('DefaultAxesFontSize',18);   
%     
%     a1 = plot(mot(2,136136-6300:136136,1),'b','LineWidth',1);
%     hold on
%     a2 = plot(pos(2,136136-6300:136136,1),'--','color','r','LineWidth',1);
%      xlim([0,6300]);
%      ylim([-25,25]);
%     xlabel('Time Step');
%     ylabel('Y Axis [mm]');
%     box off
%     legend([a1,a2],{'Measured','Referance'},'Location','southeast');
%     legend('boxoff')
%     
% %     set(gcf,'PaperOrientation','landscape');
% %         print(gcf,'YSin_Edit_Ed','-dpdf','-bestfit','-painters')
%     
% figure('DefaultAxesFontSize',18);
%     plot(pos(1,end-9108:end,1),pos(2,end-9108:end,1),'--','color','r','LineWidth',1);
%     hold on
%     plot(mot(1,end-9108:end,1),mot(2,end-9108:end,1),'b','LineWidth',1);
%     xlim([-25,25]);
%     ylim([-25,25]);
    

% 
%        set(gcf,'PaperOrientation','landscape');
%        print(gcf,'YSin_Edit_Ed','-dpdf','-bestfit','-painters')
    
%     RMSPEXsinY = sqrt(mean((YActual-YDesired)/YActual).^2)*100;


%% BACKDRIVABILITY FORCES

% figure
% 
% x1 = plot(ft(1,:,1));
% figure
% 
% y1 = plot(ft(2,:,1));
% 
% figure
% 
% teta1 = plot(ft(6,:,1));

%% IMPEDANCE RENDERING

% figure
% x1 = plot(mot(2,:,1));
% 
% AppliedLoad = [4.8,15.715,24.525,34.335,49.05]; %y
% Displacement = [4,14.2,24.14,31.25,52.93]; %x
% 
% Normalx = [1,10,20,30,40,50];
% Normaly = [1,10,20,30,40,50];
% 
% figure('DefaultAxesFontSize',18)
% p = polyfit(Displacement,AppliedLoad,1);
% f = polyval(p,Displacement); 
% anan = plot(Displacement,AppliedLoad,'d',...
%     'MarkerSize',10,...
%     'MarkerEdgeColor','r',...
%     'MarkerFaceColor',[0.5,0.5,0.5]);
% hold on
% plotted = plot(Displacement,f,'-');
% xlabel('Deflection along the vertical axis [mm]');
% ylabel('Applied Load [N]');
% legend([anan,plotted],{'Measured','Line Fit'},'Location','southeast');
% box off
% legend boxoff  
% 
% xlim([0,60]);
% ylim([0,60]);
% 
% set(gcf,'PaperOrientation','landscape');
% print(gcf,'render','-dpdf','-bestfit','-painters')
% 
% ErrorFit = sqrt(mean((0.9106-1)/0.9106).^2)*100;


% y1 = plot(mot(2,:,1));
% 
% figure
% 
% teta1 = plot(ft(6,:,1));

% figure;
% plot(0,0,'+','MarkerSize',10);
% ylabel('Y Axis [mm]');
% xlabel('X Axis [mm]');
% title('RightLeg XY Movements EverySubject');
% hold on;
% pkym = [];
% pkxm = [];
% pkyn1 = [];
% pkxn1 = [];

% figure;
% for i = 30:1:40
%     plot(a(1,:,i),a(2,:,i),'g','LineWidth', 1);
%     hold on
    
%     [pky,lc1] = findpeaks(a(2,:,i));
%     [pkx,lc2] = findpeaks(a(1,:,i));
%   %   i
%     [pkyn,lcn1] = findpeaks(-a(2,:,i));
%     [pkxn,lcn2] = findpeaks(-a(1,:,i));
%     if i == 136 
%         pkx = 0;
%         pky = 0;
%         pkyn = 0; 
%         pkxn = 0;
%     end
%     plot(0,mean(pky),'o','LineWidth', 2)
%     plot(mean(pkx),0,'x','LineWidth', 2)
%        
%         pkym(i-49,:) = max(pky);
%         pkxm(i-49,:) = max(pkx);
% 
%         pkyn1(i-49,:) = min(-pkyn);
%         pkxn1(i-49,:) = mean(-pkxn);
  
% end

% a = separateGaits_interpolation(gait(:,:,1), mot(:,:,1));
% b = separateGaits_interpolation(gait2(:,:,1), mot2(:,:,1));
% % 
% figure;
% for i = 240:1:250
%     hold on
%     plot(a(1,:,i),a(2,:,i))
%    
%    
% end
%     
% 
% 
% figure('DefaultAxesFontSize',18);
% % subplot(1,2,1);
% for i = 240:1:250
%     
%     z = zeros(size(a(1,:,i)));
%     col = a(1,:,i);  % This is the color, vary with x in this case.
%     h = surface([a(1,:,i);a(1,:,i)],[a(2,:,i);a(2,:,i)],[z;z],[col;col],'EdgeColor','flat', 'FaceColor','none',...
%         'linew',2);
%     colormap( jet(numel(a(1,:,i))) )
%     colorbar
% %     plot(a(1,:,i),a(2,:,i),'g','LineWidth', 1);
% %     hold on
%      xlim([-70,70])
%      title('Trunk with restraint')
%      ylabel('Y Axis [mm]');
%      xlabel('X Axis [mm]');
%      
% end
% 
% %      set(gcf,'PaperOrientation','landscape');
% %      print(gcf,'RestrictedHip','-dpdf','-bestfit','-painters')
% 
% % subplot(1,2,2);
% figure('DefaultAxesFontSize',18);
% for i = 80:1:90
%     
%     z = zeros(size(b(1,:,i)));
%     col = b(1,:,i);  % This is the color, vary with x in this case.
%     h = surface([b(1,:,i);b(1,:,i)],[b(2,:,i);b(2,:,i)],[z;z],[col;col],'EdgeColor','flat', 'FaceColor','none',...
%         'linew',2);
%     colormap( jet(numel(b(1,:,i))) )
%     colorbar
% %     plot(a(1,:,i),a(2,:,i),'g','LineWidth', 1);
% %     hold on
%      xlim([-70,70])
%      title('Trunk without restraint')
%      ylabel('Y Axis [mm]');
%      xlabel('X Axis [mm]');
%      
% end

%      set(gcf,'PaperOrientation','landscape');
%      print(gcf,'H0HipOrientation_1','-dpdf','-bestfit','-painters')

%print('Colored-Step-Plot','-dpdf')


% z = zeros(len(x));
% col = x;  % This is the color, vary with x in this case.
% surface([x;x],[y;y],[z;z],[col;col],...
%         'facecol','no',...
%         'edgecol','interp',...
%         'linew',2);


% ymax = mean(pkym);
% yminstd = std(pkym);
% ymin = mean(pkyn1);
% ymaxstd = std(pkyn1);
% 
% % if j == 5
% % pkxn1(71,1) = 0;
% % end
% % if j == 7
% % pkxn1(89,1) = 0;
% % end
% 
% xmax = mean(pkxm);
% xmaxstd = std(pkxm);
% xmin = mean(pkxn1);
% xminstd = std(pkxn1);

%params(11,:) = [xmax,xmaxstd,ymax,ymaxstd,xmin,xminstd,ymin,yminstd];

% figure
% circle((xmax+xmin)/2,ymax,yminstd);

%ORIGIN IS 50 200
%figure
% for i = 50:1:60
%     hold on
%     %plot(a(1,:,i),a(2,:,i),'g','LineWidth', 1);
%     
% %     ymx = plot((xmax+xmin)/2,ymax,'+','LineWidth',2,'MarkerSize', 10,'MarkerEdgeColor','k'); 
% %     hold on
% %     %circle((xmax+xmin)/2,ymax,yminstd);
% %     xmx = plot(xmax,(ymax+ymin)/2,'+','LineWidth',2,'MarkerSize', 10,'MarkerEdgeColor','k');
% % 	ymn = plot((xmax+xmin)/2,ymin,'+','LineWidth',2,'MarkerSize', 10,'MarkerEdgeColor','k');
% %     xmn = plot(xmin,(ymax+ymin)/2,'+','LineWidth',2,'MarkerSize', 10,'MarkerEdgeColor','k');
% %     xymax = plot(xmax,ymax,'+','LineWidth',2,'MarkerSize',10,'MarkerEdgeColor','k');
% %     xymin = plot(xmin,ymin,'+','LineWidth',2,'MarkerSize',10,'MarkerEdgeColor','k');
% %     ylabel('Y Axis [mm]');
% %     xlabel('X Axis [mm]');
% %     xlim([-30,90])
% %     ylim([-30,25])
%     %legend([ymx xmx  xymax xymin],{'Ymax','Xmax','XYmax','XYmin'});
% end
%%

% load RightMot.mat
% load RightMot_H1.mat
% load RightMot_H2.mat
% 
% mr = meanstd(mr);
% 
% % plot(mr(1,:),mr(2,:))


%%
% load ParamsFull.mat
% 
% 
% xmax = mean(params(:,1));
% xmaxstd = mean(params(:,2));
% ymax = mean(params(:,3));
% ymaxstd = mean(params(:,4));
% xmin = mean(params(:,5));
% xminstd = mean(params(:,6));
% ymin = mean(params(:,7));
% yminstd = mean(params(:,8));
% 
% 
%      figure
% %     hold on
% %     %circle((xmax+xmin)/2,ymax,ymaxstd);
% %     ymx = plot((xmax+xmin)/2,ymax,'+','LineWidth',2,'MarkerSize', 10,'MarkerEdgeColor','k'); 
% %     hold on
% %      circle((xmax+xmin)/2,ymax,yminstd);
% %     xmx = plot(xmax,(ymax+ymin)/2,'+','LineWidth',2,'MarkerSize', 10,'MarkerEdgeColor','k');
% %     %circle(xmax,(ymax+ymin)/2,xmaxstd);
% % 	 %circle((xmax+xmin)/2,ymin,yminstd);
% %     ymn = plot((xmax+xmin)/2,ymin,'+','LineWidth',2,'MarkerSize', 10,'MarkerEdgeColor','k');
% %     xmn = plot(xmin,(ymax+ymin)/2,'+','LineWidth',2,'MarkerSize', 10,'MarkerEdgeColor','k');
% %      circle(xmin,(ymax+ymin)/2,xminstd);
% %     
%     circle(xmax,ymax,ymaxstd);
% %     xymax = plot(xmax,ymax,'+','LineWidth',2,'MarkerSize',10,'MarkerEdgeColor','k');
%      circle(xmin,ymin,yminstd);
%     xymin = plot(xmin,ymin,'+','LineWidth',2,'MarkerSize',10,'MarkerEdgeColor','k');
%     
%     hold on
%     plot(21.96,-2.731,'*','LineWidth',2,'MarkerSize', 20,'MarkerEdgeColor','k');
% 
%     xlim([-30,90])
%     ylim([-30,25])
    

 
 %Should draw another perfect elipse to represent pelvic movements.
% xCenter = 21.96;
% yCenter = -2.831;
% 
% t = 0:0.01:2*pi;
% TiltAngle = sin(t)*6;
% Y = 185*sin(deg2rad(TiltAngle))+30*sin(t);
% RotAngle = cos(t)*10;
% X = 185*sin(deg2rad(RotAngle))+100*sin(t);
% x = X + xCenter ;
% y = Y + yCenter ;
% 
% plot(x, y, 'LineWidth', 3);
% hold on;
% %plot(21.96,14,'*','LineWidth',2,'MarkerSize', 20,'MarkerEdgeColor','k');
% axis square;
% % xlim([0 20]);
% % ylim([0 20]);
% grid on;

%CREATING WITH ARCS
%Drawing a path

% theta1 = [163.8450;126.1150];
% theta2 = [268.371;163.854];
% theta3 = [306.101,268.371];
% theta4 = [343.846,306.101];
% theta5 = [360,343.843];
% theta6 = [88.364,0];
% theta7 = [126.1150,88.364];
% 
% alpha1 = [153.192,126.115];
% alpha2 = [279.029,153.192];
% alpha3 = [306.101,279.029];
% alpha4 = [332.601,306.101];
% alpha5 = [360,332.601];
% alpha6 = [99.603,0];
% alpha7 = [126.115,99.603];
% 
% gamma1 = [171.382,125.588];
% gamma2 = [260.841,171.382];
% gamma3 = [306.095,260.841];
% gamma4 = [352.093,306.101];
% gamma5 = [360,352.093];
% gamma6 = [80.117,0];
% gamma7 = [126.115,80.117];
% 
% middlearc1 = Arc(36.809,-23.083,36.859,theta1);
% middlearc2 = Arc(6.206,-14.223,5,theta2);
% middlearc3 = Arc(7.112,17.629,36.865,theta3);
% middlearc4 = Arc(7.112,17.629,36.868,theta4);
% middlearc5 = Arc(37.72,8.764,5,theta5);
% middlearc6 = Arc(37.72,8.764,5,theta6);
% middlearc7 = Arc(36.811,-23.085,36.862,theta7);
% 
% innerarc1 = Arc(41.165,-29.049,41.592,alpha1);
% innerarc2 = Arc(8.505,-12.546,5,alpha2);
% innerarc3 = Arc(2.762,23.595,41.594,alpha3);
% innerarc4 = Arc(1.816,24.892,43.2,alpha4);
% innerarc5 = Arc(35.731,7.313,5,alpha5);
% innerarc6 = Arc(35.731,7.313,5,alpha6);
% innerarc7 = Arc(42.1,-30.332,43.179,alpha7);
% 
% outherarc1 = Arc(35.012,-20.614,36.459,gamma1);
% outherarc2 = Arc(3.908,-15.9,5,gamma2);
% outherarc3 = Arc(8.916,15.162,36.463,gamma3);
% outherarc4 = Arc(9.46,14.416,35.54,gamma4);
% outherarc5 = Arc(39.709,10.214,5,gamma5);
% outherarc6 = Arc(39.709,10.214,5,gamma6);
% outherarc7 = Arc(34.468,-19.869,35.537,gamma7);
% 
% middlearc = [middlearc1,middlearc2,middlearc3,middlearc4,middlearc5,middlearc6,middlearc7];
% 
% innerarc = [innerarc1,innerarc2,innerarc3,innerarc4,innerarc5,innerarc6,innerarc7];
% 
% outherarc = [outherarc1,outherarc2,outherarc3,outherarc4,outherarc5,outherarc6,outherarc7];
% 
% figure;
% plot(middlearc(1,:),middlearc(2,:))
% hold on
% plot(outherarc(1,:),outherarc(2,:))
% hold on
% plot(innerarc(1,:),innerarc(2,:))


% print(sprintf(folders,indexs),'-dpdf')


% figure;
% 
% for i = 1:1:100
%     [pky,lc1] = findpeaks(a(2,:,i));
%     [pkx,lc2] = findpeaks(a(1,:,i));
%     [pkyn,lcn1] = findpeaks(-a(2,:,i));
%     [pkxn,lcn2] = findpeaks(-a(1,:,i));
%     
%     
%     %plot(0,mean(pky),'x','LineWidth', 2)
%     hold on;
%     plot(0,mean(pkyn),'o','LineWidth', 2)
%     
% end

% mrH2 = mean(mrH2,3);
% mlH2(:,:,2) = [];
% mlH2 = mean(mlH2,3);
% 
% a= plot(mrH2(2,:),'b','LineWidth', 2);
% hold on;
% p = plot(mlH2(2,:),'r','LineWidth', 2);
%legend
%legend([a p],{'Right','Left'})


%print('RightLeg XY Movements_EverySubject','-dpdf')

% figure;
% plot(mr(1,:),mr(2,:),'b','LineWidth', 2);
% hold on;
% plot(mrH1(1,:),mrH1(2,:),'r','LineWidth', 2);
% hold on;
% ylim([-20,10]);
% plot(mrH2(1,:),mrH2(2,:),'g','LineWidth', 2);
% hold on
% plot(0,0,'+','MarkerSize',10);
% ylim([-20,15]);
% xlim([-20,35]);
% legend('H0','H1','H2');
% ylabel('Y Axis [mm]');
% xlabel('X Axis [mm]');
% title('Right Leg');
% 
% figure;
% plot(mot(2,:,1));
% hold on;
% plot(mot(2,:,2));

% RightMove = mot(2,100000:120000,1);
% LeftMove = mot(2,100000:120000,2);
% 
% RightPeaks = findpeaks(RightMove);
% LeftPeaks = findpeaks(LeftMove);
%     
%     samples = 1:1:length(RightMove(1,:));
%     up_sample = linspace(1,length(samples),1500);
%     RightSamp = interp1(samples,RightMove(1,:),up_sample);   
% 
%     samplesL = 1:1:length(LeftMove(1,:));
%     up_sampleL = linspace(1,length(samplesL),1500);
%     LeftSamp = interp1(samplesL,LeftMove(1,:),up_sampleL);

%     figure;
% a = plot(RightMove);
% [pk,lc] = findpeaks(RightMove,'MinPeakDistance',800);
% hold on
% plot(lc,pk,'x')
% hold on
% p = plot(LeftMove);
% [pik,lac] = findpeaks(LeftMove,'MinPeakDistance',800);
% hold on
% plot(lac,pik,'o')    
%     
       
% figure
% a = plot(RightSamp,'LineWidth', 1);
% [pk,lc] = findpeaks(RightSamp,'MinPeakDistance',40);
% hold on
% plot(lc,pk,'x','LineWidth', 1)
% hold on
% p = plot(LeftSamp,'LineWidth', 1);
% [pik,lac] = findpeaks(LeftSamp,'MinPeakDistance',45);
% hold on
% plot(lac,pik,'o','LineWidth', 1)
% legend([a p],{'Right','Left'});
% ylabel('Y Movement [mm]')  
% xlabel('Sample Time')
% title('Right Leg vs Left Leg Hip Center Y Movement')
% 
% RMSE = sqrt(mean((Array2-Array1).^2));
% 
% print('Right Leg vs Left Leg Hip Center Y Movement','-dpdf')

% findpeaks(RightSamp);

% plotAdaptationOrdered(gait, ft, ["Fx", "Fy", "Tz"],[1,2,6])

%% RIGHT FORCES
 [ftrH0_Kont, sftrH0_Kont] = meanstd(separateGaits_interpolation(gait(:,:,1), ft(:,:,1)));
% [ftrH0, sftrH0] = meanstd(separateGaits_interpolation(gait2(:,:,1), ft2(:,:,1)));
% [ftrH1, sftrH1] = meanstd(separateGaits_interpolation(gait3(:,:,1), ft3(:,:,1)));
% [ftrH2, sftrH2] = meanstd(separateGaits_interpolation(gait4(:,:,1), ft4(:,:,1)));
% %plotAdaptationOrdered(gait, ft, ["Fx", "Fy", "Tz"],[1,2,6]);
% 
% load RightMeanH0.mat
% load RightStdH0.mat
% load RightMeanH1.mat
% load RightStdH1.mat
% load RightMeanH2.mat
% load RightStdH2.mat
% 
% H0_max_Fx = [];
% H1_max_Fx = [];
% H2_max_Fx = [];
% 
% H0_min_Fx = [];
% H1_min_Fx = [];
% H2_min_Fx = [];
% 
% H0_max_Fy = [];
% H1_max_Fy = [];
% H2_max_Fy = [];
% 
% H0_min_Fy = [];
% H1_min_Fy = [];
% H2_min_Fy = [];
% 
% for i = 1:1:12
% 
% H0_max_Fx = cat(1,H0_max_Fx,max(ftrH0(1,:,i)));
% H1_max_Fx = cat(1,H1_max_Fx,max(ftrH1(1,:,i)));
% H2_max_Fx = cat(1,H2_max_Fx,max(ftrH2(1,:,i)));
% 
% H0_min_Fx = cat(1,H0_min_Fx,min(ftrH0(1,:,i)));
% H1_min_Fx = cat(1,H1_min_Fx,min(ftrH1(1,:,i)));
% H2_min_Fx = cat(1,H2_min_Fx,min(ftrH2(1,:,i)));
% 
% H0_max_Fy = cat(1,H0_max_Fy,max(ftrH0(2,:,i)));
% H1_max_Fy = cat(1,H1_max_Fy,max(ftrH1(2,:,i)));
% H2_max_Fy = cat(1,H2_max_Fy,max(ftrH2(2,:,i)));
% 
% H0_min_Fy = cat(1,H0_min_Fy,min(ftrH0(2,:,i)));
% H1_min_Fy = cat(1,H1_min_Fy,min(ftrH1(2,:,i)));
% H2_min_Fy = cat(1,H2_min_Fy,min(ftrH2(2,:,i)));
% 
% end


% 
% ftrH1(:,:,7) = [];
% sftrH1(:,:,7) = [];
% 
% ftrH2(:,:,11) = [];
% sftrH2(:,:,11) = [];
% % 
% ftrH0 = mean(ftrH0,3);
% sftrH0 = mean(sftrH0,3);
% ftrH1 = mean(ftrH1,3);
% sftrH1 = mean(sftrH1,3);
% ftrH2 = mean(ftrH2,3);
% sftrH2 = mean(sftrH2,3);
% % 
% % % Peak to Peak RMSE X
% MaxKontX = findpeaks(ftrH0_Kont(1,:));
% MaxKontX = MaxKontX(3);
% MinKontX = findpeaks(-ftrH0_Kont(1,:));
% MinKontX = min(-MinKontX);
% 
% MaxH0X = findpeaks(ftrH0(1,:));
% MaxH0X = MaxH0X(1);
% MinH0X = findpeaks(-ftrH0(1,:));
% MinH0X = min(-MinH0X);
% 
% MaxH1X = findpeaks(ftrH1(1,:));
% MaxH1X = max(MaxH1X);
% MinH1X = findpeaks(-ftrH1(1,:));
% MinH1X = min(-MinH1X);
% 
% MaxH2X = findpeaks(ftrH2(1,:));
% MaxH2X = max(MaxH2X);
% MinH2X = findpeaks(-ftrH2(1,:));
% MinH2X = min(-MinH2X);
% 
% RMSPEH1X = sqrt(mean((((MaxH1X-MinH1X)-(MaxKontX-MinKontX))/(MaxH1X-MinH1X)).^2))*100
% 
% RMSPEH0X = sqrt(mean(((MaxH0X-MinH0X)-(MaxKontX-MinKontX))/(MaxH0X-MinH0X)).^2)*100
% 
% RMSPEH2X = sqrt(mean(((MaxH2X-MinH2X)-(MaxKontX-MinKontX))/(MaxH2X-MinH2X)).^2)*100

%RMSPEX = sqrt(mean(((mean(ftrH1(1,:)))-(ftrH0_Kont(1,:)))/(ftrH1(1,:))).^2)*100
% 
% ftrH0_Kont = mean(ftrH0_Kont(1,:));
% stdH0_Kont = mean(NoExoKneeMax_Kont(1,:));

MeanH0 = mean(ftrH0(1,:))
MeanH1 = mean(ftrH1(1,:))
MeanH2= mean(ftrH2(1,:))

% Peak to Peak RMSE Y
MaxKontY = findpeaks(ftrH0_Kont(2,:));
MaxKontY = max(MaxKontY);
MinKontY = findpeaks(-ftrH0_Kont(2,:));
MinKontY = min(-MinKontY);

MaxH0Y = findpeaks(ftrH0(2,:));
MaxH0Y = MaxH0Y(2);
MinH0Y = findpeaks(-ftrH0(2,:));
MinH0Y = min(-MinH0Y);

MaxH1Y = findpeaks(ftrH1(2,:));
MaxH1Y = MaxH1Y(4);
MinH1Y = findpeaks(-ftrH1(2,:));
MinH1Y = min(-MinH1Y);

 MaxH2Y = findpeaks(ftrH2(2,:));
 MaxH2Y = max(MaxH2X);
 MinH2Y = findpeaks(-ftrH2(2,:));
 MinH2Y = min(-MinH2X);

RMSPEH1Y = sqrt(mean(((MaxH1Y-MinH1Y)-(MaxKontY-MinKontY))/(MaxH1Y-MinH1Y)).^2)*100

RMSPEH0Y = sqrt(mean(((MaxH0Y-MinH0Y)-(MaxKontY-MinKontY))/(MaxH0Y-MinH0Y)).^2)*100

RMSPEH2Y = sqrt(mean(((MaxH2Y-MinH2Y)-(MaxKontY-MinKontY))/(MaxH2Y-MinH2Y)).^2)*100

RMSPEY = sqrt(mean(((ftrH0(2,:))-(ftrH0_Kont(2,:)))/(ftrH0(2,:))).^2)*100
%
% 
% 
% %RMSE = sqrt(mean((V1-V2).^2));
% % mr = mean(mr,3);
% 
% % figure
% % plotGaitMeanStd(ftrH0(1,:,12), sftrH0(1,:,index), 'r');
% 
% 
% % 
figure;
p0 = plotGaitMeanStd(ftrH0_Kont(1,:), sftrH0_Kont(1,:), 'k',0.4);
hold on;
p1 = plotGaitMeanStd(ftrH0(1,:), sftrH0(1,:), 'r',0.4);
hold on;
p2 = plotGaitMeanStd(ftrH1(1,:), sftrH1(1,:), 'b',0.4);
hold on;
p3 = plotGaitMeanStd(ftrH2(1,:), sftrH2(1,:), 'g',0.4);
legend([p0 p1 p2 p3],{'Locked','H0','H1','H2'},'Location','Southwest')
ylim([-60,30]);
% xlim([-20,35]);
ylabel('Force [N]');
xlabel('Gait Cycle %');
% % dim = [0.4 0.005 0.1 0.2];
% % format = 'Peak to peak RMSE Value: %d';
% % str = sprintf(format,round(RMSPEX));
% % annotation('textbox',dim,'String',str,'FitBoxToText','on');
% title('Right Leg -- Fx Forces');
% % 
% %      set(gcf,'PaperOrientation','landscape');
% %      print(gcf,'ForcesFx','-dpdf','-bestfit','-painters') 
% 
% figure;
% p0 = plotGaitMeanStd(ftrH0_Kont(2,:), sftrH0_Kont(2,:), 'k');
% hold on;
% p1 = plotGaitMeanStd(ftrH0(2,:), sftrH0(2,:), 'r');
% hold on;
% p2 = plotGaitMeanStd(ftrH1(2,:), sftrH1(2,:), 'b');
% hold on;
% p3 = plotGaitMeanStd(ftrH2(2,:), sftrH2(2,:), 'g');
% legend([p0 p1 p2 p3],{'Locked','H0','H1','H2'})
% ylabel('Force [N]');
% xlabel('Gait Cycle %');
% title('Right Leg -- Fy Forces');

%      set(gcf,'PaperOrientation','landscape');
%      print(gcf,'ForcesFx','-dpdf','-bestfit','-painters') 


% 
% figure;
% p1 = plotGaitMeanStd(ftrH0(2,:), sftrH0(2,:), 'r');
% hold on;
% p2 = plotGaitMeanStd(ftrH1(2,:), sftrH1(2,:), 'b');
% hold on;
% p3 = plotGaitMeanStd(ftrH2(2,:), sftrH2(2,:), 'g');
% legend([p1 p2 p3],{'H0','H1','H2'})
% ylabel('Force [N]');
% xlabel('Gait Cycle %');
% title('Right Leg -- Fy Forces');
% 
% figure;
% p1 = plotGaitMeanStd(ftrH0(6,:), sftrH0(6,:), 'r');
% hold on;
% p2 = plotGaitMeanStd(ftrH1(6,:), sftrH1(6,:), 'b');
% hold on;
% p3 = plotGaitMeanStd(ftrH2(6,:), sftrH2(6,:), 'g');
% legend([p1 p2 p3],{'H0','H1','H2'})
% ylabel('Toeque [Nm]');
% xlabel('Gait Cycle %');
% title('Right Leg -- Tz Torques');

% print('Right Leg -- Tz Torques','-dpdf')

%% LEFT FORCES
% 
% load LeftMeanH0.mat
% load LeftStdH0.mat
% load LeftMeanH1.mat
% load LeftStdH1.mat
% load LeftMeanH2.mat
% load LeftStdH2.mat
% % 
% ftlH0(:,:,2) = [];
% sftlH0(:,:,2) = [];
% 
% ftlH1(:,:,2) = [];
% sftlH1(:,:,2) = [];
% 
% ftlH2(:,:,2) = [];
% sftlH2(:,:,2) = [];
% ftlH2(:,:,6-1) = [];
% sftlH2(:,:,6-1) = [];
% ftlH2(:,:,7-2) = [];
% sftlH2(:,:,7-2) = [];
% ftlH2(:,:,8-3) = [];
% sftlH2(:,:,8-3) = [];
% ftlH2(:,:,11-4) = [];
% sftlH2(:,:,11-4) = [];
% ftlH2(:,:,12-5) = [];
% sftlH2(:,:,12-5) = [];
% 
% 
% ftlH0 = mean(ftlH0,3);
% sftlH0 = mean(sftlH0,3);
% ftlH1 = mean(ftlH1,3);
% sftlH1 = mean(sftlH1,3);
% ftlH2 = mean(ftlH2,3);
% sftlH2 = mean(sftlH2,3);

% figure;
% p1 = plotGaitMeanStd(ftlH0(1,:), sftlH0(1,:), 'r');
% hold on;
% p2 = plotGaitMeanStd(ftlH1(1,:), sftlH1(1,:), 'b');
% hold on;
% p3 = plotGaitMeanStd(ftlH2(1,:), sftlH2(1,:), 'g');
% legend([p1 p2 p3],{'H0','H1','H2'})
% ylabel('Force [N]');
% xlabel('Gait Cycle %');
% title('Left Leg -- Fx Forces');

% figure;
% p1 = plotGaitMeanStd(ftlH0(2,:), sftlH0(2,:), 'r');
% hold on;
% p2 = plotGaitMeanStd(ftlH1(2,:), sftlH1(2,:), 'b');
% hold on;
% p3 = plotGaitMeanStd(ftlH2(2,:), sftlH2(2,:), 'g');
% legend([p1 p2 p3],{'H0','H1','H2'})
% ylabel('Force [N]');
% xlabel('Gait Cycle %');
% title('Left Leg -- Fy Forces');
% 
% figure;
% p1 = plotGaitMeanStd(ftlH0(6,:), sftlH0(6,:), 'r');
% hold on;
% p2 = plotGaitMeanStd(ftlH1(6,:), sftlH1(6,:), 'b');
% hold on;
% p3 = plotGaitMeanStd(ftlH2(6,:), sftlH2(6,:), 'g');
% legend([p1 p2 p3],{'H0','H1','H2'})
% ylabel('Toeque [Nm]');
% xlabel('Gait Cycle %');
% title('Left Leg -- Tz Torques');
% 
% print('Left Leg -- Tz Torques','-dpdf')


%[ftlH0(:,:,index), sftlH0(:,:,index)] = meanstd(separateGaits_interpolation(gait(:,:,2), ft(:,:,2)));

% NoExo = SampleComp(externalgait, externaldata,externalgait_2, externaldata_2);
% H0 = SampleComp(externalgait, externaldata,externalgait_2, externaldata_2);

% plotAdaptation_position(gaitdata, Hipangle, ["rx", "ry", "rtheta"])
% 

%% CALIBRATION VALIDATION
% To find the time of calibration start, manually detect the time just
% before the FT filter is first applied.
% plotFT(ft(:,:,1))
% plotFT(ft(:,:,2))
% plotMot(mot(:,:,1))
% global massFTr biasFTr eccentFTr massFTl biasFTl eccentFTl;
% calibration_validation(ft, mot, 17.0);

% abs(massFTl - massFTr)
%% INSPECT MOTOR TORQUES
% motor = getDiskMotData(alldat) * 30;

% plotMot(motor(:,:,1))
% plotMot(motor(:,:,2))

%% AUXILIARY FUNCTIONS
function fname = storeTargetFile(file, folder)
getFileFromTarget('Beckhoff C6030', file);
fname = moveFileTo(file, folder, formattedNow());
end

function data = getFTdata(datastruct)
rsignals = {'To HMI Coord.s/R Leg/FTproc/s1';
            'To HMI Coord.s/R Leg/FTproc/s2';
            'To HMI Coord.s/R Leg/FTproc/s3';
            'To HMI Coord.s/R Leg/FTproc/s4';
            'To HMI Coord.s/R Leg/FTproc/s5';
            'To HMI Coord.s/R Leg/FTproc/s6'};
lsignals = {'To HMI Coord.s/L Leg/FTproc/s1';
            'To HMI Coord.s/L Leg/FTproc/s2';
            'To HMI Coord.s/L Leg/FTproc/s3';
            'To HMI Coord.s/L Leg/FTproc/s4';
            'To HMI Coord.s/L Leg/FTproc/s5';
            'To HMI Coord.s/L Leg/FTproc/s6'};
data(:,:,1) = getSignals(datastruct, rsignals);
data(:,:,2) = getSignals(datastruct, lsignals);
data = permute(data, [2 1 3]);
end

function data = getMotData(datastruct)
rsignals = {'To HMI Coord.s/R Leg/pos_vel/p1/s1';
            'To HMI Coord.s/R Leg/pos_vel/p1/s2';
            'To HMI Coord.s/R Leg/pos_vel/p1/s3';
            'To HMI Coord.s/R Leg/pos_vel/p2/s1';
            'To HMI Coord.s/R Leg/pos_vel/p2/s2';
            'To HMI Coord.s/R Leg/pos_vel/p2/s3'};
lsignals = {'To HMI Coord.s/L Leg/pos_vel/p1/s1';
            'To HMI Coord.s/L Leg/pos_vel/p1/s2';
            'To HMI Coord.s/L Leg/pos_vel/p1/s3';
            'To HMI Coord.s/L Leg/pos_vel/p2/s1';
            'To HMI Coord.s/L Leg/pos_vel/p2/s2';
            'To HMI Coord.s/L Leg/pos_vel/p2/s3'};
data(:,:,1) = getSignals(datastruct, rsignals);
data(:,:,2) = getSignals(datastruct, lsignals);
data = permute(data, [2 1 3]);
end

function data = getForceRefData(datastruct)
rsignals = {'From HMI Coord.s/Reference/rFx';
            'From HMI Coord.s/Reference/rFy';
            'From HMI Coord.s/Reference/rTz'};
lsignals = {'From HMI Coord.s/Reference/lFx';
            'From HMI Coord.s/Reference/lFy';
            'From HMI Coord.s/Reference/lTz'};
data(:,:,1) = getSignals(datastruct, rsignals);
data(:,:,2) = getSignals(datastruct, lsignals);
data = permute(data, [2 1 3]);
end

function data = getMotRefData(datastruct)
rsignals = {'From HMI Coord.s/Reference/rx';
            'From HMI Coord.s/Reference/ry';
            'From HMI Coord.s/Reference/rtheta';
            'From HMI Coord.s/Reference/rvx';
            'From HMI Coord.s/Reference/rvy';
            'From HMI Coord.s/Reference/romega'};
lsignals = {'From HMI Coord.s/Reference/lx';
            'From HMI Coord.s/Reference/ly';
            'From HMI Coord.s/Reference/ltheta';
            'From HMI Coord.s/Reference/lvx';
            'From HMI Coord.s/Reference/lvy';
            'From HMI Coord.s/Reference/lomega'};
data(:,:,1) = getSignals(datastruct, rsignals);
data(:,:,2) = getSignals(datastruct, lsignals);
data = permute(data, [2 1 3]);
end

function data = getMotorDemTorques(datastruct)
rsignals = {'Right Leg/R Actuation/Target Torque/direction/s1';
            'Right Leg/R Actuation/Target Torque/direction/s2';
            'Right Leg/R Actuation/Target Torque/direction/s3'};
lsignals = {'Left Leg/L Actuation/Target Torque/direction/s1';
            'Left Leg/L Actuation/Target Torque/direction/s2';
            'Left Leg/L Actuation/Target Torque/direction/s3'};
data(:,:,1) = getSignals(datastruct, rsignals);
data(:,:,2) = getSignals(datastruct, lsignals);
data = permute(data, [2 1 3]);
end

function data = getMotorActTorques(datastruct)
rsignals = {'Right Leg/R Actuation/Target Torque/direction/s1';
            'Right Leg/R Actuation/Target Torque/direction/s2';
            'Right Leg/R Actuation/Target Torque/direction/s3'};
lsignals = {'Left Leg/L Actuation/Target Torque/direction/s1';
            'Left Leg/L Actuation/Target Torque/direction/s2';
            'Left Leg/L Actuation/Target Torque/direction/s3'};
data(:,:,1) = getSignals(datastruct, rsignals);
data(:,:,2) = getSignals(datastruct, lsignals);
data = permute(data, [2 1 3]);
end

function data = getDiskMotData(datastruct)
rsignals = {'Right Leg/R Outputs/R 3RRP/to disk angles/disk angles/s1';
            'Right Leg/R Outputs/R 3RRP/to disk angles/disk angles/s2';
            'Right Leg/R Outputs/R 3RRP/to disk angles/disk angles/s3';
            'Right Leg/R Outputs/R 3RRP/to disk velocities/disk vels/s1';
            'Right Leg/R Outputs/R 3RRP/to disk velocities/disk vels/s2';
            'Right Leg/R Outputs/R 3RRP/to disk velocities/disk vels/s3'};
lsignals = {'Left Leg/L Outputs/L 3RRP/to disk angles/disk angles/s1';
            'Left Leg/L Outputs/L 3RRP/to disk angles/disk angles/s2';
            'Left Leg/L Outputs/L 3RRP/to disk angles/disk angles/s3';
            'Left Leg/L Outputs/L 3RRP/to disk velocities/disk vels/s1';
            'Left Leg/L Outputs/L 3RRP/to disk velocities/disk vels/s2';
            'Left Leg/L Outputs/L 3RRP/to disk velocities/disk vels/s3'};
data(:,:,1) = getSignals(datastruct, rsignals);
data(:,:,2) = getSignals(datastruct, lsignals);
data = permute(data, [2 1 3]);
end

function data = getGaitData(datastruct, threshold)
rsignals = {'Right Leg/R Outputs/R Foot/V'};
lsignals = {'Left Leg/L Outputs/L Foot/V'};

if ~exist('threshold', 'var')
    rsignals = {'Right Leg/R Outputs/R Foot/V';
                'Plot//Record Outputs/Setup Data/heel_strike/s1';
                'Plot//Record Outputs/Setup Data/heel_strike/s3'};
    lsignals = {'Left Leg/L Outputs/L Foot/V';
                'Plot//Record Outputs/Setup Data/heel_strike/s2';
                'Plot//Record Outputs/Setup Data/heel_strike/s3'};
end

data(:,:,1) = getSignals(datastruct, rsignals);
data(:,:,2) = getSignals(datastruct, lsignals);
data = permute(data, [2 1 3]);

if exist('threshold', 'var')
    % Get the time instants at the threshold is exceeded.
    if length(threshold) == 1
        grounded = diff(data >= threshold) == 1;
    else
        grounded(1,:,1) = diff(data(1,:,1) >= threshold(1)) == 1;
        grounded(1,:,2) = diff(data(1,:,2) >= threshold(2)) == 1;
    end
    % Append one row due to differentiating.
    data(2,:,:) = cat(2, grounded, zeros(1,1,2));
end
end

function t = getCalibrationIndices(t_start)
t_samp = 100;
t_start = t_samp * t_start;
t_measure = t_samp * 0.7;
t_move = t_samp * 0.8;
t_fin = t_samp * 29;

t = t_start + (t_measure : t_measure + t_move : t_fin)';
t(end + 1) = t_fin + t_start;
end

function calibrate_mass(cft, cmot)
% DEFINE MEASURED AND UNKNOWN VARIABLES
global massFTr biasFTr eccentFTr massFTl biasFTl eccentFTl;
% Partition the collected data according to the sides.
rtheta = cmot(3, :, 1)';
ltheta = cmot(3, :, 2)';
rft = cft(:, :, 1)';
lft = cft(:, :, 2)';

% CALIBRATE THE RIGHT SIDE
A = [ones(length(rtheta), 1) sin(rtheta) cos(rtheta)];
w = permute(repmat([ones(6, 1) [-eye(2); 0 0; 0 1; -1 0; 1 -1]],...
                   [1 1 length(rtheta)]), [3 2 1]);
x = zeros(3, 6);
for i = 1:6
    x(:,i) = (A .* w(:,:,i)) \ rft(:,i);
end

massFTr = mean([x(2,1) x(3,2)]);
biasFTr = x(1,:)';
eccentFTr = [mean([x(3,4)/x(3,2) x(2,5)/x(2,1)]);
             x(2,6)/x(2,1);
             x(3,6)/x(3,2)];

% CALIBRATE THE LEFT SIDE
A = [ones(length(ltheta), 1) sin(ltheta) cos(ltheta)];
w = permute(repmat([ones(6, 1) [-eye(2); 0 0; 0 1; -1 0; 1 -1]],...
                   [1 1 length(ltheta)]), [3 2 1]);
x = zeros(3, 6);
for i = 1:6
    x(:,i) = (A .* w(:,:,i)) \ lft(:,i);
end

massFTl = mean([x(2,1) x(3,2)]);
biasFTl = x(1,:)';
eccentFTl = [mean([x(3,4)/x(3,2) x(2,5)/x(2,1)]);
             x(2,6)/x(2,1);
             x(3,6)/x(3,2)];
end

function ftVals = rotateFT(ftVals)
    ftVals(1:3,:) = roty(180) * ftVals(1:3,:);
    ftVals(4:6,:) = roty(180) * ftVals(4:6,:);
end

function FT = transformFTr(theta, FT)

global massFTr biasFTr eccentFTr;

FT = FT - biasFTr.* ones(6, length(theta))...
        - massFTr * [-sin(theta); -cos(theta); zeros(1, length(theta));
                     cos(theta) * eccentFTr(1);
                    -sin(theta) * eccentFTr(1);
                  (eccentFTr(2) * sin(theta) - eccentFTr(3) * cos(theta))];
end

function FT = transformFTl(theta, FT)

global massFTl biasFTl eccentFTl;

% FT(1:3,:) = roty(180) * FT(1:3,:);
% FT(4:6,:) = roty(180) * FT(4:6,:);

FT = FT - biasFTl.* ones(6, length(theta))...
        - massFTl * [-sin(theta); -cos(theta); zeros(1, length(theta));
                     cos(theta) * eccentFTl(1);
                    -sin(theta) * eccentFTl(1);
                  (eccentFTl(2) * sin(theta) - eccentFTl(3) * cos(theta))];
end

function calibration_validation(ft, mot, tstart)

tcal = getCalibrationIndices(tstart);
tplot = (tstart + 0.5) * 100 : tcal(end);
calibrate_mass(ft(:,tcal,:), mot(:,tcal,:))

ftrval = transformFTr(mot(3,:,1), ft(:,:,1));
multiaxisplot(ftrval([1 2 4 5 6],tplot'), ["Fx", "Fy", "Tx", "Ty", "Tz"])
grid on;
xlabel('Force')
ylabel('Time')

ftlval = transformFTl(mot(3,:,2), ft(:,:,2));
multiaxisplot(ftlval([1 2 4 5 6],tplot'), ["Fx", "Fy", "Tx", "Ty", "Tz"])
end

function plotBilatRotMot(mot)
figure; hold on;
for i = 3:3:6
    plot(mot(i, :, 1))
    plot(mot(i, :, 2))
end
grid on; hold off;
legend(["\theta_R", "\theta_L", "\omega_R", "\omega_L"])
end

function plotForceRef(ref)
figure; hold on;
for i = 1:3
    plot(ref(i,:))
end
grid on; hold off;
legend(["refFx", "refFy", "refTz"])
end

function h = circle(x,y,r)
hold on
th = 0:pi/50:2*pi;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
fill(xunit, yunit, 'r',...
     'facealpha', 0.3, 'edgealpha', 0.3);
h = plot(xunit, yunit);
hold on
end

function XYVal = Arc(xCenter,yCenter,radius,theta)
UpperTheta = theta(1);
LowerTheta = theta(2);

% Define the angle theta as going from Lower to Upper values degrees in 100 steps.
theta = linspace(LowerTheta,UpperTheta, 100);
% Define x and y using "Degrees" version of sin and cos.
x = radius * cosd(theta) + xCenter; 
y = radius * sind(theta) + yCenter; 
XYVal = [x;y];
% Now plot the points.
hold on
plot(x, y, 'b-', 'LineWidth', 2); 
axis equal; 
grid on;

end 