function compact_FDM(f,g,h1,h2)
%0边值二维抛物型方程的紧致差分格式，区域为[0,1]*[0,1]，g为真解
m=1/h1;
n=1/h2;
U=zeros(m-1,n-1);
G=U;
c1=5/3*(1/h1^2+1/h2^2);
c2=-1/6*(5/h1^2-1/h2^2);
c3=-1/6*(5/h2^2-1/h1^2);
c4=-1/12*(1/h1^2+1/h2^2);
e=ones(m-1,1);
C=spdiags([e*c2 c1*e e*c2],-1:1,m-1,m-1);
D=spdiags([e*c4 c3*e e*c4],-1:1,m-1,m-1);
e=ones(n-1,1);
E=spdiags([e 0*e e],-1:1,n-1,n-1);
full(C);
full(D);
full(E);
H=kron(eye(n-1),C)+kron(E,D);
x=h1:h1:(1-h1);
y=h2:h2:(1-h2);
F=[];
for i=1:m-1
    for j=1:n-1
        k=f(y(j),x(i));
        F=[F;k];
        G(i,j)=g(x(i),y(j));
    end
end
u=H\F;
for i=1:n-1
    U(:,i)=u((1+(m-1)*(i-1)):(m-1)*i);
end
surf(y,x,U-G)
