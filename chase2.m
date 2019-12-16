function x=chase2(a,b,c,d)
%%该函数用于次对角与主对角"等距"的三对角矩阵的追赶法，囊括了chase函数，是它的优化版本
%该函数要求a,b,c,d都是标准的向量，能够通过它们长度的差值得到在矩阵中的位置
n=length(b);
L=n-length(a);
for i=1:L
    f(i)=c(i)/b(i);
    g(i)=d(i)/b(i);
end
for i=L+1:n-L
    h(i)=b(i)-f(i-L)*a(i-L); f(i)=c(i)/h(i);
    g(i)=(d(i)-g(i-L)*a(i-L))/h(i);
end
for i=n-L+1:n
g(i)=(d(i)-g(i-L)*a(i-L))/(b(i)-f(i-L)*a(i-L));
x(i)=g(i);
end
for i=n-L:-1:1
    x(i)=g(i)-f(i)*x(i+L);
end
x=x';