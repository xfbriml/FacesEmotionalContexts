
figure;
   
        subplot(1,3,1)
        plot(time_vector,FC1_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,FC1_pos, 'Linewidth',1, 'Color','r')
        hold on
        % plot(time_vector,FC1_neu, 'Linewidth',1, 'Color','b')
        hold on
        plot(time_vector,FC1_new, 'Linewidth',1, 'Color','k', 'LineStyle', ':')

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1 -1],'LineWidth',1, 'Color', 'k');
        title('FC1')
        subplot(1,3,2)
          plot(time_vector,FC6_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,FC6_pos, 'Linewidth',1, 'Color','r')
        hold on
        % plot(time_vector,FC2_neu, 'Linewidth',1, 'Color','b')
        hold on
        plot(time_vector,FC6_new, 'Linewidth',1, 'Color','k', 'LineStyle', ':')

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1 -1],'LineWidth',1, 'Color', 'k');
        title('FC6')
        
        subplot(1,3,3)
          plot(time_vector,T8_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,T8_pos, 'Linewidth',1, 'Color','r')
        hold on
        % plot(time_vector,FC6_neu, 'Linewidth',1, 'Color','b')
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
        line([0.5 0.5], [1 -1],'LineWidth',1, 'Color', 'k');
        title('T8')
       

            legend('Negative','Positive','New')
           
%%%

figure;
subplot(1,3,1)
        plot(time_vector,P3_old, 'Linewidth',2, 'Color','k')
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
        plot(time_vector,FC5_old, 'Linewidth',2, 'Color','k')
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
        plot(time_vector,F4_old, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,F4_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1 -1],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1 -1],'LineWidth',1, 'Color', 'k');
        title('F4')
        
        legend('Old','New')
        %%
        figure;
        subplot(1,3,1)
        plot(time_vector,FC5_neg, 'Linewidth',2, 'Color','k')
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
        
        subplot(1,3,2)
        plot(time_vector,P3_neu, 'Linewidth',2, 'Color','k')
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
        
        subplot(1,3,3)
        plot(time_vector,P4_neu, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,P4_new, 'Linewidth',1, 'Color','k')
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
        
        legend('Negative','New')
        
        %%
        figure;
      
        plot(time_vector,F3_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,F3_new, 'Linewidth',1, 'Color','k')
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
        
        subplot(1,3,2)
        plot(time_vector,FC1_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,FC1_new, 'Linewidth',1, 'Color','k')
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
        
        subplot(1,3,3)
        plot(time_vector,CP1_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,CP1_new, 'Linewidth',1, 'Color','k')
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
        
        legend('Emotional Hits','New')
        
        %%
        figure;
        subplot(1,3,1)
   
        plot(time_vector,F3_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,F3_pos, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        title('F3')
        
        subplot(1,3,2)
        plot(time_vector,CP2_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,CP2_pos, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        title('CP2')
        
        subplot(1,3,3)
        plot(time_vector,P4_neg, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,P4_pos, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        title('P4')
        
         legend('Negative','Positive')