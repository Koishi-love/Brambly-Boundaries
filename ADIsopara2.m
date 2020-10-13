h=1/320;
q=1/1600;
r=(q/h^2)/32;
t=1;
U0=zeros(1/h-1);
x=h:h:(1-h);
M=length(x);
y=x;
U1=U0;
U=U1;
a=-r*ones(1/h-2,1);
b=(1+2*r)*ones(1/h-1,1);
c=-a;
e=c;
c(1/h-2)=2*r;
d=(1-2*r)*ones(1/h-1,1);
e(1)=2*r;
u0=@(x,y)sin(pi*x)*cos(pi*y);
B=diag(d)+diag(c,-1)+diag(e,1);
D=diag(d)+diag(-a,-1)+diag(-a,1);
for i=1:M
    for j=1:M
        U0(i,j)=u0(x(i),y(j));
    end
end
for i=0:t/q-1
    for j=1:M
        U0(j,:)=(B*U0(j,:)');
    end
    for k=1:M
        U1(:,k)=chase(a,b,a,U0(:,k));
    end
    for k=1:M
        U1(:,k)=D*U1(:,k);
    end
    for j=1:M
        U0(j,:)=chase(-c,b,-e,U1(j,:));
    end
end
u=@(x,y,t)sin(pi*x)*cos(pi*y)*exp(-(pi^2)/8*t);
for i=1:M
    for j=1:M
        U(i,j)=u(x(i),y(j),t);
    end
end
surf(x,y,U0-U)
x0=[1/4,2/4,3/4];
y0=[1/4,2/4,3/4];
A=zeros(3);
for i=1:3
    for j=1:3
        A(i,j)=U0(40*i,40*j);
    end
end
A=A';
A