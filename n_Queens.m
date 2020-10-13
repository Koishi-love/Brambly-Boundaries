fid=fopen('queen.in');
n=fscanf(fid,'%d',1);
fid2=fopen('queen_U201615703.out','w');
for k=1:n
    A=[];
    v=fscanf(fid,'%d',1);
    A=NQUEENS(v);
    p=size(A,1);
    fprintf(fid2,'%d',v);
    fprintf(fid2,' %d\r\n',p);
    for i=1:p
        for j=1:v-1
            fprintf(fid2,'%d ',A(i,j));
        end
        fprintf(fid2,'%d\r\n',A(i,v));
    end
end
fclose(fid);
fclose(fid2);