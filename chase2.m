function x=chase2(a,b,c,d)
%%�ú������ڴζԽ������Խ�"�Ⱦ�"�����ԽǾ����׷�Ϸ���������chase�������������Ż��汾
%�ú���Ҫ��a,b,c,d���Ǳ�׼���������ܹ�ͨ�����ǳ��ȵĲ�ֵ�õ��ھ����е�λ��
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