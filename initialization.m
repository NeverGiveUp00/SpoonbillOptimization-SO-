%%  闲鱼：深度学习与智能算法
%%  唯一官方店铺：https://mbd.pub/o/author-aWWbm3BtZw==
%%  所有程序清单：https://docs.qq.com/sheet/DT1hWRkpoVVJ3TGZv?tab=BB08J2
%%  微信公众号：强盛机器学习，关注公众号获得更多免费代码！
function [x, new_lb, new_ub] = initialization(N,dim,ub,lb)
Boundary= size(ub,2); % numnber of boundaries
new_lb = lb;
new_ub = ub;
% If the boundaries of all variables are equal and user enter a signle
% number for both ub and lb
if Boundary==1
    x=rand(N,dim).*(ub-lb)+lb;
    new_lb = lb*ones(1,dim);
    new_ub = ub*ones(1,dim);
end
% If each variable has a different lb and ub
if Boundary>1
    for i=1:dim
        ubi=ub(i);
        lbi=lb(i);
        x(:,i)=rand(N,1).*(ubi-lbi)+lbi;
    end
end