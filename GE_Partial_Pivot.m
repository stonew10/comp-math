%This code solves matrix A using partial pivoting
%gaussian elmination
function x=GE_Partial_Pivot(A,b)
n=size(A,1);
Aug=[A b];
for i=1:n-1
    [max_ai,k]=max(abs(Aug(i:n,i)));
    k=k+i-1;
    temp=Aug(i,:);
    Aug(i,:)=Aug(k,:);
    Aug(k,:)=temp;
    for j=i+1:n
        Aug(j,:)=Aug(j,:)-Aug(j,i)/Aug(i,i)*Aug(i,:);
    end
end
x=zeros(n,1);
A=Aug(:,1:n);
b=Aug(:,n+1);
x(n)=b(n)/A(n,n);
for i=n-1:-1:1
    x(i)=b(i);
    for j=i+1:n
        x(i)=x(i)-A(i,j)*x(j);
    end
    x(i)=x(i)/A(i,i);
end

