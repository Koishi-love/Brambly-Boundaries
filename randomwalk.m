function pc=randomwalk(P,L,l,i0,N)
n=length(l);
m=length(P);
l=[l,-2];  %%这里对l的扩张是为了让步数有一个终止条件，因为任意的L（i，j）都不可能等于-2
flag=-1*ones(1,n+1);
flag2=-1;  %%标志数组的初值
for i=1:N
    k=0;
    value=i0;
    top=1;
    cut=0;%循环中断器，用以中断没有出路的循环
    while k~=n
        v=value(top);
        e=zeros(m+1);
        for e0=2:m+1
            %%该循环设定当前所处状态的转移指示
            e(e0)=P(v,e0-1)+e(e0-1);
        end
        while 1
            %%该循环目的是走出可行的下一状态
            cut=cut+1;
        a=rand;
        v=0;
        for k1=1:m
        v=v+k1*point(e(k1),a,e(k1+1));
        end
        if L(value(top),v)==l(k+1)
            k=k+1;
            value=[value,v];
            top=top+1;
            break;
        end
        if cut==m*m*m
            break;
        end
        end
        if cut==m*m*m
            break;
        end
    end
    if k~=n
        continue;
    end
    y=panding2(flag,value);
    if y==0
        flag=[flag;value];
        flag2=[flag2;1];
    else
        flag2(y)=flag2(y)+1; %%频次统计
    end
end   
[m,n]=max(flag2);
flag2=flag2/(sum(flag2)+1); %%频次转化为频率
pc=[flag(n,:),flag2(n)];