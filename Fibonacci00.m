function A=Fibonacci00(f,p,a,b)
X=[1,1];
i=2;
A=[];
while X(i)<1/p
    i=i+1;
    X=[X,X(i-1)+X(i-2)];
end
n=i;
for i=1:n-2
    t1=b+(X(n-i)/X(n-i+1))*(a-b);
    t2=a+(X(n-i)/X(n-i+1))*(b-a);
    A=[A;t1,f(t1),t2,f(t2)];
    if f(t1)<f(t2)
        b=t2;
    else
        a=t1;
    end
end
    