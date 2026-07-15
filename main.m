clear
clc
close all

%%  parameter setting
SearchAgents = 50;                                      % population members 
Max_iterations = 500;                                  % maximum number of iteration
number = 'F12';                                      
[lb,ub,dim,fobj] = Get_Functions_details(number);     

%%  Invoke the algorithm
[SAO_score,SAO_pos,SAO_curve]=SO(SearchAgents,Max_iterations,lb,ub,dim,fobj);   
disp(SAO_score)
[EAO_score,EAO_pos,EAO_curve]=GWO(SearchAgents,Max_iterations,lb,ub,dim,fobj);   
%% Figure
figure1 = figure('Color',[1 1 1]);
G1=subplot(1,2,1,'Parent',figure1);
func_plot(number)
title(number)
xlabel('x')
ylabel('y')
zlabel('z')
subplot(1,2,2)
G2=subplot(1,2,2,'Parent',figure1);
CNT=25;
k=round(linspace(1,Max_iterations,CNT)); %随机选CNT个点
iter=1:1:Max_iterations;
if ~strcmp(number,'F16')&&~strcmp(number,'F9')&&~strcmp(number,'F11')  %Here is because these functions converge too quickly and are not suitable for semilogy; instead, use plot directly.
    semilogy(iter(k),SAO_curve(k),'b-*','linewidth',1);
    hold on
    semilogy(iter(k),EAO_curve(k),'r-p','linewidth',1);
else
    plot(iter(k),SAO_curve(k),'b-*','linewidth',1);
    hold on
    plot(iter(k),EAO_curve(k),'r-p','linewidth',1);
end
grid on;
title('Convergence curve')
xlabel('Iter');
ylabel('fitness');
box on
legend('SAO','EAO')
set (gcf,'position', [300,300,800,330])