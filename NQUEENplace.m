function y=NQUEENplace(X)
k=length(X);
i=1;
y=1;
while i<k
    if X(i)==X(k) || abs(X(i)-X(k))==abs(i-k)
        y=0;
    end
    i=i+1;
end