figure;
   
        subplot(1,3,1)
        plot(time_vector,F3_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,F3_pos, 'Linewidth',1, 'Color','k')
        hold on
       % plot(time_vector,FC1_new, 'Linewidth',1, 'Color','k', 'LineStyle', ':')

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1 -1],'LineWidth',1, 'Color', 'k');
        title('F3')
        subplot(1,3,2)
          plot(time_vector,P4_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,P4_pos, 'Linewidth',1, 'Color','k')
        hold on
        %plot(time_vector,FC2_new, 'Linewidth',1, 'Color','k', 'LineStyle', ':')

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1 -1],'LineWidth',1, 'Color', 'k');
        title('P4')
        
        subplot(1,3,3)
          plot(time_vector,CP2_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,CP2_pos, 'Linewidth',1, 'Color','k')
        hold on
        %plot(time_vector,FC6_new, 'Linewidth',1, 'Color','k', 'LineStyle', ':')
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
       

            legend('Negative','Positive')
           