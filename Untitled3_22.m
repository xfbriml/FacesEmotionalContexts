%%
%Plot Means



figure;
plot(time_vector,meanRecFear_electrodes,'Linewidth',4, 'Color','b')
axis tight
hold on
plot(time_vector,meanRecHappy_electrodes,'Linewidth',4, 'Color','k')
axis tight
hold on
plot(time_vector,meanNew_electrodes,'Linewidth',4, 'Color','r')
axis tight
hold on
line([0 0], [4 -2.7],'LineWidth',1, 'Color', [0.8 0.8 0.8],'LineStyle','--');
line([-0.2 1.1],[0 0],'LineWidth',1, 'Color', 'k','LineStyle','--');
axis tight
set(gca,'fontsize',13)
title( 'Rec Fear vs. Rec Happy vs. CR')
ylabel('Amplitude [µV]')
xlabel ('Time [S]') 
set(gcf,'color','white')
set(gca,'TickDir','out');
set(gca,'fontname','times')
legend('Fear','Happy','New')
hold off

% Plot 30 

%%Plotting 30 electrodes with X-axis timing
       figure;
        subplot(5,6,1)
        plot(time_vector,F7_RecFear, 'Linewidth',2, 'Color','b')
        hold on
        plot(time_vector,F7_RecHappy, 'Linewidth',2, 'Color','k')
        hold on
        plot(time_vector,F7_new, 'Linewidth',2, 'Color','r')
        hold on

     
        line([0 0], [6 -6],'LineWidth',1, 'Color', 'k', 'LineStyle', '--');
        line([0.1 0.1], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.4 0.4], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.6 0.6], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.7 0.7], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.9 0.9], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([1.0 1.0], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color','k');
        title('F7')
        
        subplot(5,6,2)
        plot(time_vector,Fp1_RecFear, 'Linewidth',2, 'Color','b')
        hold on
        plot(time_vector,Fp1_RecHappy, 'Linewidth',2, 'Color','k')
        hold on
       
        plot(time_vector,Fp1_new, 'Linewidth',2, 'Color','r')
        hold on


        
        line([0 0], [6 -6],'LineWidth',1, 'Color', 'k', 'LineStyle', '--');
        line([0.1 0.1], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.4 0.4], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.6 0.6], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.7 0.7], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.9 0.9], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([1.0 1.0], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color','k');
        title('Fp1')
        
        subplot(5,6,3)
        plot(time_vector,AFz_RecFear, 'Linewidth',2, 'Color','b')
        hold on
        plot(time_vector,AFz_RecHappy, 'Linewidth',2, 'Color','k')
        hold on
        
        plot(time_vector,AFz_new, 'Linewidth',2, 'Color','r')
        hold on

        line([0 0], [6 -6],'LineWidth',1, 'Color', 'k', 'LineStyle', '--');
        line([0.1 0.1], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.4 0.4], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.6 0.6], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.7 0.7], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.9 0.9], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([1.0 1.0], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color','k');
        
        title('AFz')
        subplot(5,6,4)
        plot(time_vector,Fz_RecFear, 'Linewidth',2, 'Color','b')
        hold on
        plot(time_vector,Fz_RecHappy, 'Linewidth',2, 'Color','k')
        hold on
        
        plot(time_vector,Fz_new, 'Linewidth',2, 'Color','r')
        hold on

        line([0 0], [6 -6],'LineWidth',1, 'Color', 'k', 'LineStyle', '--');
        line([0.1 0.1], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.4 0.4], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.6 0.6], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.7 0.7], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.9 0.9], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([1.0 1.0], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color','k');
        
        title('Fz')
        subplot(5,6,5)
        plot(time_vector,Fp2_RecFear, 'Linewidth',2, 'Color','b')
        hold on
        plot(time_vector,Fp2_RecHappy, 'Linewidth',2, 'Color','k')
        hold on
        
        plot(time_vector,Fp2_new, 'Linewidth',2, 'Color','r')
        hold on
        
        line([0 0], [6 -6],'LineWidth',1, 'Color', 'k', 'LineStyle', '--');
        line([0.1 0.1], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.4 0.4], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.6 0.6], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.7 0.7], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.9 0.9], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([1.0 1.0], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color','k');
        
        title('Fp2')
        subplot(5,6,6)
        plot(time_vector,F8_RecFear, 'Linewidth',2, 'Color','b')
        hold on
        plot(time_vector,F8_RecHappy, 'Linewidth',2, 'Color','k')
        hold on
        
        plot(time_vector,F8_new, 'Linewidth',2, 'Color','r')
        hold on

        line([0 0], [6 -6],'LineWidth',1, 'Color', 'k', 'LineStyle', '--');
        line([0.1 0.1], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.4 0.4], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.6 0.6], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.7 0.7], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.9 0.9], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([1.0 1.0], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color','k');
      
        title('F8')
        
        subplot(5,6,7)
        plot(time_vector,FT9_RecFear, 'Linewidth',2, 'Color','b')
        hold on
        plot(time_vector,FT9_RecHappy, 'Linewidth',2, 'Color','k')
        hold on
        
        plot(time_vector,FT9_new, 'Linewidth',2, 'Color','r')
        hold on

        line([0 0], [6 -6],'LineWidth',1, 'Color', 'k', 'LineStyle', '--');
        line([0.1 0.1], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.4 0.4], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.6 0.6], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.7 0.7], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.9 0.9], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([1.0 1.0], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color','k');
        title('FT9')
        
        subplot(5,6,8)
        plot(time_vector,FC5_RecFear, 'Linewidth',2, 'Color','b')
        hold on
        plot(time_vector,FC5_RecHappy, 'Linewidth',2, 'Color','k')
        hold on
        
        plot(time_vector,FC5_new, 'Linewidth',2, 'Color','r')
        hold on
        line([0 0], [6 -6],'LineWidth',1, 'Color', 'k', 'LineStyle', '--');
        line([0.1 0.1], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.4 0.4], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.6 0.6], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.7 0.7], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.9 0.9], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([1.0 1.0], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color','k');
        title('FC5')
        
        subplot(5,6,9)
        plot(time_vector,F3_RecFear, 'Linewidth',2, 'Color','b')
        hold on
        plot(time_vector,F3_RecHappy, 'Linewidth',2, 'Color','k')
        hold on
        
        plot(time_vector,F3_new, 'Linewidth',2, 'Color','r')
        hold on
        line([0 0], [6 -6],'LineWidth',1, 'Color', 'k', 'LineStyle', '--');
        line([0.1 0.1], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.4 0.4], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.6 0.6], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.7 0.7], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.9 0.9], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([1.0 1.0], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color','k');
        title('F3')
        
        
        subplot(5,6,10)
        plot(time_vector,F4_RecFear, 'Linewidth',2, 'Color','b')
        hold on
        plot(time_vector,F4_RecHappy, 'Linewidth',2, 'Color','k')
        hold on
        
        plot(time_vector,F4_new, 'Linewidth',2, 'Color','r')
        hold on

       line([0 0], [6 -6],'LineWidth',1, 'Color', 'k', 'LineStyle', '--');
        line([0.1 0.1], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.4 0.4], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.6 0.6], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.7 0.7], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.9 0.9], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([1.0 1.0], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color','k');
        title('F4')
        
        subplot(5,6,11)
        plot(time_vector,FC6_RecFear, 'Linewidth',2, 'Color','b')
        hold on
        plot(time_vector,FC6_RecHappy, 'Linewidth',2, 'Color','k')
        hold on
        
        plot(time_vector,FC6_new, 'Linewidth',2, 'Color','r')
        hold on

        line([0 0], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.15 0.15], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color', 'k');line([0 0], [6 -6],'LineWidth',1, 'Color', 'k', 'LineStyle', '--');
        line([0.1 0.1], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.4 0.4], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.6 0.6], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.7 0.7], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.9 0.9], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([1.0 1.0], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color','k');
        title('FC6')
        
        subplot(5,6,12)
        plot(time_vector,FT10_RecFear, 'Linewidth',2, 'Color','b')
        hold on
        plot(time_vector,FT10_RecHappy, 'Linewidth',2, 'Color','k')
        hold on
        
        plot(time_vector,FT10_new, 'Linewidth',2, 'Color','r')
        hold on
line([0 0], [6 -6],'LineWidth',1, 'Color', 'k', 'LineStyle', '--');
        line([0.1 0.1], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.4 0.4], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.6 0.6], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.7 0.7], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.9 0.9], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([1.0 1.0], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color','k');
        title('FT10')
        subplot(5,6,13)
        plot(time_vector,T7_RecFear, 'Linewidth',2, 'Color','b')
        hold on
        plot(time_vector,T7_RecHappy, 'Linewidth',2, 'Color','k')
        hold on
        
        plot(time_vector,T7_new, 'Linewidth',2, 'Color','r')
        hold on

        line([0 0], [6 -6],'LineWidth',1, 'Color', 'k', 'LineStyle', '--');
        line([0.1 0.1], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.4 0.4], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.6 0.6], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.7 0.7], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.9 0.9], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([1.0 1.0], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color','k');
        title('T7')
        subplot(5,6,14)
        plot(time_vector,C3_RecFear, 'Linewidth',2, 'Color','b')
        hold on
        plot(time_vector,C3_RecHappy, 'Linewidth',2, 'Color','k')
        hold on
        
        plot(time_vector,C3_new, 'Linewidth',2, 'Color','r')
        hold on
        line([0 0], [6 -6],'LineWidth',1, 'Color', 'k', 'LineStyle', '--');
        line([0.1 0.1], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.4 0.4], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.6 0.6], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.7 0.7], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.9 0.9], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([1.0 1.0], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color','k');
        title('C3')
        
        subplot(5,6,15)
        plot(time_vector,FC1_RecFear, 'Linewidth',2, 'Color','b')
        hold on
        plot(time_vector,FC1_RecHappy, 'Linewidth',2, 'Color','k')
        hold on
        
        plot(time_vector,FC1_new, 'Linewidth',2, 'Color','r')
        hold on
line([0 0], [6 -6],'LineWidth',1, 'Color', 'k', 'LineStyle', '--');
        line([0.1 0.1], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.4 0.4], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.6 0.6], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.7 0.7], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.9 0.9], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([1.0 1.0], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color','k');
        title('FC1')
        
        subplot(5,6,16)
        plot(time_vector,FC2_RecFear, 'Linewidth',2, 'Color','b')
        hold on
        plot(time_vector,FC2_RecHappy, 'Linewidth',2, 'Color','k')
        hold on
        
        plot(time_vector,FC2_new, 'Linewidth',2, 'Color','r')
        hold on

        line([0 0], [6 -6],'LineWidth',1, 'Color', 'k', 'LineStyle', '--');
        line([0.1 0.1], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.4 0.4], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.6 0.6], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.7 0.7], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.9 0.9], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([1.0 1.0], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color','k');
        title('FC2')
        
        subplot(5,6,17)
        plot(time_vector,C4_RecFear, 'Linewidth',2, 'Color','b')
        hold on
        plot(time_vector,C4_RecHappy, 'Linewidth',2, 'Color','k')
        hold on
        
        plot(time_vector,C4_new, 'Linewidth',2, 'Color','r')
        hold on

        line([0 0], [6 -6],'LineWidth',1, 'Color', 'k', 'LineStyle', '--');
        line([0.1 0.1], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.4 0.4], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.6 0.6], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.7 0.7], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.9 0.9], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([1.0 1.0], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color','k');
        title('C4')
        
        subplot(5,6,18)
        plot(time_vector,T8_RecFear, 'Linewidth',2, 'Color','b')
        hold on
        plot(time_vector,T8_RecHappy, 'Linewidth',2, 'Color','k')
        hold on
        
        plot(time_vector,T8_new, 'Linewidth',2, 'Color','r')
        hold on

        line([0 0], [6 -6],'LineWidth',1, 'Color', 'k', 'LineStyle', '--');
        line([0.1 0.1], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.4 0.4], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.6 0.6], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.7 0.7], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.9 0.9], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([1.0 1.0], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color','k');
        title('T8')

        subplot(5,6,19)
        plot(time_vector,CP5_RecFear, 'Linewidth',2, 'Color','b')
        hold on
        plot(time_vector,CP5_RecHappy, 'Linewidth',2, 'Color','k')
        hold on
        
        plot(time_vector,CP5_new, 'Linewidth',2, 'Color','r')
        hold on

        line([0 0], [6 -6],'LineWidth',1, 'Color', 'k', 'LineStyle', '--');
        line([0.1 0.1], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.4 0.4], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.6 0.6], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.7 0.7], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.9 0.9], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([1.0 1.0], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color','k');
        title('CP5')
        
        subplot(5,6,20)
        plot(time_vector,CP1_RecFear, 'Linewidth',2, 'Color','b')
        hold on
        plot(time_vector,CP1_RecHappy, 'Linewidth',2, 'Color','k')
        hold on
        
        plot(time_vector,CP1_new, 'Linewidth',2, 'Color','r')
        hold on
        line([0 0], [6 -6],'LineWidth',1, 'Color', 'k', 'LineStyle', '--');
        line([0.1 0.1], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.4 0.4], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.6 0.6], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.7 0.7], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.9 0.9], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([1.0 1.0], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color','k');
        title('CP1')
       
        subplot(5,6,21)
        plot(time_vector,Pz_RecFear, 'Linewidth',2, 'Color','b')
        hold on
        plot(time_vector,Pz_RecHappy, 'Linewidth',2, 'Color','k')
        hold on
        
        plot(time_vector,Pz_new, 'Linewidth',2, 'Color','r')
        hold on

        line([0 0], [6 -6],'LineWidth',1, 'Color', 'k', 'LineStyle', '--');
        line([0.1 0.1], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.4 0.4], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.6 0.6], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.7 0.7], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.9 0.9], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([1.0 1.0], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color','k');
        title('Pz')
        
        subplot(5,6,22)
        plot(time_vector,Oz_RecFear, 'Linewidth',2, 'Color','b')
        hold on
        plot(time_vector,Oz_RecHappy, 'Linewidth',2, 'Color','k')
        hold on
        
        plot(time_vector,Oz_new, 'Linewidth',2, 'Color','r')
        hold on

        line([0 0], [6 -6],'LineWidth',1, 'Color', 'k', 'LineStyle', '--');
        line([0.1 0.1], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.4 0.4], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.6 0.6], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.7 0.7], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.9 0.9], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([1.0 1.0], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color','k');
        title('Oz')

        subplot(5,6,23)
        plot(time_vector,CP2_RecFear, 'Linewidth',2, 'Color','b')
        hold on
        plot(time_vector,CP2_RecHappy, 'Linewidth',2, 'Color','k')
        hold on
        
        plot(time_vector,CP2_new, 'Linewidth',2, 'Color','r')
        hold on

        line([0 0], [6 -6],'LineWidth',1, 'Color', 'k', 'LineStyle', '--');
        line([0.1 0.1], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.4 0.4], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.6 0.6], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.7 0.7], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.9 0.9], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([1.0 1.0], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color','k');
        title('CP2')
        
        subplot(5,6,24)
        plot(time_vector,CP6_RecFear, 'Linewidth',2, 'Color','b')
        hold on
        plot(time_vector,CP6_RecHappy, 'Linewidth',2, 'Color','k')
        hold on
        
        plot(time_vector,CP6_new, 'Linewidth',2, 'Color','r')
        hold on

        line([0 0], [6 -6],'LineWidth',1, 'Color', 'k', 'LineStyle', '--');
        line([0.1 0.1], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.4 0.4], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.6 0.6], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.7 0.7], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.9 0.9], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([1.0 1.0], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color','k');
        title('CP6')
        
        subplot(5,6,25)
        plot(time_vector,P7_RecFear, 'Linewidth',2, 'Color','b')
        hold on
        plot(time_vector,P7_RecHappy, 'Linewidth',2, 'Color','k')
        hold on
        
        plot(time_vector,P7_new, 'Linewidth',2, 'Color','r')
        hold on
line([0 0], [6 -6],'LineWidth',1, 'Color', 'k', 'LineStyle', '--');
        line([0.1 0.1], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.4 0.4], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.6 0.6], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.7 0.7], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.9 0.9], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([1.0 1.0], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color','k');
        title('P7')
        
        subplot(5,6,26)
        plot(time_vector,P3_RecFear, 'Linewidth',2, 'Color','b')
        hold on
        plot(time_vector,P3_RecHappy, 'Linewidth',2, 'Color','k')
        hold on
        
        plot(time_vector,P3_new, 'Linewidth',2, 'Color','r')
        hold on
line([0 0], [6 -6],'LineWidth',1, 'Color', 'k', 'LineStyle', '--');
        line([0.1 0.1], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.4 0.4], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.6 0.6], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.7 0.7], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.9 0.9], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([1.0 1.0], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color','k');
        title('P3')
        
        subplot(5,6,27)
        plot(time_vector,O1_RecFear, 'Linewidth',2, 'Color','b')
        hold on
        plot(time_vector,O1_RecHappy, 'Linewidth',2, 'Color','k')
        hold on
        
        plot(time_vector,O1_new, 'Linewidth',2, 'Color','r')
        hold on
line([0 0], [6 -6],'LineWidth',1, 'Color', 'k', 'LineStyle', '--');
        line([0.1 0.1], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.4 0.4], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.6 0.6], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.7 0.7], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.9 0.9], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([1.0 1.0], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color','k');
        title('O1')

        subplot(5,6,28)
        plot(time_vector,O2_RecFear, 'Linewidth',2, 'Color','b')
        hold on
        plot(time_vector,O2_RecHappy, 'Linewidth',2, 'Color','k')
        hold on
        
        plot(time_vector,O2_new, 'Linewidth',2, 'Color','r')
        hold on
line([0 0], [6 -6],'LineWidth',1, 'Color', 'k', 'LineStyle', '--');
        line([0.1 0.1], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.4 0.4], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.6 0.6], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.7 0.7], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.9 0.9], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([1.0 1.0], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color','k');
        title('O2')
        
        subplot(5,6,29)
        plot(time_vector,P4_RecFear, 'Linewidth',2, 'Color','b')
        hold on
        plot(time_vector,P4_RecHappy, 'Linewidth',2, 'Color','k')
        hold on
        
        plot(time_vector,P4_new, 'Linewidth',2, 'Color','r')
        hold on
line([0 0], [6 -6],'LineWidth',1, 'Color', 'k', 'LineStyle', '--');
        line([0.1 0.1], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.4 0.4], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.6 0.6], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.7 0.7], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.9 0.9], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([1.0 1.0], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color','k');
        title('P4')
        
        subplot(5,6,30)
        plot(time_vector,P8_RecFear, 'Linewidth',2, 'Color','b')
        hold on
        plot(time_vector,P8_RecHappy, 'Linewidth',2, 'Color','k')
        hold on
        
        plot(time_vector,P8_new, 'Linewidth',2, 'Color','r')
        hold on
        line([0 0], [6 -6],'LineWidth',1, 'Color', 'k', 'LineStyle', '--');
        line([0.1 0.1], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.2 0.2], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.3 0.3], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.4 0.4], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.5 0.5], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.6 0.6], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.7 0.7], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.8 0.8], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([0.9 0.9], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([1.0 1.0], [1.0 -1.0],'LineWidth',1, 'Color', 'k');
        line([-0.1 1.1],[0 0],'LineWidth',1, 'Color','k');
        title('P8')
        

%%