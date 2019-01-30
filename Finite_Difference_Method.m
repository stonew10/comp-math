%Given the boundary value problem: 
% d2u/dt2 = u, 0 =< t =< 1
% u(0); u(1) = e - e^(-1)
% I have to use finite difference method 
% to solve the BVP

%I use the following code to create my 
%tridiagonal matrix A according to the given deltaT or n:
%However, n in this case is subtracted by one because of 
%matrix set up; eg. deltaT = 0.1, then n = 9 with N = 10
n =  5;
b = [zeros(n-1, 1); (((exp(1))^(-1)) - (exp(1)))];
positions = [1: (n-1)];
b(positions) = 0

%To create my b vector, I made the following code:
dt = (1/n);
A = full(gallery('tridiag', n, 1, (-2-((dt)^2)), 1))

%To create my x0 vector, I made the following code:
x0=zeros(n,1);
vec(positions)=0;

%Chosen options
options.MaxIter=1000000;
options.Tol=1e-5;

