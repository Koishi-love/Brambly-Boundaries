
result=inputdlg({'��ѡ��ʵ�飬��ѡ2.1��������1����������2��'},'charpt_2',1,{'1'});
Nb=str2num(char(result));
if(Nb~=1)&(Nb~=2)errordlg('ʵ��ѡ�����');
    return;
end
promps={'��ѡ��ʵ�麯������ѡf��x����������f����ѡh��x��,������h,��ѡg��x��,������g��'};
result=inputdlg(promps,'charpt 2',1,{'f'});
Nb_f=char(result);
if(Nb_f~='f'&Nb_f~='g')
    errordlg('ʵ�麯��ѡ�����');
    return;
end
result=inputdlg({'�������ֵ����ʽ�Ĵ���N��'},'charpt_2',1,{'10'});
Nd=str2num(char(result));
if(Nd<1)
    errord('��ֵ����ʽ�Ĵ����������');
    return;
end
switch Nb_f
    case'f'
        f=inline('1./(1+25*x.^2)');a=-1;b=1;
    case'h'
        f=inline('1');a=-5;b=5;
    case'g'
        f=inline('1');a=-5;b=5;
end
if(Nb==1)
    x0=ones(1,Nd)
    for i=1:Nd
        x0(i)=(b-a)*cos((i-0.5)*pi/(Nd))/2+(b+a)/2;
    end
    y0=feval(f,x0);
    x=a:0.1:b;y=Newton1(x0,y0,x);
    clf;
    fplot(f,[a b],'co');
    hold on;
    plot(x,y,'b--');
    xlabel('x');ylabel('y=f(x) o and y=Ln(x)--');
else if(Nb==2)
    x0=linspace(a,b,Nd+1);y0=feval(f,x0);
    x=a:0.1:b;
    cs=spline(x0,y0);y=ppval(cs,x);
    clf;
    flot(f,[a b],'co');
    hold on;
    plot(x,y,'k-');
    xlabel('x');ylabel('y=f(x) o and y=Spline(x)-');
    end
end