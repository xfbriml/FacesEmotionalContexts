figure;
        subplot(5,4,1)
        plot(time_vector,F7_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,F7_pos, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('F7')
        subplot(5,4,2)
        plot(time_vector,F3_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,F3_pos, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('F3')
        subplot(5,4,3)
        plot(time_vector,F4_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,F4_pos, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('F4')
        subplot(5,4,4)
        plot(time_vector,F8_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,F8_pos, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('F8')
        subplot(5,4,5)
        plot(time_vector,FC5_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,FC5_pos, 'Linewidth',1, 'Color','k')
        hold on
        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('FC5')
        subplot(5,4,6)
        plot(time_vector,FC1_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,FC1_pos, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('FC1')
        subplot(5,4,7)
        plot(time_vector,FC2_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,FC2_pos, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('FC2')
        subplot(5,4,8)
        plot(time_vector,FC6_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,FC6_pos, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('FC6')
        subplot(5,4,9)
        plot(time_vector,T7_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,T7_pos, 'Linewidth',1, 'Color','k')
        hold on
        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('T7')
        
        
        subplot(5,4,10)
        plot(time_vector,C3_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,C3_pos, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('C3')
        subplot(5,4,11)
        plot(time_vector,C4_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,C4_pos, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('C4')
        subplot(5,4,12)
        plot(time_vector,T8_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,T8_pos, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('T8')
        subplot(5,4,13)
        plot(time_vector,CP5_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,CP5_pos, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('CP5')
        subplot(5,4,14)
        plot(time_vector,CP1_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,CP1_pos, 'Linewidth',1, 'Color','k')
        hold on
        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('CP1')
        subplot(5,4,15)
        plot(time_vector,CP2_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,CP2_pos, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('CP2')
        subplot(5,4,16)
        plot(time_vector,CP6_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,CP6_pos, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('CP6')
        subplot(5,4,17)
        plot(time_vector,P7_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,P7_pos, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('P7')
        subplot(5,4,18)
        plot(time_vector,P3_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,P3_pos, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('P3')

 subplot(5,4,19)
        plot(time_vector,P4_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,P4_pos, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('P4')
        subplot(5,4,20)
        plot(time_vector,P8_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,P8_pos, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        title('P8')
       



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%topoplot
dat1 = mean_pos200_300';
dat2 = mean_pos300_500';
dat3 = mean_pos500_800';
dat4 = mean_pos800_1100';
dat5 = mean_neg200_300';
dat6 = mean_neg300_500';
dat7 = mean_neg500_800';
dat8 = mean_neg800_1100';


figure;
subplot(441)
topoplot(dat5-dat1,'AllElectrodesposition.locs');
title('200 - 300')
cbar('horiz',0,[-1 1]*max(abs(dat5-dat1)));
hold on
subplot(442)
topoplot(dat6-dat2,'AllElectrodesposition.locs');
title('300 - 500')
cbar('horiz',0,[-1 1]*max(abs(dat6-dat2)));
hold on
subplot(443)
topoplot(dat7-dat3,'AllElectrodesposition.locs');
title('500 - 800')
cbar('horiz',0,[-1 1]*max(abs(dat7-dat3)));
hold on
subplot(444)
topoplot(dat8-dat4,'AllElectrodesposition.locs');
title('800 - 1100')





dat5 = mean_neu200_300';
dat6 = mean_neu300_500';
dat7 = mean_neu500_800';
dat8 = mean_neu800_1100';
%'horiz',0,[-1 1]*max(abs(dat5-dat1))
subplot(445)
topoplot(dat5-dat1,'AllElectrodesposition.locs');
hold on

subplot(446)
topoplot(dat6-dat2,'AllElectrodesposition.locs');

subplot(448)
topoplot(dat8-dat4,'AllElectrodesposition.locs');


dat5 = mean_neg200_300';
dat6 = mean_neg300_500';
dat7 = mean_neg500_800';
dat8 = mean_neg800_1100';

subplot(449)
topoplot(dat5-dat1,'AllElectrodesposition.locs');


dat5 = mean_neg800_1100';
data1 = mean_pos800_1100';


subplot(4,4,16)
topoplot(dat5-dat1,'AllElectrodesposition.locs');


%selected















