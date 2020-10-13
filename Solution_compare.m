function [t,err]=Solution_compare(t1,y1,t2,y2)
%%不一致数值解的比较函数,[t2,y2]比[t1,y1]更精确
for i=0:length(t1)
    if t1(length(t1)-i)>t2(length(t2))
        t1(length(t1))=[];
        y1(:,length(t1))=[];
    else
        break;
    end
end
t=t1;
err=zeros(size(y1,1),size(y1,2));
q=1;
y=zeros(size(y1,1),1);
for i=1:length(t1)
    for j=q:length(t2)
        if t1(i)<t2(j+1) && t1(i)>=t2(j)
            for k=1:length(y)
                f=Langrange_poly(t2(j-3:j+3),y2(k,j-3:j+3)');
                y(k)=f(t1(i));
            end
            err(:,i)=abs(y-y1(:,i));
            %err(:,i)=abs(y1(:,i)-y2(:,j));
            q=j;
            break;
        end
    end
end

            