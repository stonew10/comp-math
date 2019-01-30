%A is the matrix of interest, b is the answer vector
%Outputs given are the x-vector (solution) and how many iterations
%this method takes given set tolerance and max iterations
function x=Gauss_seidel(A,b,x0,options)
D=diag(A);
L=tril(A)-diag(D);
U=triu(A)-diag(D);
CurIter=0;
n=size(A,1);
x=x0;
while 1
    for i=1:n
        x(i)=(b(i)-L(i,:)*x-U(i,:)*x0)/D(i);
    end
    CurIter=CurIter+1;
    disp([num2str(CurIter) '-th: Residual is ' num2str(norm(A*x-b))])
    if CurIter>options.MaxIter
        break
    end
    if norm(x-x0)<options.Tol
        break
    end
    if norm(A*x-b)<options.Tol
        break
    end
    x0=x;
end