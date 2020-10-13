function [y,k]=ADIx(v,h,p)
%%该函数仅用于五点差分格式A的交替方向隐式迭代法
e=-1*ones(1/h-1,1);
A=spdiags([e -2*e e],-1:1,1/h-1,1/h-1);
A1=1/h^2*kron(eye(1/h-1),A);
A2=1/h^2*(2*eye((1/h-1)^2)+kron(spdiags([e e],[-1,1],1/h-1,1/h-1),eye(1/h-1)));
t=h^2/(2*sin(pi*h));
u0=zeros((1/h-1)^2,1);
u2=ones((1/h-1)^2,1);
r=u2-u0;
k=0;
a=t*diag(A1,1);
b=ones(1,(1/h-1)^2)+t*diag(A1);
c=(eye((1/h-1)^2)-t*A2);
d=(eye((1/h-1)^2)-t*A1);
f=t*v;
g=ones(1,(1/h-1)^2)+t*diag(A2);
m=t*diag(A2,1/h-1);
A=A1+A2;
while norm(r)>=p
    u1=chase(a,b,a,c*u0+f);
    u1=u1';
    u2=chase2(m,g,m,d*u1+f);
    k=k+1;
    r=v-A*u2;
    u0=u2;
end
y=u0;
