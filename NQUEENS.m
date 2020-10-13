function A=NQUEENS(n)
i=0;
A=[];
X=zeros(1,n);
k=1;
while k>0
    X(k)=X(k)+1;
    if k==1
        i=i+1;
    end
    if i==ceil(n/2)+1
        break;
    end
    while k>0 && NQUEENplace(X(1:k))==0
    X(k)=X(k)+1;
    end
    if X(k)<=n
        if k==n
            A=[A;X];
        else
            k=k+1;
            X(k)=0;
        end
    else
        k=k-1;
    end
end
[m,t]=size(A);
if mod(n,2) == 0
    for i=1:m
        A=[A;(n+1)*ones(1,n)-A(i,:)];
    end
else
    for i=1:m
        if A(i,1)~=ceil(n/2)
            A=[A;(n+1)*ones(1,n)-A(i,:)];
        end
    end
end