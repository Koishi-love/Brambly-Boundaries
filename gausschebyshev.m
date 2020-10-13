 
function [ac,Ak,xk]=gausschebyshev(fun,n)
% 高斯-勒让德数值积分
%
% 参数说明
% fun：积分表达式，可以是函数句柄、inline函数、匿名函数、字符串表达式，但是必须可以接受矢量输入
% a,b：积分上下限只能[-1 1]，故忽略
% n：积分阶数，可以任意正整数，但是不建议设置过大，大不一定能得到更好的精度
% ac：积分结果
% Ak：求积系数
% xk：求积节点，满足gc=sum(Ak.*fun(xk))
%
% 举例说明
% fun=@(x)exp(x).*cos(x); % 必须可以接受矢量输入
% quadl(fun,-1,1) % 调用MATLAB内部积分函数检验
% [ac,Ak,xk]=guasschebyshev(fun,7)

% 计算求积系数
k=0:n;
Ak=ones(1,n+1)*pi/(n+1);
% 计算求积节点
xk=cos((2*k+1)/(2*n+2)*pi);
% 计算权函数
rho=@(x)sqrt(1-x.^2);
% 积分函数有效性检验
fun=fcnchk(fun,'vectorize');
% 带权的积分函数值
fx=fun(xk).*rho(xk);
% 计算积分值
ac=sum(Ak.*fx);

