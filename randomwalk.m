function pc=randomwalk(P,L,l,i0,N)
n=length(l);
m=length(P);
l=[l,-2];  %%�����l��������Ϊ���ò�����һ����ֹ��������Ϊ�����L��i��j���������ܵ���-2
flag=-1*ones(1,n+1);
flag2=-1;  %%��־����ĳ�ֵ
for i=1:N
    k=0;
    value=i0;
    top=1;
    cut=0;%ѭ���ж����������ж�û�г�·��ѭ��
    while k~=n
        v=value(top);
        e=zeros(m+1);
        for e0=2:m+1
            %%��ѭ���趨��ǰ����״̬��ת��ָʾ
            e(e0)=P(v,e0-1)+e(e0-1);
        end
        while 1
            %%��ѭ��Ŀ�����߳����е���һ״̬
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
        flag2(y)=flag2(y)+1; %%Ƶ��ͳ��
    end
end   
[m,n]=max(flag2);
flag2=flag2/(sum(flag2)+1); %%Ƶ��ת��ΪƵ��
pc=[flag(n,:),flag2(n)];