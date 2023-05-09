 figure;
        subplot(1,3,1)
        plot(time_vector,P3_pos, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,P3_new, 'Linewidth',1, 'Color','k')
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
        
        subplot(1,3,2)
        plot(time_vector,FC5_pos, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,FC5_new, 'Linewidth',1, 'Color','k')
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
        
        subplot(1,3,3)
        plot(time_vector,FC2_pos, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,FC2_new, 'Linewidth',1, 'Color','k')
        hold on
        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1 -1],'LineWidth',1, 'Color', 'k');
        title('FC2')
        
        legend('Negativo','Positivo')