
function  MASWaves_plot_theor_exp_dispersion_curves(c_t,f_curvet,...
    c_curve0,f_curve0,FigWidth,FigHeight,FigFontSize)


%% With upper/lower boundaries
%if strcmp(up_low_boundaries,'yes')
%    hold on
%    plot(c_curve0,lambda_curve0,'ko-','MarkerSize',3,'MarkerFaceColor','k','MarkerEdgeColor','k')
%   % plot(c_curve0_up,lambda_curve0_up,'k+--','MarkerSize',3,'MarkerFaceColor','k','MarkerEdgeColor','k')
%    plot(c_t,lambda_t,'r-','MarkerSize',3,'MarkerFaceColor','k','MarkerEdgeColor','k','LineWidth',1.5)
%    %plot(c_curve0_low,lambda_curve0_low,'k+--','MarkerSize',3,'MarkerFaceColor','k','MarkerEdgeColor','k')
%    %legend({'Exp.','Exp. up','/low','Theor.'},'location','southwest','FontSize',FigFontSize)
%     legend({'Exp.','Theor.'},'location','southwest','FontSize',FigFontSize)
%    hold on
%end

% Without upper/lower boundaries
plot(f_curve0,c_curve0,'ro-','MarkerSize',3,'MarkerFaceColor','r','MarkerEdgeColor','r','LineWidth',1.5)
hold on
plot(f_curvet,c_t,'k-','MarkerSize',3,'MarkerFaceColor','r','MarkerEdgeColor','r','LineWidth',1.5)

%if strcmp(up_low_boundaries,'no')
  legend({'Exp.FM.','Theor. FM'},'location','southwest','FontSize',FigFontSize)
  legend boxoff
%end

% Axis labels and axis limits
set(gca, 'FontSize', FigFontSize,'FontName','Times New Roman')
%axis ji
grid off
ylabel('Rayleigh wave velocity [m/s]','FontSize',FigFontSize,'Fontweight','normal')
xlabel('Frequency [Hz]','FontSize',FigFontSize,'Fontweight','normal')

% Size of figure
set(gcf,'units','centimeters')
pos = [2, 2, FigWidth, FigHeight];
set(gcf,'Position',pos)
box off
set(gca,'TickDir','out')
hold off
end
