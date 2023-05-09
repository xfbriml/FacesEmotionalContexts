% parietal cluster

Parietal_New = [ CP5_new; CP1_new; P3_new; P7_new; P4_new; P8_new; CP6_new; CP2_new; ]
meanParietalNew = mean(Parietal_New);

Parietal_Neg = [ CP5_neg; CP1_neg; P3_neg; P7_neg; P4_neg; P8_neg; CP6_neg; CP2_neg; ]
meanParietalNeg = mean(Parietal_Neg);

Parietal_Neu = [ CP5_neu; CP1_neu; P3_neu; P7_neu; P4_neu; P8_neu; CP6_neu; CP2_neu; ]
meanParietalNeu = mean(Parietal_Neu);

Parietal_Pos = [ CP5_pos; CP1_pos; P3_pos; P7_pos; P4_pos; P8_pos; CP6_pos; CP2_pos; ]
meanParietalPos = mean(Parietal_Pos);

Parietal_Old = [Parietal_Pos ; Parietal_Neu ; Parietal_Neg];
meanParietalOld = mean(Parietal_Old);

figure;
plot(time_vector,meanParietalNew,'Linewidth',3,'Color', [0.5 0.5 0.5],'LineStyle',':');
axis tight
hold on
plot(time_vector,meanParietalNeg,'Linewidth',3, 'Color','r')
axis tight
plot(time_vector,meanParietalNeu,'Linewidth',3, 'Color','k')
axis tight
hold on
plot(time_vector,meanParietalPos,'Linewidth',3, 'Color',[0 0.4470 0.7410])
axis tight
line([0 0], [10 -6],'LineWidth',3, 'Color', 'k','LineStyle','--');
line([-0.1 1.1],[0 0],'LineWidth',3, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
title( 'Grand average ERPs evoked by correctly recognized new and old objects encoded in pleasant, neutral, and unpleasant contexts on the Parietal electrode cluster')
ylabel('Amplitude')
xlabel ('Time(S)') 
set(gcf,'color','white')
legend('New','Negative','Neutral','Positive')
hold off



figure;
plot(time_vector,meanParietalOld,'Linewidth',6, 'Color','k')
hold on
axis tight
plot(time_vector,meanParietalNew,'Linewidth',6, 'Color','r')
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

figure;
plot(time_vector,T7_old,'Linewidth',6, 'Color','k')
hold on
axis tight
plot(time_vector,T7_new,'Linewidth',6, 'Color','r')
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



%%%%
%Left Parietal


LeftParietal_New = [ CP5_new; P3_new; Pz_new]
meanLeftParietalNew = mean(LeftParietal_New);

LeftParietal_Neg = [ CP5_neg; P3_neg; Pz_neg]
meanLeftParietalNeg = mean(LeftParietal_Neg);

LeftParietal_Neu = [ CP5_neu; P3_neu; Pz_neu]
meanLeftParietalNeu = mean(LeftParietal_Neu);

LeftParietal_Pos = [ CP5_pos; P3_pos; Pz_pos]
meanLeftParietalPos = mean(LeftParietal_Pos);

LeftParietal_Old = [LeftParietal_Pos ; LeftParietal_Neu ; LeftParietal_Neg];
meanLeftParietalOld = mean(LeftParietal_Old);

figure;
plot(time_vector,meanLeftParietalNew,'Linewidth',3,'Color', [0.5 0.5 0.5],'LineStyle',':');
axis tight
hold on
plot(time_vector,meanLeftParietalNeg,'Linewidth',3, 'Color','r')
axis tight
plot(time_vector,meanLeftParietalNeu,'Linewidth',3, 'Color','k')
axis tight
hold on
plot(time_vector,meanLeftParietalPos,'Linewidth',3, 'Color',[0 0.4470 0.7410])
axis tight
line([0 0], [10 -6],'LineWidth',3, 'Color', 'k','LineStyle','--');
line([-0.1 1.1],[0 0],'LineWidth',3, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
title( 'Grand average ERPs evoked by correctly recognized new and old objects encoded in pleasant, neutral, and unpleasant contexts on the Parietal electrode cluster')
ylabel('Amplitude')
xlabel ('Time(S)') 
set(gcf,'color','white')
legend('New','Negative','Neutral','Positive')
hold off



figure;
plot(time_vector,meanLeftParietalOld,'Linewidth',6, 'Color','k')
hold on
axis tight
plot(time_vector,meanLeftParietalNew,'Linewidth',6, 'Color','r')
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

%Left frontal


LeftFrontal_New = [Fz_new; FC5_new; FC1_new; F7_new; F3_new; Fp1_new; FT9_new]
meanLeftFrontalNew = mean(LeftFrontal_New);

LeftFrontal_Neg = [Fz_neg; FC5_neg; FC1_neg; F7_neg; F3_neg; Fp1_neg; FT9_neg]
meanLeftFrontalNeg = mean(LeftFrontal_Neg);

LeftFrontal_Neu = [Fz_neu; FC5_neu; FC1_neu; F7_neu; F3_neu; Fp1_neu; FT9_neu]
meanLeftFrontalNeu = mean(LeftFrontal_Neu);

LeftFrontal_Pos = [Fz_pos; FC5_pos; FC1_pos; F7_pos; F3_pos; Fp1_pos; FT9_pos]
meanLeftFrontalPos = mean(LeftFrontal_Pos);

LeftFrontal_Old = [LeftFrontal_Pos ; LeftFrontal_Neu ; LeftFrontal_Neg];
meanLeftFrontalOld = mean(LeftFrontal_Old);


figure;
plot(time_vector,meanLeftFrontalNew,'Linewidth',3,'Color', [0.5 0.5 0.5],'LineStyle',':');
axis tight
hold on
plot(time_vector,meanLeftFrontalNeg,'Linewidth',3, 'Color','r')
axis tight
plot(time_vector,meanLeftFrontalNeu,'Linewidth',3, 'Color','k')
axis tight
hold on
plot(time_vector,meanLeftFrontalPos,'Linewidth',3, 'Color',[0 0.4470 0.7410])
axis tight
line([0 0], [10 -6],'LineWidth',3, 'Color', 'k','LineStyle','--');
line([-0.1 1.1],[0 0],'LineWidth',3, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
title( 'Grand average ERPs evoked by correctly recognized new and old objects encoded in pleasant, neutral, and unpleasant contexts on the Parietal electrode cluster')
ylabel('Amplitude')
xlabel ('Time(S)') 
set(gcf,'color','white')
legend('New','Negative','Neutral','Positive')
hold off




figure;
plot(time_vector,meanLeftFrontalOld,'Linewidth',6, 'Color','k')
hold on
axis tight
plot(time_vector,meanLeftFrontalNew,'Linewidth',6, 'Color','r')
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

%midfrontal nheeee

MidFrontal_New = [Fp1_new; Fp2_new; Fz_new]
meanMidFrontalNew = mean(MidFrontal_New);

MidFrontal_Neg = [Fp1_neg; Fp2_neg; Fz_new]
meanMidFrontalNeg = mean(MidFrontal_Neg);

MidFrontal_Neu = [Fp1_neu; Fp2_neu; Fz_neu]
meanMidFrontalNeu = mean(MidFrontal_Neu);

MidFrontal_Pos = [Fp1_pos; Fp2_pos; Fz_pos]
meanMidFrontalPos = mean(MidFrontal_Pos);

MidFrontal_Old = [MidFrontal_Pos ; MidFrontal_Neu ; MidFrontal_Neg];
meanMidFrontalOld = mean(MidFrontal_Old);


figure;
plot(time_vector,meanMidFrontalOld,'Linewidth',6, 'Color','k')
hold on
axis tight
plot(time_vector,meanMidFrontalNew,'Linewidth',6, 'Color','r')
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



% frontal cluster todos os elec frontais
Frontal_New = [AFz_new; Fp1_new; Fp2_new; Fz_new; F7_new; FT9_new; FC1_new; FC5_new; FC2_new; FC6_new; F8_new; F3_new; F4_new; FT10_new]
meanFrontalNew = mean(Frontal_New);

Frontal_Neg = [AFz_neg; Fp1_neg; Fp2_neg; Fz_neg; F7_neg; FT9_neg; FC1_neg; FC5_neg; FC2_neg; FC6_neg; F8_neg; F3_neg; F4_neg; FT10_neg]
meanFrontalNeg = mean(Frontal_Neg);

Frontal_Neu = [AFz_neu; Fp1_neu; Fp2_neu; Fz_neu; F7_neu; FT9_neu; FC1_neu; FC5_neu; FC2_neu; FC6_neu; F8_neu; F3_neu; F4_neu; FT10_neu]
meanFrontalNeu = mean(Frontal_Neu);

Frontal_Pos = [AFz_pos; Fp1_pos; Fp2_pos; Fz_pos; F7_pos; FT9_pos; FC1_pos; FC5_pos; FC2_pos; FC6_pos; F8_pos; F3_pos; F4_pos; FT10_pos]
meanFrontalPos = mean(Frontal_Pos);

Frontal_Old = [Frontal_Pos ; Frontal_Neu ; Frontal_Neg];
meanFrontalOld = mean(Frontal_Old);


figure;
plot(time_vector,meanFrontalNew,'Linewidth',3,'Color', [0.5 0.5 0.5],'LineStyle',':');
axis tight
hold on
plot(time_vector,meanFrontalNeg,'Linewidth',3, 'Color','r')
axis tight
plot(time_vector,meanFrontalNeu,'Linewidth',3, 'Color','k')
axis tight
hold on
plot(time_vector,meanFrontalPos,'Linewidth',3, 'Color',[0 0.4470 0.7410])
axis tight
line([0 0], [10 -6],'LineWidth',3, 'Color', 'k','LineStyle','--');
line([-0.1 1.1],[0 0],'LineWidth',3, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
title( 'Grand average ERPs evoked by correctly recognized new and old objects encoded in pleasant, neutral, and unpleasant contexts on the Frontal electrode cluster')
ylabel('Amplitude')
xlabel ('Time(S)') 
set(gcf,'color','white')
legend('New','Negative','Neutral','Positive')
hold off




figure;
plot(time_vector,meanFrontalOld,'Linewidth',6, 'Color','k')
hold on
axis tight
plot(time_vector,meanFrontalNew,'Linewidth',6, 'Color','r')
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






% old/new

%HUUUGE old/new

        figure;
        subplot(5,6,1)
        plot(time_vector,F7_old, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,F7_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.15 0.15], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        
        title('F7')
        subplot(5,6,2)
        plot(time_vector,Fp1_old, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,Fp1_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.15 0.15], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('Fp1')
        subplot(5,6,3)
        plot(time_vector,AFz_old, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,AFz_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.15 0.15], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('AFz')
        subplot(5,6,4)
        plot(time_vector,Fz_old, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,Fz_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.15 0.15], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('Fz')
        subplot(5,6,5)
        plot(time_vector,Fp2_old, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,Fp2_new, 'Linewidth',1, 'Color','k')
        hold on
        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.15 0.15], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('Fp2')
        subplot(5,6,6)
        plot(time_vector,F8_old, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,F8_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.15 0.15], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('F8')
        subplot(5,6,7)
        plot(time_vector,FT9_old, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,FT9_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.15 0.15], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('FT9')
        subplot(5,6,8)
        plot(time_vector,FC5_old, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,FC5_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.15 0.15], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('FC5')
        subplot(5,6,9)
        plot(time_vector,F3_old, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,F3_new, 'Linewidth',1, 'Color','k')
        hold on
        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.15 0.15], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('F3')
        
        
        subplot(5,6,10)
        plot(time_vector,F4_old, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,F4_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.15 0.15], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('F4')
        subplot(5,6,11)
        plot(time_vector,FC6_old, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,FC6_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.15 0.15], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('FC6')
        subplot(5,6,12)
        plot(time_vector,FT10_old, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,FT10_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.15 0.15], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('FT10')
        subplot(5,6,13)
        plot(time_vector,T7_old, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,T7_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.15 0.15], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('T7')
        subplot(5,6,14)
        plot(time_vector,C3_old, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,C3_new, 'Linewidth',1, 'Color','k')
        hold on
        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.15 0.15], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('C3')
        subplot(5,6,15)
        plot(time_vector,FC1_old, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,FC1_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.15 0.15], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('FC1')
        subplot(5,6,16)
        plot(time_vector,FC2_old, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,FC2_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.15 0.15], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('FC2')
        subplot(5,6,17)
        plot(time_vector,C4_old, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,C4_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.15 0.15], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('C4')
        subplot(5,6,18)
        plot(time_vector,T8_old, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,T8_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.15 0.15], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('T8')

 subplot(5,6,19)
        plot(time_vector,CP5_old, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,CP5_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.15 0.15], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('CP5')
        subplot(5,6,20)
        plot(time_vector,CP1_old, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,CP1_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.15 0.15], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('CP1')
       
        subplot(5,6,21)
        plot(time_vector,Pz_old, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,Pz_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.15 0.15], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('Pz')
        
        subplot(5,6,22)
        plot(time_vector,Oz_old, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,Oz_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.15 0.15], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('Oz')

        subplot(5,6,23)
        plot(time_vector,CP2_old, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,CP2_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.15 0.15], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('CP2')
        
        subplot(5,6,24)
        plot(time_vector,CP6_old, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,CP6_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.15 0.15], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('CP6')
        
        subplot(5,6,25)
        plot(time_vector,P7_old, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,P7_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.15 0.15], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('P7')
        
        subplot(5,6,26)
        plot(time_vector,P3_old, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,P3_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.15 0.15], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('P3')
        
        subplot(5,6,27)
        plot(time_vector,O1_old, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,O1_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.15 0.15], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('O1')

        subplot(5,6,28)
        plot(time_vector,O2_old, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,O2_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.15 0.15], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('O2')
        
        subplot(5,6,29)
        plot(time_vector,P4_old, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,P4_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.15 0.15], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('P4')
        
        subplot(5,6,30)
        plot(time_vector,P8_old, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,P8_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.15 0.15], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('P8')
        

        
        
        
        
        figure;
subplot(3,3,1)
plot(time_vector,F3_old, 'Linewidth',2, 'Color','k')
hold on
plot(time_vector,F3_new, 'Linewidth',1, 'Color','k')
hold on
axis tight
axis off
box off
line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([-0.1 1.2],[0 0],'LineWidth',1, 'Color', 'k');
subplot(3,3,2)
plot(time_vector,Fz_old, 'Linewidth',2, 'Color','k')
hold on
plot(time_vector,Fz_new, 'Linewidth',1, 'Color','k')
hold on
axis tight
axis off
box off
line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([-0.1 1.2],[0 0],'LineWidth',1, 'Color', 'k');
subplot(3,3,3)
plot(time_vector,F4_old, 'Linewidth',2, 'Color','k')
hold on
plot(time_vector,F4_new, 'Linewidth',1, 'Color','k')
hold on
axis tight
axis off
box off
line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([-0.1 1.2],[0 0],'LineWidth',1, 'Color', 'k');


subplot(3,3,4)
plot(time_vector,C3_old, 'Linewidth',2, 'Color','k')
hold on
plot(time_vector,C3_new, 'Linewidth',1, 'Color','k')
hold on
axis tight
axis off
box off
line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([-0.1 1.2],[0 0],'LineWidth',1, 'Color', 'k');
subplot(3,3,5)
plot(time_vector,Cz_old, 'Linewidth',2, 'Color','k')
hold on
plot(time_vector,Cz_new, 'Linewidth',1, 'Color','k')
hold on
axis tight
axis off
box off
line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([-0.1 1.2],[0 0],'LineWidth',1, 'Color', 'k');
subplot(3,3,6)
plot(time_vector,C4_old, 'Linewidth',2, 'Color','k')
hold on
plot(time_vector,C4_new, 'Linewidth',1, 'Color','k')
hold on
axis tight
axis off
box off
line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([-0.1 1.2],[0 0],'LineWidth',1, 'Color', 'k');

subplot(3,3,7)
plot(time_vector,P3_old, 'Linewidth',2, 'Color','k')
hold on
plot(time_vector,P3_new, 'Linewidth',1, 'Color','k')
hold on
axis tight
axis off
box off
line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([-0.1 1.2],[0 0],'LineWidth',1, 'Color', 'k');
subplot(3,3,8)
plot(time_vector,Pz_old, 'Linewidth',2, 'Color','k')
hold on
plot(time_vector,Pz_new, 'Linewidth',1, 'Color','k')
hold on
axis tight
axis off
box off
line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([-0.1 1.2],[0 0],'LineWidth',1, 'Color', 'k');
subplot(3,3,9)
plot(time_vector,P4_old, 'Linewidth',2, 'Color','k')
hold on
plot(time_vector,P4_new, 'Linewidth',1, 'Color','k')
hold on
axis tight
axis off
box off
line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([-0.1 1.2],[0 0],'LineWidth',1, 'Color', 'k');











%HUUUUUGE emo/neu

        figure;
        subplot(5,4,1)
        plot(time_vector,F7_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,F7_neu, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'Linewidth',1, 'Color', 'k');
        title('F7')
        subplot(5,4,2)
        plot(time_vector,F3_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,F3_neu, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'Linewidth',1, 'Color', 'k');
        title('F3')
        subplot(5,4,3)
        plot(time_vector,F4_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,F4_neu, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'Linewidth',1, 'Color', 'k');
        title('F4')
        subplot(5,4,4)
        plot(time_vector,F8_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,F8_neu, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'Linewidth',1, 'Color', 'k');
        title('F8')
        subplot(5,4,5)
        plot(time_vector,FC5_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,FC5_neu, 'Linewidth',1, 'Color','k')
        hold on
        axis off
        box off
        line([0 0], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'Linewidth',1, 'Color', 'k');
        title('FC5')
        subplot(5,4,6)
        plot(time_vector,FC1_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,FC1_neu, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'Linewidth',1, 'Color', 'k');
        title('FC1')
        subplot(5,4,7)
        plot(time_vector,FC2_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,FC2_neu, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'Linewidth',1, 'Color', 'k');
        title('FC2')
        subplot(5,4,8)
        plot(time_vector,FC6_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,FC6_neu, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'Linewidth',1, 'Color', 'k');
        title('FC6')
        subplot(5,4,9)
        plot(time_vector,T7_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,T7_neu, 'Linewidth',1, 'Color','k')
        hold on
        axis off
        box off
        line([0 0], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'Linewidth',1, 'Color', 'k');
        title('T7')
        
        
        subplot(5,4,10)
        plot(time_vector,C3_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,C3_neu, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'Linewidth',1, 'Color', 'k');
        title('C3')
        subplot(5,4,11)
        plot(time_vector,C4_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,C4_neu, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'Linewidth',1, 'Color', 'k');
        title('C4')
        subplot(5,4,12)
        plot(time_vector,T8_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,T8_neu, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'Linewidth',1, 'Color', 'k');
        title('T8')
        subplot(5,4,13)
        plot(time_vector,CP5_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,CP5_neu, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'Linewidth',1, 'Color', 'k');
        title('CP5')
        subplot(5,4,14)
        plot(time_vector,CP1_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,CP1_neu, 'Linewidth',1, 'Color','k')
        hold on
        axis off
        box off
        line([0 0], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'Linewidth',1, 'Color', 'k');
        title('CP1')
        subplot(5,4,15)
        plot(time_vector,CP2_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,CP2_neu, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'Linewidth',1, 'Color', 'k');
        title('CP2')
        subplot(5,4,16)
        plot(time_vector,CP6_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,CP6_neu, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'Linewidth',1, 'Color', 'k');
        title('CP6')
        subplot(5,4,17)
        plot(time_vector,P7_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,P7_neu, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'Linewidth',1, 'Color', 'k');
        title('P7')
        subplot(5,4,18)
        plot(time_vector,P3_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,P3_neu, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'Linewidth',1, 'Color', 'k');
        title('P3')

 subplot(5,4,19)
        plot(time_vector,P4_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,P4_neu, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'Linewidth',1, 'Color', 'k');
        title('P4')
        subplot(5,4,20)
        plot(time_vector,P8_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,P8_neu, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'Linewidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'Linewidth',1, 'Color', 'k');
        title('P8')
       



%emo, neu e CR

figure;
plot(time_vector,P3_emo, 'Linewidth',2, 'Color','k')
hold on
plot(time_vector,P3_neu, 'Linewidth',1, 'Color','k')
hold on
axis tight
axis off
box off
line([0 0], [1.5 -1.5],'LineWidth',2, 'Color', 'k');
line([0.8 0.8], [1.5 -1.5],'LineWidth',2, 'Color', 'k');
line([-0.1 1.2],[0 0],'LineWidth',2, 'Color', 'k');


figure;
subplot(3,3,1)
plot(time_vector,F3_emo, 'Linewidth',2, 'Color','k')
hold on
plot(time_vector,F3_neu, 'Linewidth',1, 'Color','k')
hold on
axis tight
axis off
box off
line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([-0.1 1.2],[0 0],'LineWidth',1, 'Color', 'k');
subplot(3,3,2)
plot(time_vector,Fz_emo, 'Linewidth',2, 'Color','k')
hold on
plot(time_vector,Fz_neu, 'Linewidth',1, 'Color','k')
hold on
axis tight
axis off
box off
line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([-0.1 1.2],[0 0],'LineWidth',1, 'Color', 'k');
subplot(3,3,3)
plot(time_vector,F4_emo, 'Linewidth',2, 'Color','k')
hold on
plot(time_vector,F4_neu, 'Linewidth',1, 'Color','k')
hold on
axis tight
axis off
box off
line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([-0.1 1.2],[0 0],'LineWidth',1, 'Color', 'k');


subplot(3,3,4)
plot(time_vector,C3_emo, 'Linewidth',2, 'Color','k')
hold on
plot(time_vector,C3_neu, 'Linewidth',1, 'Color','k')
hold on
axis tight
axis off
box off
line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([-0.1 1.2],[0 0],'LineWidth',1, 'Color', 'k');

subplot(3,3,5)
plot(time_vector,Cz_emo, 'Linewidth',2, 'Color','k')
hold on
plot(time_vector,Cz_neu, 'Linewidth',1, 'Color','k')
hold on
axis tight
axis off
box off
line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([-0.1 1.2],[0 0],'LineWidth',1, 'Color', 'k');

subplot(3,3,6)
plot(time_vector,C4_emo, 'Linewidth',2, 'Color','k')
hold on
plot(time_vector,C4_neu, 'Linewidth',1, 'Color','k')
hold on
axis tight
axis off
box off
line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([-0.1 1.2],[0 0],'LineWidth',1, 'Color', 'k');

subplot(3,3,7)
plot(time_vector,P3_emo, 'Linewidth',2, 'Color','k')
hold on
plot(time_vector,P3_neu, 'Linewidth',1, 'Color','k')
hold on
axis tight
axis off
box off
line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([-0.1 1.2],[0 0],'LineWidth',1, 'Color', 'k');
subplot(3,3,8)
plot(time_vector,Pz_emo, 'Linewidth',2, 'Color','k')
hold on
plot(time_vector,Pz_neu, 'Linewidth',1, 'Color','k')
hold on
axis tight
axis off
box off
line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([-0.1 1.2],[0 0],'LineWidth',1, 'Color', 'k');
subplot(3,3,9)
plot(time_vector,P4_emo, 'Linewidth',2, 'Color','k')
hold on
plot(time_vector,P4_neu, 'Linewidth',1, 'Color','k')
hold on
axis tight
axis off
box off
line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([-0.1 1.2],[0 0],'LineWidth',1, 'Color', 'k');


%pos neg  cr

figure;
plot(time_vector,C3_neg, 'Linewidth',2, 'Color','k')
hold on
plot(time_vector,C3_pos, 'Linewidth',1, 'Color','k')
hold on
plot(time_vector,C3_new, 'Linewidth',2, 'Color','k', 'LineStyle', ':')
axis tight
axis off
box off
line([0 0], [1.5 -1.5],'LineWidth',2, 'Color', 'k');
line([0.8 0.8], [1.5 -1.5],'LineWidth',2, 'Color', 'k');
line([-0.1 1.2],[0 0],'LineWidth',2, 'Color', 'k');


figure;
subplot(3,3,1)
plot(time_vector,F3_neg, 'Linewidth',2, 'Color','k')
hold on
plot(time_vector,F3_pos, 'Linewidth',1, 'Color','k')
hold on
plot(time_vector,F3_new, 'Linewidth',2, 'Color','k', 'LineStyle', ':')
hold on
axis tight
axis off
box off
line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([-0.1 1.2],[0 0],'LineWidth',1, 'Color', 'k');
subplot(3,3,2)
plot(time_vector,Fz_neg, 'Linewidth',2, 'Color','k')
hold on
plot(time_vector,Fz_pos, 'Linewidth',1, 'Color','k')
hold on
hold on
plot(time_vector,Fz_new, 'Linewidth',2, 'Color','k', 'LineStyle', ':')
axis tight
axis off
box off
line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([-0.1 1.2],[0 0],'LineWidth',1, 'Color', 'k');
subplot(3,3,3)
plot(time_vector,F4_neg, 'Linewidth',2, 'Color','k')
hold on
plot(time_vector,F4_pos, 'Linewidth',1, 'Color','k')
hold on
hold on
plot(time_vector,F4_new, 'Linewidth',2, 'Color','k', 'LineStyle', ':')
axis tight
axis off
box off
line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([-0.1 1.2],[0 0],'LineWidth',1, 'Color', 'k');


subplot(3,3,4)
plot(time_vector,C3_neg, 'Linewidth',2, 'Color','k')
hold on
plot(time_vector,C3_pos, 'Linewidth',1, 'Color','k')
hold on
hold on
plot(time_vector,C3_new, 'Linewidth',2, 'Color','k', 'LineStyle', ':')
axis tight
axis off
box off
line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([-0.1 1.2],[0 0],'LineWidth',1, 'Color', 'k');
subplot(3,3,5)
plot(time_vector,Cz_neg, 'Linewidth',2, 'Color','k')
hold on
plot(time_vector,Cz_pos, 'Linewidth',1, 'Color','k')
hold on
plot(time_vector,Cz_new, 'Linewidth',2, 'Color','k', 'LineStyle', ':')
axis tight
axis off
box off
line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([-0.1 1.2],[0 0],'LineWidth',1, 'Color', 'k');
subplot(3,3,6)
plot(time_vector,C4_neg, 'Linewidth',2, 'Color','k')
hold on
plot(time_vector,C4_pos, 'Linewidth',1, 'Color','k')
hold on
hold on
plot(time_vector,C4_new, 'Linewidth',2, 'Color','k', 'LineStyle', ':')
axis tight
axis off
box off
line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([-0.1 1.2],[0 0],'LineWidth',1, 'Color', 'k');

subplot(3,3,7)
plot(time_vector,P3_neg, 'Linewidth',2, 'Color','k')
hold on
plot(time_vector,P3_pos, 'Linewidth',1, 'Color','k')
hold on
hold on
plot(time_vector,P3_new, 'Linewidth',2, 'Color','k', 'LineStyle', ':')
axis tight
axis off
box off
line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([-0.1 1.2],[0 0],'LineWidth',1, 'Color', 'k');
subplot(3,3,8)
plot(time_vector,Pz_neg, 'Linewidth',2, 'Color','k')
hold on
plot(time_vector,Pz_pos, 'Linewidth',1, 'Color','k')
hold on
hold on
plot(time_vector,Pz_new, 'Linewidth',2, 'Color','k', 'LineStyle', ':')
axis tight
axis off
box off
line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([-0.1 1.2],[0 0],'LineWidth',1, 'Color', 'k');
subplot(3,3,9)
plot(time_vector,P4_neg, 'Linewidth',2, 'Color','k')
hold on
plot(time_vector,P4_pos, 'Linewidth',1, 'Color','k')
hold on
plot(time_vector,P4_new, 'Linewidth',2, 'Color','k', 'LineStyle', ':')
axis tight
axis off
box off
line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
line([-0.1 1.2],[0 0],'LineWidth',1, 'Color', 'k');


 Cz =[CP1; CP2];
Cz = mean(Cz);

F3_emo = F3 
Fz_emo = Fz
F4_emo = F4
C3_emo = C3
Cz_emo = Cz
C4_emo = C4
P3_emo = P3
Pz_emo = Pz
P4_emo = P4
    