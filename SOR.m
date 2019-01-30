%A is the matrix of interest, b is the answer vector
%Outputs given are the x-vector and how many iterations
%this method takes given set tolerance and max iterations
function x=SOR(A,b,omega,x0,options)
D=diag(A);
L=tril(A)-diag(D);
U=triu(A)-diag(D);
n=size(A,1);
x=x0;
CurIter=0;
while 1
    for i=1:n
        x(i)=omega*(b(i)-L(i,:)*x-U(i,:)*x0)/D(i)...
             +(1-omega)*x0(i);
        
    CurIter=CurIter+1;
    disp([num2str(CurIter) '-th: Residual is ' num2str(norm(A*x-b))])      
    end
    
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