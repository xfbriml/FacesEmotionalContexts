figure;
        subplot(3,6,1)
        plot(time_vector,F7_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,F7_pos, 'Linewidth',1, 'Color','r')
        hold on
        %plot(time_vector,F7_neu, 'Linewidth',1, 'Color','b')
        hold on
        plot(time_vector,F7_new, 'Linewidth',1, 'Color','k', 'LineStyle', ':')
        hold on
        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        title('F7')
        
        subplot(3,6,2)
        plot(time_vector,F3_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,F3_pos, 'Linewidth',1, 'Color','r')
        hold on
        % plot(time_vector,F3_neu, 'Linewidth',1, 'Color','b')
        hold on
        plot(time_vector,F3_new, 'Linewidth',1, 'Color','k', 'LineStyle', ':')
        hold on
        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        title('F3')
        subplot(3,6,3)
          plot(time_vector,FC1_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,FC1_pos, 'Linewidth',1, 'Color','r')
        hold on
       %  plot(time_vector,FC1_neu, 'Linewidth',1, 'Color','b')
        hold on
        plot(time_vector,FC1_new, 'Linewidth',1, 'Color','k', 'LineStyle', ':')
        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        title('FC1')
        subplot(3,6,4)
         plot(time_vector,FC2_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,FC2_pos, 'Linewidth',1, 'Color','r')
        hold on
        % plot(time_vector,FC2_neu, 'Linewidth',1, 'Color','b')
        hold on
        plot(time_vector,FC2_new, 'Linewidth',1, 'Color','k', 'LineStyle', ':')

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        title('FC2')
        subplot(3,6,5)
           plot(time_vector,F4_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,F4_pos, 'Linewidth',1, 'Color','r')
        hold on
        %plot(time_vector,F4_neu, 'Linewidth',1, 'Color','b')
        hold on
        plot(time_vector,F4_new, 'Linewidth',1, 'Color','k', 'LineStyle', ':')
        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        title('F4')
        subplot(3,6,6)
        plot(time_vector,F8_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,F8_pos, 'Linewidth',1, 'Color','r')
        hold on
         %plot(time_vector,F8_neu, 'Linewidth',1, 'Color','b')
        hold on
        plot(time_vector,F8_new, 'Linewidth',1, 'Color','k', 'LineStyle', ':')

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        title('F8')
        subplot(3,6,7)
          plot(time_vector,T7_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,T7_pos, 'Linewidth',1, 'Color','r')
        hold on
        % plot(time_vector,T7_neu, 'Linewidth',1, 'Color','b')
        hold on
        plot(time_vector,T7_new, 'Linewidth',1, 'Color','k', 'LineStyle', ':')

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        title('T7')
        subplot(3,6,8)
           plot(time_vector,FC5_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,FC5_pos, 'Linewidth',1, 'Color','r')
        hold on
        % plot(time_vector,FC5_neu, 'Linewidth',1, 'Color','b')
        hold on
        plot(time_vector,FC5_new, 'Linewidth',1, 'Color','k', 'LineStyle', ':')

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        title('FC5')
        subplot(3,6,9)
           plot(time_vector,C3_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,C3_pos, 'Linewidth',1, 'Color','r')
        hold on
        % plot(time_vector,C3_neu, 'Linewidth',1, 'Color','b')
        hold on
        plot(time_vector,C3_new, 'Linewidth',1, 'Color','k', 'LineStyle', ':')
        hold on
        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        title('C3')
        
        
        subplot(3,6,10)
           plot(time_vector,C4_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,C4_pos, 'Linewidth',1, 'Color','r')
        hold on
        % plot(time_vector,C4_neu, 'Linewidth',1, 'Color','b')
        hold on
        plot(time_vector,C4_new, 'Linewidth',1, 'Color','k', 'LineStyle', ':')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        title('C4')
        subplot(3,6,11)
          plot(time_vector,FC6_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,FC6_pos, 'Linewidth',1, 'Color','r')
        hold on
        % plot(time_vector,FC6_neu, 'Linewidth',1, 'Color','b')
        hold on
        plot(time_vector,FC6_new, 'Linewidth',1, 'Color','k', 'LineStyle', ':')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        title('FC6')
        subplot(3,6,12)
          plot(time_vector,T8_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,T8_pos, 'Linewidth',1, 'Color','r')
        hold on
        % plot(time_vector,T8_neu, 'Linewidth',1, 'Color','b')
        hold on
        plot(time_vector,T8_new, 'Linewidth',1, 'Color','k', 'LineStyle', ':')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        title('T8')
        subplot(3,6,13)
           plot(time_vector,P7_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,P7_pos, 'Linewidth',1, 'Color','r')
        hold on
        % plot(time_vector,P7_neu, 'Linewidth',1, 'Color','b')
        hold on
        plot(time_vector,P7_new, 'Linewidth',1, 'Color','k', 'LineStyle', ':')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        title('P7')
        subplot(3,6,14)
          plot(time_vector,P3_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,P3_pos, 'Linewidth',1, 'Color','r')
        hold on
         %plot(time_vector,P3_neu, 'Linewidth',1, 'Color','b')
        hold on
        plot(time_vector,P3_new, 'Linewidth',1, 'Color','k', 'LineStyle', ':')
        hold on
        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        title('P3')
        subplot(3,6,15)
           plot(time_vector,CP1_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,CP1_pos, 'Linewidth',1, 'Color','r')
        hold on
        % plot(time_vector,CP1_neu, 'Linewidth',1, 'Color','b')
        hold on
        plot(time_vector,CP1_new, 'Linewidth',1, 'Color','k', 'LineStyle', ':')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        title('CP1')
        subplot(3,6,16)
           plot(time_vector,CP2_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,CP2_pos, 'Linewidth',1, 'Color','r')
        hold on
        % plot(time_vector,CP2_neu, 'Linewidth',1, 'Color','b')
        hold on
        plot(time_vector,CP2_new, 'Linewidth',1, 'Color','k', 'LineStyle', ':')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        title('CP2')
        subplot(3,6,17)
           plot(time_vector,P4_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,P4_pos, 'Linewidth',1, 'Color','r')
        hold on
        % plot(time_vector,P4_neu, 'Linewidth',1, 'Color','b')
        hold on
        plot(time_vector,P4_new, 'Linewidth',1, 'Color','k', 'LineStyle', ':')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        title('P4')
        subplot(3,6,18)
           plot(time_vector,P8_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,P8_pos, 'Linewidth',1, 'Color','r')
        hold on
         %plot(time_vector,P8_neu, 'Linewidth',1, 'Color','b')
        hold on
        plot(time_vector,P8_new, 'Linewidth',1, 'Color','k', 'LineStyle', ':')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        title('P8')

            legend('Negative','Positive','New')