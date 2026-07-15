clear
clc
close all

%%  参数设置
SearchAgents = 50;                                      % population members 
Max_iterations = 500;                                  % maximum number of iteration
number = 'F12';                                      
[lb,ub,dim,fobj] = Get_Functions_details(number);     

%%  调用算法
[SAO_score,SAO_pos,SAO_curve]=SO(SearchAgents,Max_iterations,lb,ub,dim,fobj);    % 调用SAO算法
disp(SAO_score)
[EAO_score,EAO_pos,EAO_curve]=GWO(SearchAgents,Max_iterations,lb,ub,dim,fobj);    % 调用EAO算法
disp(EAO_score);
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
if ~strcmp(number,'F16')&&~strcmp(number,'F9')&&~strcmp(number,'F11')  %这里是因为这几个函数收敛太快，不适用于semilogy，直接plot
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