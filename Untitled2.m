figure;
        subplot(3,6,1)
        plot(time_vector,F7_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,F7_neu, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1 -1],'LineWidth',1, 'Color', 'k');
       ylim([-6, 8]);
       
        title('F7')

        subplot(3,6,2)
        plot(time_vector,F3_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,F3_neu, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1 -1],'LineWidth',1, 'Color', 'k');
        title('F3')
        ylim([-6, 8]);
        subplot(3,6,3)
        plot(time_vector,FC1_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,FC1_neu, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1 -1],'LineWidth',1, 'Color', 'k');
        title('FC1')
        ylim([-6, 8]);
        subplot(3,6,4)
        plot(time_vector,FC2_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,FC2_neu, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
       line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1 -1],'LineWidth',1, 'Color', 'k');
        ylim([-6, 8]);
        title('FC2')
        subplot(3,6,5)
        plot(time_vector,F4_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,F4_neu, 'Linewidth',1, 'Color','k')
        hold on
        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1 -1],'LineWidth',1, 'Color', 'k');
        ylim([-6, 8]);
        title('F4')
        subplot(3,6,6)
        plot(time_vector,F8_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,F8_neu, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1 -1],'LineWidth',1, 'Color', 'k');
        ylim([-6, 8]);
        title('F8')
        subplot(3,6,7)
        plot(time_vector,T7_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,T7_neu, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1 -1],'LineWidth',1, 'Color', 'k');
        title('T7')
       ylim([-6, 8]);
        subplot(3,6,8)
        plot(time_vector,FC5_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,FC5_neu, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1 -1],'LineWidth',1, 'Color', 'k');
        title('FC5')
       ylim([-6, 8]);
        subplot(3,6,9)
        plot(time_vector,C3_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,C3_neu, 'Linewidth',1, 'Color','k')
        hold on
        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1 -1],'LineWidth',1, 'Color', 'k');
        title('C3')
        
       ylim([-6, 8]);
        subplot(3,6,10)
        plot(time_vector,C4_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,C4_neu, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1 -1],'LineWidth',1, 'Color', 'k');
        title('C4')
       ylim([-6, 8]);
        subplot(3,6,11)
        plot(time_vector,FC6_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,FC6_neu, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1 -1],'LineWidth',1, 'Color', 'k');
        title('FC6')
       ylim([-6, 8]);
        subplot(3,6,12)
        plot(time_vector,T8_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,T8_neu, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1 -1],'LineWidth',1, 'Color', 'k');
        title('T8')
        ylim([-6, 8]);
        subplot(3,6,13)
        plot(time_vector,P7_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,P7_neu, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1 -1],'LineWidth',1, 'Color', 'k');
        title('P7')
        ylim([-6, 8]);
        subplot(3,6,14)
        plot(time_vector,P3_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,P3_neu, 'Linewidth',1, 'Color','k')
        hold on
        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1 -1],'LineWidth',1, 'Color', 'k');
        title('P3')
       ylim([-6, 8]);
        subplot(3,6,15)
        plot(time_vector,CP1_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,CP1_neu, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1 -1],'LineWidth',1, 'Color', 'k');
        title('CP1')
       ylim([-6, 8]);
        subplot(3,6,16)
        plot(time_vector,CP2_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,CP2_neu, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1 -1],'LineWidth',1, 'Color', 'k');
        title('CP2')
        ylim([-6, 8]);
        subplot(3,6,17)
        plot(time_vector,P4_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,P4_neu, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
         line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1 -1],'LineWidth',1, 'Color', 'k');
        title('P4')
        ylim([-6, 8]);
        subplot(3,6,18)
        plot(time_vector,P8_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,P8_neu, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
         line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1 -1],'LineWidth',1, 'Color', 'k');
        title('P8')
ylim([-6, 8]);
            legend('Emotional Hits','New');
           
          