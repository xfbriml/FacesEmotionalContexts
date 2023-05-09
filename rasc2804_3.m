%todos os eletrodos Negative vs Positive    Diferença sig entre 500-800 e
%800-1100

figure;
        subplot(3,6,1)
        plot(time_vector,F7_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,F7_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
       
        title('F7')
        subplot(3,6,2)
        plot(time_vector,F3_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,F3_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        title('F3')
        subplot(3,6,3)
        plot(time_vector,FC1_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,FC1_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        title('FC1')
        subplot(3,6,4)
        plot(time_vector,FC2_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,FC2_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        title('FC2')
        subplot(3,6,5)
        plot(time_vector,F4_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,F4_new, 'Linewidth',1, 'Color','k')
        hold on
        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        title('F4')
        subplot(3,6,6)
        plot(time_vector,F8_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,F8_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        title('F8')
        subplot(3,6,7)
        plot(time_vector,T7_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,T7_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        title('T7')
        subplot(3,6,8)
        plot(time_vector,FC5_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,FC5_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.5 -1.5],'LineWidth',1, 'Color', 'k');;
        title('FC5')
        subplot(3,6,9)
        plot(time_vector,C3_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,C3_new, 'Linewidth',1, 'Color','k')
        hold on
        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        title('C3')
        
        
        subplot(3,6,10)
        plot(time_vector,C4_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,C4_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        title('C4')
        subplot(3,6,11)
        plot(time_vector,FC6_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,FC6_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        title('FC6')
        subplot(3,6,12)
        plot(time_vector,T8_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,T8_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        title('T8')
        subplot(3,6,13)
        plot(time_vector,P7_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,P7_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        title('P7')
        subplot(3,6,14)
        plot(time_vector,P3_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,P3_new, 'Linewidth',1, 'Color','k')
        hold on
        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        title('P3')
        subplot(3,6,15)
        plot(time_vector,CP1_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,CP1_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        title('CP1')
        subplot(3,6,16)
        plot(time_vector,CP2_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,CP2_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        title('CP2')
        subplot(3,6,17)
        plot(time_vector,P4_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,P4_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        title('P4')
        subplot(3,6,18)
        plot(time_vector,P8_emo, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,P8_new, 'Linewidth',1, 'Color','k')
        hold on

        axis off
        box off
        line([0 0], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.5 -1.5],'LineWidth',1, 'Color', 'k');
        title('P8')

            legend('Emotional Hits','New')