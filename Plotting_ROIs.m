%Val

Pos_Val = mean(dataROIval_pos);

Neg_Val = mean(dataROIval_neg);


%FN400
New_FN400 = [FC2_new;CP2_new;FC6_new];
New_FN400 = mean(New_FN400);

Old_FN400 = [FC2_old;CP2_old;FC6_old];
Old_FN400 = mean(Old_FN400);


Neg_FN400 = [FC2_neg;CP2_neg;FC6_neg];
Neg_FN400 = mean(Neg_FN400);

Pos_FN400 = [FC2_pos;CP2_pos;FC6_pos];
Pos_FN400 = mean(Pos_FN400);



%N250

New_N250 = [F7_new;F3_new;Fp1_new;Fp2_new;F4_new;F8_new];
New_N250 = mean(New_N250);

Old_N250 = [F7_old;F3_old;Fp1_old;Fp2_old;F4_old;F8_old];
Old_N250 = mean(Old_N250);

Neu_N250 = [F7_neu;F3_neu;Fp1_neu;Fp2_neu;F4_neu;F8_neu];
Neu_N250 = mean(Neu_N250);

Neg_N250 = [F7_neg;F3_neg;Fp1_neg;Fp2_neg;F4_neg;F8_neg];
Neg_N250 = mean(Neg_N250);

Pos_N250 = [F7_pos;F3_pos;Fp1_pos;Fp2_pos;F4_pos;F8_pos];
Pos_N250 = mean(Pos_N250);

Emo_N250 = [Pos_N250;Neg_N250];
Emo_N250 = mean(Emo_N250);

%LPP

New_LPP = [P3_new;CP5_new;C3_new;CP1_new];
New_LPP = mean(New_LPP);

Old_LPP = [P3_old;CP5_old;C3_old;CP1_old];
Old_LPP = mean(Old_LPP);

Neu_LPP = [P3_old;CP5_old;C3_old;CP1_old];
Neu_LPP = mean(Neu_LPP);

Neg_LPP = [P3_old;CP5_old;C3_old;CP1_old];
Neg_LPP = mean(Neg_LPP);

Pos_LPP = [P3_old;CP5_old;C3_old;CP1_old];
Pos_LPP = mean(Pos_LPP);

Emo_LPP = [Pos_LPP;Neg_LPP];
Emo_LPP = mean(Emo_LPP);

%plot
figure;
rectangle('Position',[0.15 -1.97 0.06 6],'FaceColor',[0.9, 0.9, 0.9], 'EdgeColor', [0.9, 0.9, 0.9])
hold on
plot(time_vector,New_FN400,'Linewidth',4,'Color', [0.5 0.5 0.5],'LineStyle',':');
axis tight
hold on
plot(time_vector,Neg_FN400,'Linewidth',4, 'Color','r')
axis tight
plot(time_vector,Neu_FN400,'Linewidth',4, 'Color','k')
axis tight
hold on
plot(time_vector,Pos_FN400,'Linewidth',4, 'Color',[0 0.4470 0.7410])
axis tight
line([0 0], [4 -2],'LineWidth',1, 'Color', [0.8 0.8 0.8],'LineStyle','--');
line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
title( 'Positive, neutral and negative vs. New')
ylabel('Amplitude [µV]')
xlabel ('Time [S]') 
set(gcf,'color','white')
set(gca,'TickDir','out');
set(gca,'fontname','times')
legend('New','Negative','Neutral','Positive')
hold off


figure;
rectangle('Position',[0.15 -1.97 0.06 6],'FaceColor',[0.9, 0.9, 0.9], 'EdgeColor', [0.9, 0.9, 0.9])
hold on
plot(time_vector,Emo_FN400,'Linewidth',4, 'Color','b')
axis tight
hold on
plot(time_vector,Neu_FN400,'Linewidth',4, 'Color','k')
axis tight
hold on
line([0 0], [4 -2],'LineWidth',1, 'Color', [0.8 0.8 0.8],'LineStyle','--');
line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
title( 'Emotional vs. Neutral')
ylabel('Amplitude [µV]')
xlabel ('Time [S]') 
set(gcf,'color','white')
set(gca,'TickDir','out');
set(gca,'fontname','times')
legend('Emotional','Neutral')
hold off

figure;
rectangle('Position',[0.5 -4.45 0.2 11],'FaceColor',[0.9, 0.9, 0.9], 'EdgeColor', [0.9, 0.9, 0.9])
axis tight
hold on
plot(time_vector,Pos_FN400,'Linewidth',4, 'Color',[0 0.4470 0.7410])
axis tight
hold on
plot(time_vector,Neg_FN400,'Linewidth',4, 'Color','r')
axis tight
hold on
line([0 0], [5.5 -4.5],'LineWidth',1, 'Color', [0.8 0.8 0.8],'LineStyle','--');
line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
title( 'Positive vs. Negative')
ylabel('Amplitude [µV]')
xlabel ('Time [S]') 
set(gcf,'color','white')
set(gca,'TickDir','out');
set(gca,'fontname','times')
legend('Positive','Negative')
hold off

figure;
rectangle('Position',[0.23 -2.97 0.09 7],'FaceColor',[0.9, 0.9, 0.9], 'EdgeColor', [0.9, 0.9, 0.9])
hold on
plot(time_vector,New_FN400,'Linewidth',4,'Color', [0.5 0.5 0.5],'LineStyle',':');
axis tight
hold on
plot(time_vector,Old_FN400,'Linewidth',4, 'Color','b')
axis tight
hold on
line([0 0], [4 -3],'LineWidth',1, 'Color', [0.8 0.8 0.8],'LineStyle','--');
line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
title( 'Old vs. New')
ylabel('Amplitude [µV]')
xlabel ('Time [S]') 
set(gcf,'color','white')
set(gca,'TickDir','out');
set(gca,'fontname','times')
legend('New','Old')
hold off






figure;
rectangle('Position',[0.23 -2.97 0.09 7],'FaceColor',[0.9, 0.9, 0.9], 'EdgeColor', [0.9, 0.9, 0.9])
hold on
plot(time_vector,New_N250,'Linewidth',4,'Color', [0.5 0.5 0.5],'LineStyle',':');
axis tight
hold on
plot(time_vector,Old_N250,'Linewidth',4, 'Color','b')
axis tight
hold on
line([0 0], [4 -3],'LineWidth',1, 'Color', [0.8 0.8 0.8],'LineStyle','--');
line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
title( 'Old vs. New')
ylabel('Amplitude [µV]')
xlabel ('Time [S]') 
set(gcf,'color','white')
set(gca,'TickDir','out');
set(gca,'fontname','times')
legend('New','Old')
hold off


figure;
rectangle('Position',[0.23 -3.97 0.09 9],'FaceColor',[0.9, 0.9, 0.9], 'EdgeColor', [0.9, 0.9, 0.9])
hold on
plot(time_vector,New_N250,'Linewidth',4,'Color', [0.5 0.5 0.5],'LineStyle',':');
axis tight
hold on
plot(time_vector,Neu_N250,'Linewidth',4, 'Color','k')
axis tight
hold on
line([0 0], [5 -4],'LineWidth',1, 'Color', [0.8 0.8 0.8],'LineStyle','--');
line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
title( 'Neutral vs. New')
ylabel('Amplitude [µV]')
xlabel ('Time [S]') 
set(gcf,'color','white')
set(gca,'TickDir','out');
set(gca,'fontname','times')
legend('New','Neutral')
hold off

figure;
rectangle('Position',[0.23 -3.97 0.09 9],'FaceColor',[0.9, 0.9, 0.9], 'EdgeColor', [0.9, 0.9, 0.9])
hold on
plot(time_vector,Emo_N250,'Linewidth',4,'Color', 'r');
axis tight
hold on
plot(time_vector,Neu_N250,'Linewidth',4, 'Color','k')
axis tight
hold on
line([0 0], [5 -4],'LineWidth',1, 'Color', [0.8 0.8 0.8],'LineStyle','--');
line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
title( 'Emotional vs. Neutral')
ylabel('Amplitude [µV]')
xlabel ('Time [S]') 
set(gcf,'color','white')
set(gca,'TickDir','out');
set(gca,'fontname','times')
legend('Emotional','Neutral')
hold off


figure;
rectangle('Position',[0.7 -2.97 0.3 8],'FaceColor',[0.9, 0.9, 0.9], 'EdgeColor', [0.9, 0.9, 0.9])
hold on
plot(time_vector,New_LPP,'Linewidth',4,'Color', [0.5 0.5 0.5],'LineStyle',':');
axis tight
hold on
plot(time_vector,Old_LPP,'Linewidth',4, 'Color','b')
axis tight
hold on
line([0 0], [5 -3],'LineWidth',1, 'Color', [0.8 0.8 0.8],'LineStyle','--');
line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
title( 'Old vs. New')
ylabel('Amplitude [µV]')
xlabel ('Time [S]') 
set(gcf,'color','white')
set(gca,'TickDir','out');
set(gca,'fontname','times')
legend('New','Old')
hold off


figure;
rectangle('Position',[0.7 -2.97 0.3 8],'FaceColor',[0.9, 0.9, 0.9], 'EdgeColor', [0.9, 0.9, 0.9])
hold on
plot(time_vector,New_LPP,'Linewidth',4,'Color', [0.5 0.5 0.5],'LineStyle',':');
axis tight
hold on
plot(time_vector,Neu_LPP,'Linewidth',4, 'Color','k')
axis tight
hold on
line([0 0], [5 -3],'LineWidth',1, 'Color', [0.8 0.8 0.8],'LineStyle','--');
line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
title( 'Neutral vs. New')
ylabel('Amplitude [µV]')
xlabel ('Time [S]') 
set(gcf,'color','white')
set(gca,'TickDir','out');
set(gca,'fontname','times')
legend('New','Neutral')
hold off

figure;
rectangle('Position',[0.15 -1.97 0.06 6],'FaceColor',[0.9, 0.9, 0.9], 'EdgeColor', [0.9, 0.9, 0.9])
hold on
plot(time_vector,Neg_Val,'Linewidth',4, 'Color','b')
axis tight
hold on
plot(time_vector,Pos_Val,'Linewidth',4, 'Color','k')
axis tight
hold on
line([0 0], [4 -2],'LineWidth',1, 'Color', [0.8 0.8 0.8],'LineStyle','--');
line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
title( 'Negative vs. Positive')
ylabel('Amplitude [µV]')
xlabel ('Time [S]') 
set(gcf,'color','white')
set(gca,'TickDir','out');
set(gca,'fontname','times')
legend('Negative','Positive')
hold off
