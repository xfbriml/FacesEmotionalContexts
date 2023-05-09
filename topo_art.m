data_new200_300 = data_new(:,76:101);
data_old200_300 = data_old(:,76:101);

data_new300_500 = data_new(:,101:151);
data_old300_500 = data_old(:,101:151);

data_new500_800 = data_new(:,151:226);
data_old500_800 = data_old(:,151:226);

data_new800_1100 = data_new(:,226:300);
data_old800_1100 = data_old(:,226:300);


data_neg200_300 = data_neg(:,76:101);
data_neu200_300 = data_neu(:,76:101);
data_pos200_300 = data_pos(:,76:101);

data_emo200_300 = data_emo(:,76:101);

data_neg300_500 = data_neg(:,101:151);
data_neu300_500 = data_neu(:,101:151);
data_pos300_500 = data_pos(:,101:151);

data_emo300_500 = data_emo(:,101:151);

data_neg500_800 = data_neg(:,151:226);
data_neu500_800 = data_neu(:,151:226);
data_pos500_800 = data_pos(:,151:226);

data_emo500_800 = data_emo(:,151:226);

data_neg800_1100 = data_neg(:,226:300);
data_neu800_1100 = data_neu(:,226:300);
data_pos800_1100 = data_pos(:,226:300);

data_emo800_1100 = data_emo(:,226:300);

dataSelected_new200_300 = data_selectedElectrodes_new(:,76:101);
dataSelected_old200_300 = data_selectedElectrodes_old(:,76:101);

dataSelected_new300_500 = data_selectedElectrodes_new(:,101:151);
dataSelected_old300_500 = data_selectedElectrodes_old(:,101:151);

dataSelected_new500_800 = data_selectedElectrodes_new(:,151:226);
dataSelected_old500_800 = data_selectedElectrodes_old(:,151:226);

dataSelected_new800_1100 = data_selectedElectrodes_new(:,226:300);
dataSelected_old800_1100 = data_selectedElectrodes_old(:,226:300);

dataSelected_neg200_300 = data_selectedElectrodes_neg(:,76:101);
dataSelected_neg300_500 = data_selectedElectrodes_neg(:,101:151);
dataSelected_neg500_800 = data_selectedElectrodes_neg(:,151:226);
dataSelected_neg800_1100 = data_selectedElectrodes_neg(:,226:300);

dataSelected_neu200_300 = data_selectedElectrodes_neu(:,76:101);
dataSelected_neu300_500 = data_selectedElectrodes_neu(:,101:151);
dataSelected_neu500_800 = data_selectedElectrodes_neu(:,151:226);
dataSelected_neu800_1100 = data_selectedElectrodes_neu(:,226:300);

dataSelected_pos200_300 = data_selectedElectrodes_pos(:,76:101);
dataSelected_pos300_500 = data_selectedElectrodes_pos(:,101:151);
dataSelected_pos500_800 = data_selectedElectrodes_pos(:,151:226);
dataSelected_pos800_1100 = data_selectedElectrodes_pos(:,226:300);

dataSelected_emo200_300 = data_selectedElectrodes_emo(:,76:101);
dataSelected_emo300_500 = data_selectedElectrodes_emo(:,101:151);
dataSelected_emo500_800 = data_selectedElectrodes_emo(:,151:226);
dataSelected_emo800_1100 = data_selectedElectrodes_emo(:,226:300);


meanSelected_old200_300 = [];
mean_old200_300 = [];
meanSelected_old200_300 = mean(dataSelected_old200_300');
mean_old200_300 = mean(data_old200_300');

meanSelected_old300_500 = [];
mean_old300_500 = [];
meanSelected_old300_500 = mean(dataSelected_old300_500');
mean_old300_500 = mean(data_old300_500');

meanSelected_old500_800 = [];
mean_old500_800 = [];
meanSelected_old500_800 = mean(dataSelected_old500_800');
mean_old500_800 = mean(data_old500_800');

meanSelected_old800_1100 = [];
mean_old800_1100 = [];
meanSelected_old800_1100 = mean(dataSelected_old800_1100');
mean_old800_1100 = mean(data_old800_1100');


meanSelected_new200_300 = [];
mean_new200_300 = [];
meanSelected_new200_300 = mean(dataSelected_new200_300');
mean_new200_300 = mean(data_new200_300');

meanSelected_new300_500 = [];
mean_new300_500 = [];
meanSelected_new300_500 = mean(dataSelected_new300_500');
mean_new300_500 = mean(data_new300_500');

meanSelected_new500_800 = [];
mean_new500_800 = [];
meanSelected_new500_800 = mean(dataSelected_new500_800');
mean_new500_800 = mean(data_new500_800');

meanSelected_new800_1100 = [];
mean_new800_1100 = [];
meanSelected_new800_1100 = mean(dataSelected_new800_1100');
mean_new800_1100 = mean(data_new800_1100');


meanSelected_neg200_300 = [];
mean_neg200_300 = [];
meanSelected_neg200_300 = mean(dataSelected_neg200_300');
mean_neg200_300 = mean(data_neg200_300');

meanSelected_neg300_500 = [];
mean_neg300_500 = [];
meanSelected_neg300_500 = mean(dataSelected_neg300_500');
mean_neg300_500 = mean(data_neg300_500');

meanSelected_neg500_800 = [];
mean_neg500_800 = [];
meanSelected_neg500_800 = mean(dataSelected_neg500_800');
mean_neg500_800 = mean(data_neg500_800');

meanSelected_neg800_1100 = [];
mean_neg800_1100 = [];
meanSelected_neg800_1100 = mean(dataSelected_neg800_1100');
mean_neg800_1100 = mean(data_neg800_1100');

meanSelected_neu200_300 = [];
mean_neu200_300 = [];
meanSelected_neu200_300 = mean(dataSelected_neu200_300');
mean_neu200_300 = mean(data_neu200_300');

meanSelected_neu300_500 = [];
mean_neu300_500 = [];
meanSelected_neu300_500 = mean(dataSelected_neu300_500');
mean_neu300_500 = mean(data_neu300_500');

meanSelected_neu500_800 = [];
mean_neu500_800 = [];
meanSelected_neu500_800 = mean(dataSelected_neu500_800');
mean_neu500_800 = mean(data_neu500_800');

meanSelected_neu800_1100 = [];
mean_neu800_1100 = [];
meanSelected_neu800_1100 = mean(dataSelected_neu800_1100');
mean_neu800_1100 = mean(data_neu800_1100');

meanSelected_pos200_300 = [];
mean_pos200_300 = [];
meanSelected_pos200_300 = mean(dataSelected_pos200_300');
mean_pos200_300 = mean(data_pos200_300');

meanSelected_pos300_500 = [];
mean_pos300_500 = [];
meanSelected_pos300_500 = mean(dataSelected_pos300_500');
mean_pos300_500 = mean(data_pos300_500');

meanSelected_pos500_800 = [];
mean_pos500_800 = [];
meanSelected_pos500_800 = mean(dataSelected_pos500_800');
mean_pos500_800 = mean(data_pos500_800');

meanSelected_pos800_1100 = [];
mean_pos800_1100 = [];
meanSelected_pos800_1100 = mean(dataSelected_pos800_1100');
mean_pos800_1100 = mean(data_pos800_1100');


meanSelected_emo200_300 = [];
mean_emo200_300 = [];
meanSelected_emo200_300 = mean(dataSelected_emo200_300');
mean_emo200_300 = mean(data_emo200_300');

meanSelected_emo300_500 = [];
mean_emo300_500 = [];
meanSelected_emo300_500 = mean(dataSelected_emo300_500');
mean_emo300_500 = mean(data_emo300_500');

meanSelected_emo500_800 = [];
mean_emo500_800 = [];
meanSelected_emo500_800 = mean(dataSelected_emo500_800');
mean_emo500_800 = mean(data_emo500_800');

meanSelected_emo800_1100 = [];
mean_emo800_1100 = [];
meanSelected_emo800_1100 = mean(dataSelected_emo800_1100');
mean_emo800_1100 = mean(data_emo800_1100');

%% Import data from text file
% Script for importing data from the following text file:
%
%    filename: C:\Users\USER\OneDrive\Área de Trabalho\MESTRADO\EEG DATA\eeglab2019_0\sample_locs\selectedElectrodesposition.locs
%
% Auto-generated by MATLAB on 25-Nov-2021 16:10:50

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 4);

% Specify range and delimiter
opts.DataLines = [1, Inf];
opts.Delimiter = "\t";

% Specify column names and types
opts.VariableNames = ["VarName1", "VarName2", "VarName3", "F3"];
opts.VariableTypes = ["double", "double", "double", "string"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, "F3", "WhitespaceRule", "preserve");
opts = setvaropts(opts, "F3", "EmptyFieldRule", "auto");

% Import the data
selectedElectrodesposition = readtable("C:\Users\USER\OneDrive\Área de Trabalho\MESTRADO\EEG DATA\eeglab2019_0\sample_locs\selectedElectrodesposition.locs", opts);


%% Clear temporary variables
clear opts
%%
selectedElectrodesposition.Properties.VariableNames{2} = 'X';
selectedElectrodesposition.Properties.VariableNames{3} = 'Y';
%%
% get cartesian coordinates
[elocsX,elocsY] = pol2cart(pi/180*[selectedElectrodesposition.X],[selectedElectrodesposition.Y]);

% plot electrode locations
figure(1), clf
scatter(elocsY,elocsX,100,'ro','filled');
set(gca,'xlim',[-.6 .6],'ylim',[-.6 .6])
axis square
title('Electrode locations')


% define XY points for interpolation
interp_detail = 100;
interpX = linspace(min(elocsX)-.2,max(elocsX)+.25,interp_detail);
interpY = linspace(min(elocsY),max(elocsY),interp_detail);

% meshgrid is a function that creates 2D grid locations based on 1D inputs
[gridX,gridY] = meshgrid(interpX,interpY);

% let's look at these matrices
hold on
plot3(gridY(:),gridX(:),-ones(1,interp_detail^2),'k.')

%% extract data and interpolate to 2D grid

% data from this frequency from some other matrix
dat = double( meanSelected_new200_300');

% now interpolate the data on a 2D grid
interpFunction = TriScatteredInterp(elocsY,elocsX,dat);
topodata = interpFunction(gridX,gridY);
%% plot results

figure(2), clf

% contourf
subplot(221)
contourf(interpY,interpX,topodata,100,'linecolor','none');
axis square
set(gca,'xlim',[-.5 .5],'ylim',[-1 .8])
title('Interpolated data using ''contourf''')

% surface
subplot(222)
surf(interpY,interpX,topodata);
xlabel('left-right of scalp'), ylabel('anterior-posterior of scalp'), zlabel('\muV')
shading interp, axis square
set(gca,'xlim',[-.5 .5],'ylim',[-1 .8])
rotate3d on, view(0,90)
title('Interpolated data using ''surf''')

% pixelated image
subplot(223)
imagesc(interpY,interpX,topodata);
xlabel('left-right of scalp'), ylabel('anterior-posterior of scalp'), zlabel('\muV')
set(gca,'xlim',[-.5 .5],'ylim',[-1 .8])
title('Interpolated data using ''imagesc''')

% eeglab function
subplot(224)
topoplot(dat,'selectedElectrodesposition'); % eeglab's topoplot function
title('Interpolated data using eeglab ''topoplot''')


%% useful bit of code to see channel locations

figure
topoplot(dat,'selectedElectrodesposition.locs','electrodes','ptslabels');
% hint: click on an electrode to see its corresponding index (number)


% Same but with the selected cluster 
% data from this frequency from some other matrix
dat1 = meanSelected_new200_300';
dat2 = meanSelected_new300_500';
dat3 = meanSelected_new500_800';
dat4 = meanSelected_new800_1100';
dat5 = meanSelected_old200_300';
dat6 = meanSelected_old300_500';
dat7 = meanSelected_old500_800';
dat8 = meanSelected_old800_1100';
% now interpolate the data on a 2D grid
figure;
subplot(241)
topoplot(dat1,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('New 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat1)));
hold on




subplot(242)
topoplot(dat2,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('New 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat2)));
hold on




subplot(243)
topoplot(dat3,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('New 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat3)));
hold on




subplot(244)
topoplot(dat4,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('New 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat4)));
hold on



subplot(245)
topoplot(dat5,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Old 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat5)));
hold on




subplot(246)
topoplot(dat6,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Old 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat6)));

hold on


subplot(247)
topoplot(dat7,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Old 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat7)));
hold on


subplot(248)
topoplot(dat8,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Old 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat8)));
hold off

% plotar a diferença, tanto topografico nas diversas epochs e por tempo. 
% pra ver se a diferença é divertida

figure;
subplot(141)
topoplot(dat5-dat1,'selectedElectrodesposition.locs');
title('Difference between Old/New 200-300 ms')
cbar('horiz',0,[-.25 .25]*max(abs(dat5-dat1)));
hold on
subplot(142)
topoplot(dat6-dat2,'AllElectrodesposition.locs');
title('Difference between Old/New 300-500 ms')
cbar('horiz',0,[-.25 .25]*max(abs(dat6-dat2)));
hold on
subplot(143)
topoplot(dat7-dat3,'selectedElectrodesposition.locs');
title('Difference between Old/New 500-800 ms')
cbar('horiz',0,[-.25 .25]*max(abs(dat7-dat3)));
hold on
subplot(144)
topoplot(dat8-dat4,'selectedElectrodesposition.locs');
title('Difference between Old/New 800-1100 ms')
cbar('horiz',0,[-.25 .25]*max(abs(dat8-dat4)));
hold off
%%emo/CR/neu
%as condições emo/new/neu

% data from this frequency from some other matrix
dat1 = meanSelected_new200_300';
dat2 = meanSelected_new300_500';
dat3 = meanSelected_new500_800';
dat4 = meanSelected_new800_1100';
dat5 = meanSelected_neu200_300';
dat6 = meanSelected_neu300_500';
dat7 = meanSelected_neu500_800';
dat8 = meanSelected_neu800_1100';
dat9 = meanSelected_emo200_300';
dat10 = meanSelected_emo300_500';
dat11 = meanSelected_emo500_800';
dat12 = meanSelected_emo800_1100';
% now interpolate the data on a 2D grid

subplot(341)
topoplot(dat1,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('New 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat1)));
hold on

subplot(342)
topoplot(dat2,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('New 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat2)));
hold on

subplot(343)
topoplot(dat3,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('New 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat3)));
hold on

subplot(344)
topoplot(dat4,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('New 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat4)));
hold on

subplot(345)
topoplot(dat5,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Neu 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat5)));
hold on

subplot(346)
topoplot(dat6,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Neu 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat6)));

hold on

subplot(347)
topoplot(dat7,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Neu 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat7)));
hold on

subplot(348)
topoplot(dat8,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Neu 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat8)));
hold off

subplot(349)
topoplot(dat9,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Emo 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat5)));
hold on

subplot(3,4,10)
topoplot(dat10,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Emo 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat10)));

hold on

subplot(3,4,11)
topoplot(dat11,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Emo 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat11)));
hold on

subplot(3,4,12)
topoplot(dat12,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Emo 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat12)));
hold off
% diferenças agora
figure;
subplot(341)
topoplot(dat5-dat1,'selectedElectrodesposition.locs');
title('Difference between Neu/New 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat5-dat1)));
hold on
subplot(342)
topoplot(dat6-dat2,'selectedElectrodesposition.locs');
title('Difference between Neu/New 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat6-dat2)));
hold on
subplot(343)
topoplot(dat7-dat3,'selectedElectrodesposition.locs');
title('Difference between Neu/New 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat7-dat3)));
hold on
subplot(344)
topoplot(dat8-dat4,'selectedElectrodesposition.locs');
title('Difference between Neu/New 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat8-dat4)));
hold on

subplot(345)
topoplot(dat9-dat1,'selectedElectrodesposition.locs');
title('Difference between Emo/New 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat9-dat1)));
hold on
subplot(346)
topoplot(dat10-dat2,'selectedElectrodesposition.locs');
title('Difference between Emo/New 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat10-dat2)));
hold on
subplot(347)
topoplot(dat11-dat3,'selectedElectrodesposition.locs');
title('Difference between Emo/New 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat11-dat3)));
hold on
subplot(348)
topoplot(dat12-dat4,'selectedElectrodesposition.locs');
title('Difference between Emo/New 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat12-dat4)));
hold on

subplot(349)
topoplot(dat9-dat5,'selectedElectrodesposition.locs');
title('Difference between Emo/Neu 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat9-dat5)));
hold on
subplot(3,4,10)
topoplot(dat10-dat6,'selectedElectrodesposition.locs');
title('Difference between Emo/Neu 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat10-dat6)));
hold on
subplot(3,4,11)
topoplot(dat11-dat7,'selectedElectrodesposition.locs');
title('Difference between Emo/Neu 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat11-dat7)));
hold on
subplot(3,4,12)
topoplot(dat12-dat8,'selectedElectrodesposition.locs');
title('Difference between Emo/Neu 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat12-dat8)));
hold off

%GRANDE 4X4 DIFERENÇAS 


dat1 = meanSelected_new200_300';
dat2 = meanSelected_new300_500';
dat3 = meanSelected_new500_800';
dat4 = meanSelected_new800_1100';
dat5 = meanSelected_neu200_300';
dat6 = meanSelected_neu300_500';
dat7 = meanSelected_neu500_800';
dat8 = meanSelected_neu800_1100';
dat9 = meanSelected_emo200_300';
dat10 = meanSelected_emo300_500';
dat11 = meanSelected_emo500_800';
dat12 = meanSelected_emo800_1100';
figure;
subplot(441)
topoplot(dat5-dat1,'selectedElectrodesposition.locs');
title('Difference between Neu/New 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat5-dat1)));
hold on
subplot(442)
topoplot(dat6-dat2,'selectedElectrodesposition.locs');
title('Difference between Neu/New 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat6-dat2)));
hold on
subplot(443)
topoplot(dat7-dat3,'selectedElectrodesposition.locs');
title('Difference between Neu/New 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat7-dat3)));
hold on
subplot(444)
topoplot(dat8-dat4,'selectedElectrodesposition.locs');
title('Difference between Neu/New 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat8-dat4)));
hold on

subplot(445)
topoplot(dat9-dat1,'selectedElectrodesposition.locs');
title('Difference between Emo/New 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat9-dat1)));
hold on
subplot(446)
topoplot(dat10-dat2,'selectedElectrodesposition.locs');
title('Difference between Emo/New 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat10-dat2)));
hold on
subplot(447)
topoplot(dat11-dat3,'selectedElectrodesposition.locs');
title('Difference between Emo/New 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat11-dat3)));
hold on
subplot(448)
topoplot(dat12-dat4,'selectedElectrodesposition.locs');
title('Difference between Emo/New 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat12-dat4)));
hold on

subplot(449)
topoplot(dat9-dat5,'selectedElectrodesposition.locs');
title('Difference between Emo/Neu 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat9-dat5)));
hold on
subplot(4,4,10)
topoplot(dat10-dat6,'selectedElectrodesposition.locs');
title('Difference between Emo/Neu 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat10-dat6)));
hold on
subplot(4,4,11)
topoplot(dat11-dat7,'selectedElectrodesposition.locs');
title('Difference between Emo/Neu 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat11-dat7)));
hold on
subplot(4,4,12)
topoplot(dat12-dat8,'selectedElectrodesposition.locs');
title('Difference between Emo/Neu 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat12-dat8)));
hold on


dat1 = meanSelected_new200_300';
dat2 = meanSelected_new300_500';
dat3 = meanSelected_new500_800';
dat4 = meanSelected_new800_1100';
dat5 = meanSelected_old200_300';
dat6 = meanSelected_old300_500';
dat7 = meanSelected_old500_800';
dat8 = meanSelected_old800_1100';


subplot(4,4,13)
topoplot(dat5-dat1,'selectedElectrodesposition.locs');
title('Difference between Old/New 200-300 ms')
cbar('horiz',0,[-.25 .25]*max(abs(dat5-dat1)));
hold on
subplot(4,4,14)
topoplot(dat6-dat2,'selectedElectrodesposition.locs');
title('Difference between Old/New 300-500 ms')
cbar('horiz',0,[-.25 .25]*max(abs(dat6-dat2)));
hold on
subplot(4,4,15)
topoplot(dat7-dat3,'selectedElectrodesposition.locs');
title('Difference between Old/New 500-800 ms')
cbar('horiz',0,[-.25 .25]*max(abs(dat7-dat3)));
hold on
subplot(4,4,16)
topoplot(dat8-dat4,'selectedElectrodesposition.locs');
title('Difference between Old/New 800-1100 ms')
cbar('horiz',0,[-.25 .25]*max(abs(dat8-dat4)));
hold off


%%Próximo passo fazer um subplot com mapas topograficos das três epochs para
%as condições neg/neu/pos

% data from this frequency from some other matrix
dat1 = meanSelected_neg200_300';
dat2 = meanSelected_neg300_500';
dat3 = meanSelected_neg500_800';
dat4 = meanSelected_neg800_1100';
dat5 = meanSelected_neu200_300';
dat6 = meanSelected_neu300_500';
dat7 = meanSelected_neu500_800';
dat8 = meanSelected_neu800_1100';
dat9 = meanSelected_pos200_300';
dat10 = meanSelected_pos300_500';
dat11 = meanSelected_pos500_800';
dat12 = meanSelected_pos800_1100';

subplot(341)
topoplot(dat1,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Neg 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat1)));
hold on

subplot(342)
topoplot(dat2,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Neg 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat2)));
hold on

subplot(343)
topoplot(dat3,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Neg 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat3)));
hold on

subplot(344)
topoplot(dat4,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Neg 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat3)));
hold on

subplot(345)
topoplot(dat5,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Neu 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat5)));
hold on

subplot(346)
topoplot(dat6,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Neu 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat6)));
hold on

subplot(347)
topoplot(dat7,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Neu 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat7)));
hold off

subplot(348)
topoplot(dat8,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Neu 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat8)));
hold on

subplot(349)
topoplot(dat9,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Pos 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat9)));
hold on

subplot(3,4,10)
topoplot(dat10,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Pos 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat10)));
hold on

subplot(3,4,11)
topoplot(dat11,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Pos 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat11)));
hold on

subplot(3,4,12)
topoplot(dat12,'selectedElectrodesposition.locs'); % eeglab's topoplot function
title('Pos 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat12)));
hold on




%%
%PLOTAR AS DIFERENÇAS NEU VS CR / emo vs cr/ emo vs neu/ neg vs neu/ neg vs cr


% import selectedElectrodesposition.locs(se quiser fazer com os eletrodos selecionados algumas variaveis vao ter que ser modificadas) or AllElectrodesposition.locs (both in samplelocs eeglab folder) if it wasnt already imported in the
% begining. Rename second and third column as X and Y
% introduction to topographical plotting




dat1 = meanSelected_new200_300';
dat2 = meanSelected_new300_500';
dat3 = meanSelected_new500_800';
dat4 = meanSelected_new800_1100';
dat5 = meanSelected_neu200_300';
dat6 = meanSelected_neu300_500';
dat7 = meanSelected_neu500_800';
dat8 = meanSelected_neu800_1100';
dat9 = meanSelected_emo200_300';
dat10 = meanSelected_emo300_500';
dat11 = meanSelected_emo500_800';
dat12 = meanSelected_emo800_1100';
figure;
subplot(341)
topoplot(dat5-dat1,'selectedElectrodesposition.locs');
title('Difference between Neu/New 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat5-dat1)));
hold on
subplot(342)
topoplot(dat6-dat2,'selectedElectrodesposition.locs');
title('Difference between Neu/New 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat6-dat2)));
hold on
subplot(343)
topoplot(dat7-dat3,'selectedElectrodesposition.locs');
title('Difference between Neu/New 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat7-dat3)));
hold on
subplot(344)
topoplot(dat8-dat4,'selectedElectrodesposition.locs');
title('Difference between Neu/New 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat8-dat4)));
hold on

subplot(345)
topoplot(dat9-dat1,'selectedElectrodesposition.locs');
title('Difference between Emo/New 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat9-dat1)));
hold on
subplot(346)
topoplot(dat10-dat2,'selectedElectrodesposition.locs');
title('Difference between Emo/New 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat10-dat2)));
hold on
subplot(347)
topoplot(dat11-dat3,'selectedElectrodesposition.locs');
title('Difference between Emo/New 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat11-dat3)));
hold on
subplot(348)
topoplot(dat12-dat4,'selectedElectrodesposition.locs');
title('Difference between Emo/New 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat12-dat4)));
hold on

subplot(349)
topoplot(dat9-dat5,'selectedElectrodesposition.locs');
title('Difference between Emo/Neu 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat9-dat5)));
hold on
subplot(3,4,10)
topoplot(dat10-dat6,'selectedElectrodesposition.locs');
title('Difference between Emo/Neu 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat10-dat6)));
hold on
subplot(3,4,11)
topoplot(dat11-dat7,'selectedElectrodesposition.locs');
title('Difference between Emo/Neu 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat11-dat7)));
hold on
subplot(3,4,12)
topoplot(dat12-dat8,'selectedElectrodesposition.locs');
title('Difference between Emo/Neu 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat12-dat8)));
hold off



dat1 = meanSelected_new200_300';
dat2 = meanSelected_new300_500';
dat3 = meanSelected_new500_800';
dat4 = meanSelected_new800_1100';
dat5 = meanSelected_neu200_300';
dat6 = meanSelected_neu300_500';
dat7 = meanSelected_neu500_800';
dat8 = meanSelected_neu800_1100';
dat9 = meanSelected_neg200_300';
dat10 = meanSelected_neg300_500';
dat11 = meanSelected_neg500_800';
dat12 = meanSelected_neg800_1100';
figure;

subplot(241)
topoplot(dat9-dat1,'selectedElectrodesposition.locs');
title('Difference between Neg/New 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat9-dat1)));
hold on
subplot(242)
topoplot(dat10-dat2,'selectedElectrodesposition.locs');
title('Difference between Neg/New 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat10-dat2)));
hold on
subplot(243)
topoplot(dat11-dat3,'selectedElectrodesposition.locs');
title('Difference between Neg/New 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat11-dat3)));
hold on
subplot(244)
topoplot(dat12-dat4,'selectedElectrodesposition.locs');
title('Difference between Neg/New 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat12-dat4)));
hold on

subplot(245)
topoplot(dat9-dat5,'selectedElectrodesposition.locs');
title('Difference between Neg/Neu 200-300 ms')
cbar('horiz',0,[-1 1]*max(abs(dat9-dat5)));
hold on
subplot(2,4,6)
topoplot(dat10-dat6,'selectedElectrodesposition.locs');
title('Difference between Neg/Neu 300-500 ms')
cbar('horiz',0,[-1 1]*max(abs(dat10-dat6)));
hold on
subplot(2,4,7)
topoplot(dat11-dat7,'selectedElectrodesposition.locs');
title('Difference between Neg/Neu 500-800 ms')
cbar('horiz',0,[-1 1]*max(abs(dat11-dat7)));
hold on
subplot(2,4,8)
topoplot(dat12-dat8,'selectedElectrodesposition.locs');
title('Difference between Neg/Neu 800-1100 ms')
cbar('horiz',0,[-1 1]*max(abs(dat12-dat8)));
hold off

%% Import data from text file
% Script for importing data from the following text file:
%
%    filename: C:\Users\USER\OneDrive\Área de Trabalho\MESTRADO\EEG DATA\eeglab2019_0\sample_locs\AllElectrodesposition.locs
%
% Auto-generated by MATLAB on 25-Nov-2021 16:14:16

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 4);

% Specify range and delimiter
opts.DataLines = [1, Inf];
opts.Delimiter = "\t";

% Specify column names and types
opts.VariableNames = ["VarName1", "VarName2", "VarName3", "FP1"];
opts.VariableTypes = ["double", "double", "double", "string"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, "FP1", "WhitespaceRule", "preserve");
opts = setvaropts(opts, "FP1", "EmptyFieldRule", "auto");

% Import the data
AllElectrodesposition = readtable("C:\Users\USER\OneDrive\Área de Trabalho\MESTRADO\EEG DATA\eeglab2019_0\sample_locs\AllElectrodesposition.locs", opts);


%% Clear temporary variables
clear opts

%%
AllElectrodesposition.Properties.VariableNames{2} = 'X';
AllElectrodesposition.Properties.VariableNames{3} = 'Y';
%%
% get cartesian coordinates
[elocsX,elocsY] = pol2cart(pi/180*[AllElectrodesposition.X],[AllElectrodesposition.Y]);

% plot electrode locations
figure;
scatter(elocsY,elocsX,100,'ro','filled');
set(gca,'xlim',[-.6 .6],'ylim',[-.6 .6])
axis square
title('Electrode locations')
% define XY points for interpolation
interp_detail =5000;
interpX = linspace(min(elocsX)-1,max(elocsX)+1,interp_detail);
interpY = linspace(min(elocsY)-1,max(elocsY)+1,interp_detail);
% meshgrid is a function that creates 2D grid locations based on 1D inputs
[gridX,gridY] = meshgrid(interpX,interpY);
% let's look at these matrices
hold on
plot3(gridY(:),gridX(:),-ones(1,interp_detail^2),'k.')
% extract data and interpolate to 2D grid

timepoint2plot = 0.2; % in ms
% convert time point from ms to index
[~,timepointidx] = min(abs(time_vector-timepoint2plot));

% data from this frequency from some other matrix
dat = double( mean(data_emo200_300'));
% now interpolate the data on a 2D grid  TriScatteredInterp scatteredInterpolant
interpFunction = scatteredInterpolant (elocsY,elocsX,dat');
topodata = interpFunction(gridX,gridY);
figure, clf

% contourf
subplot(221)
contourf(interpY,interpX,topodata,100,'linecolor','none');
axis square
set(gca,'xlim',[-.5 .5],'ylim',[-1 .8])
title('Interpolated data using ''contourf''')

% surface
subplot(222)
surf(interpY,interpX,topodata);
xlabel('left-right of scalp'), ylabel('anterior-posterior of scalp'), zlabel('\muV')
shading interp, axis square
set(gca,'xlim',[-.5 .5],'ylim',[-1 .8])
rotate3d on, view(0,90)
title('Interpolated data using ''surf''')

% pixelated image
subplot(223)
imagesc(interpY,interpX,topodata);
xlabel('left-right of scalp'), ylabel('anterior-posterior of scalp'), zlabel('\muV')
set(gca,'xlim',[-.5 .5],'ylim',[-1 .8])
title('Interpolated data using ''imagesc''')

% eeglab function
subplot(224)
topoplot(dat,'AllElectrodesposition.locs'); % eeglab's topoplot function
title('Interpolated data using eeglab ''topoplot''')


figure;
topoplot(dat,'AllElectrodesposition.locs'); % eeglab's topoplot function
%title('Interpolated data using eeglab ''topoplot''')
% useful bit of code to see channel locations
hold on
topoplot([],'AllElectrodesposition.locs','electrodes','ptslabels');
% hint: click on an electrode to see its corresponding index (number)
%
%
%Próximo passo fazer um subplot com mapas topograficos das três epochs para
%as condições old/new
