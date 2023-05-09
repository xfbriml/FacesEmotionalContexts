%todos os contextos

figure;
plot(time_vector,meanNew_electrodes, 'Linewidth',6, 'Color', [0, 0.4470, 0.7410])
hold on
plot(time_vector,meanNeg_electrodes, 'Linewidth',6, 'Color', [0.8500, 0.3250, 0.0980])
hold on
plot(time_vector,meanNeu_electrodes, 'Linewidth',6, 'Color', [0.9290, 0.6940, 0.1250])
hold on
plot(time_vector,meanPos_electrodes, 'Linewidth',6, 'Color', [0.4940, 0.1840, 0.5560])
hold on
axis tight
line([0 0], [6 -4],'LineWidth',3, 'Color', 'k','LineStyle','--');
line([-0.1 1.1],[0 0],'LineWidth',3, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
xlabel('Time (S)')
ylabel('Amplitude')
set(gcf,'color','white')
title('Activation for Negative, Neutral and Positive contexts, and Correct rejections')
hold off

%emo, neu e CR

figure;
plot(time_vector,meanNew_electrodes, 'Linewidth',6, 'Color', [0, 0.4470, 0.7410])
hold on
plot(time_vector,mean_emo, 'Linewidth',6, 'Color', [0.6350, 0.0780, 0.1840])
hold on
plot(time_vector,meanNeu_electrodes, 'Linewidth',6, 'Color', [0.9290, 0.6940, 0.1250])
hold on
axis tight
line([0 0], [6 -4],'LineWidth',3, 'Color', 'k','LineStyle','--');
line([-0.1 1.1],[0 0],'LineWidth',3, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
xlabel('Time (S)')
ylabel('Amplitude')
set(gcf,'color','white')
title('Activation for Emotional Hits, Neutral Hits and Correct rejections')
hold off
%old/new

figure;
plot(time_vector,meanNew_electrodes, 'Linewidth',6, 'Color', [0, 0.4470, 0.7410])
hold on
plot(time_vector,meanOld_electrodes, 'Linewidth',6, 'Color', [0.4660, 0.6740, 0.1880])
hold on

axis tight
line([0 0], [4 -3],'LineWidth',3, 'Color', 'k','LineStyle','--');
line([-0.1 1.1],[0 0],'LineWidth',3, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
xlabel('Time (S)')
ylabel('Amplitude')
set(gcf,'color','white')
title('Activation for Hits and Correct rejections')
hold off

%Plot
figure;
plot(time_vector, data_new);
hold on
plot(time_vector,meanNew_electrodes,'Linewidth',6, 'Color','k')
axis tight
line([0 0], [9 -11],'LineWidth',3, 'Color', 'k','LineStyle','--');
line([-0.1 1.1],[0 0],'LineWidth',3, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
xlabel('Time (S)')
ylabel('Amplitude')
set(gcf,'color','white')
title('Activation for Correct Rejections')
hold off
% 
%Import data for OLD condition
%
data_old = T(:,2:326);
data_old = data_old{:,:};
meanOld_electrodes = mean(data_old);
%
%
%Plot
%
figure;
plot(time_vector, data_old);
hold on
plot(time_vector,meanOld_electrodes,'Linewidth',6, 'Color','k')
axis tight
line([0 0], [9 -6],'LineWidth',3, 'Color', 'k','LineStyle','--');
line([-0.1 1.1],[0 0],'LineWidth',3, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
xlabel('Time (S)')
ylabel('Amplitude')
set(gcf,'color','white')
title('Activation for Hits')
hold off
%
figure;
plot(time_vector,meanOld_electrodes,'Linewidth',6, 'Color','k')
hold on
axis tight
plot(time_vector,meanNew_electrodes,'Linewidth',6, 'Color','r')
axis tight
line([0 0], [6 -6],'LineWidth',3, 'Color', 'k','LineStyle','--');
line([-0.1 1.1],[0 0],'LineWidth',3, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
title('Old(Black) vs New(Red)')
ylabel('Amplitude')
xlabel ('Time(S)') 
set(gcf,'color','white')
hold off


%Import data for other negative condition
%
%
data_neg = T(:,2:326);
data_neg = data_neg{:,:};
meanNeg_electrodes = mean(data_neg);


%plot
figure;
plot(time_vector, data_neg);
hold on
plot(time_vector,meanNeg_electrodes,'Linewidth',6, 'Color','k')
axis tight
line([0 0], [9 -11],'LineWidth',3, 'Color', 'k','LineStyle','--');
line([-0.1 1.1],[0 0],'LineWidth',3, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
xlabel('Time (S)')
ylabel('Amplitude')
set(gcf,'color','white')
title('Activation for Negative Hits')
hold off



%plot
figure;
plot(time_vector, data_neu);
hold on
plot(time_vector,meanNeu_electrodes,'Linewidth',6, 'Color','k')
axis tight
line([0 0], [9 -11],'LineWidth',3, 'Color', 'k','LineStyle','--');
line([-0.1 1.2],[0 0],'LineWidth',3, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
xlabel('Time (S)')
ylabel('Amplitude')
set(gcf,'color','white')
title('Activation for Neutral Hits')
hold off




%plot
figure;
plot(time_vector, data_pos);
hold on
plot(time_vector,meanPos_electrodes,'Linewidth',6, 'Color','k')
axis tight
line([0 0], [9 -11],'LineWidth',3, 'Color', 'k','LineStyle','--');
line([-0.1 1.2],[0 0],'LineWidth',3, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
xlabel('Time (S)')
ylabel('Amplitude')
set(gcf,'color','white')
title('Activation for Positive Hits')
hold off
%
%
%plot comparisons
figure;
plot(time_vector,meanNew_electrodes,'Linewidth',3,'Color', [0.5 0.5 0.5],'LineStyle',':');
axis tight
hold on
plot(time_vector,meanNeg_electrodes,'Linewidth',3, 'Color','r')
axis tight
plot(time_vector,meanNeu_electrodes,'Linewidth',3, 'Color','k')
axis tight
hold on
plot(time_vector,meanPos_electrodes,'Linewidth',3, 'Color',[0 0.4470 0.7410])
axis tight
line([0 0], [5 -3],'LineWidth',3, 'Color', 'k','LineStyle','--');
line([-0.1 1.1],[0 0],'LineWidth',3, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
title( 'Grand average ERPs evoked by correctly recognized new and old objects encoded in pleasant, neutral, and unpleasant contexts')
ylabel('Amplitude')
xlabel ('Time(S)') 
set(gcf,'color','white')
legend('New','Negative','Neutral','Positive')
hold off



%plot comparisons parietal ROI
figure;
plot(time_vector,meanROIparietal_new,'Linewidth',3,'Color', [0.5 0.5 0.5],'LineStyle',':');
axis tight
hold on
plot(time_vector,meanROIparietal_neg,'Linewidth',3, 'Color','r')
axis tight
plot(time_vector,meanROIparietal_neu,'Linewidth',3, 'Color','k')
axis tight
hold on
plot(time_vector,meanROIparietal_pos,'Linewidth',3, 'Color',[0 0.4470 0.7410])
axis tight
line([0 0], [5 -3],'LineWidth',3, 'Color', 'k','LineStyle','--');
line([-0.1 1.1],[0 0],'LineWidth',3, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
title( 'Grand average ERPs evoked by correctly recognized new and old objects encoded in pleasant, neutral, and unpleasant contexts')
ylabel('Amplitude')
xlabel ('Time(S)') 
set(gcf,'color','white')
legend('New','Negative','Neutral','Positive')
hold off

%plot comparisons frontal ROI
figure;
plot(time_vector,meanROIfrontal_new,'Linewidth',3,'Color', [0.5 0.5 0.5],'LineStyle',':');
axis tight
hold on
plot(time_vector,meanROIfrontal_neg,'Linewidth',3, 'Color','r')
axis tight
plot(time_vector,meanROIfrontal_neu,'Linewidth',3, 'Color','k')
axis tight
hold on
plot(time_vector,meanROIfrontal_pos,'Linewidth',3, 'Color',[0 0.4470 0.7410])
axis tight
line([0 0], [5 -3],'LineWidth',3, 'Color', 'k','LineStyle','--');
line([-0.1 1.1],[0 0],'LineWidth',3, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
title( 'Grand average ERPs evoked by correctly recognized new and old objects encoded in pleasant, neutral, and unpleasant contexts')
ylabel('Amplitude')
xlabel ('Time(S)') 
set(gcf,'color','white')
legend('New','Negative','Neutral','Positive')
hold off

%plot comparisons N170 ROI
figure;
plot(time_vector,meanROIN170_new,'Linewidth',3,'Color', [0.5 0.5 0.5],'LineStyle',':');
axis tight
hold on
plot(time_vector,meanROIN170_neg,'Linewidth',3, 'Color','r')
axis tight
plot(time_vector,meanROIN170_neu,'Linewidth',3, 'Color','k')
axis tight
hold on
plot(time_vector,meanROIN170_pos,'Linewidth',3, 'Color',[0 0.4470 0.7410])
axis tight
line([0 0], [5 -3],'LineWidth',3, 'Color', 'k','LineStyle','--');
line([-0.1 1.1],[0 0],'LineWidth',3, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
title( 'Grand average ERPs evoked by correctly recognized new and old objects encoded in pleasant, neutral, and unpleasant contexts')
ylabel('Amplitude')
xlabel ('Time(S)') 
set(gcf,'color','white')
legend('New','Negative','Neutral','Positive')
hold off

%plot comparisons N250 ROI
figure;
plot(time_vector,meanROIN250_new,'Linewidth',3,'Color', [0.5 0.5 0.5],'LineStyle',':');
axis tight
hold on
plot(time_vector,meanROIN250_neg,'Linewidth',3, 'Color','r')
axis tight
plot(time_vector,meanROIN250_neu,'Linewidth',3, 'Color','k')
axis tight
hold on
plot(time_vector,meanROIN250_pos,'Linewidth',3, 'Color',[0 0.4470 0.7410])
axis tight
line([0 0], [5 -3],'LineWidth',3, 'Color', 'k','LineStyle','--');
line([-0.1 1.1],[0 0],'LineWidth',3, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
title( 'Grand average ERPs evoked by correctly recognized new and old objects encoded in pleasant, neutral, and unpleasant contexts')
ylabel('Amplitude')
xlabel ('Time(S)') 
set(gcf,'color','white')
legend('New','Negative','Neutral','Positive')
hold off