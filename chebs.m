function y=chebs(n)
%%切比雪夫多项式，n为次数
y=@(x)cos(n*arccos(x));