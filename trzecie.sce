clear;
clc;
n=3;
a=-0.5;
b=2*%pi;
X=[0;%pi/4;%pi/2;3/2*%pi];
x_bar=9/10*%pi;
r=2;
function y=f(X);
   y=sin(X);
    
endfunction
for i=0:n
    Y(i+1)=f(X(i+1));
end

function y=phi(j,x,X,n);
    for i=0:(j-1)
        L(i+1)=x-X(i+1);
    end;
    for i=(j+1):n
        L(i)=x-X(i+1);
    end;
    for i=0:(j-1)
        M(i+1)=X(j+1)-X(i+1);
    end;
    for i=(j+1):n
        M(i)=X(j+1)-X(i+1);
    end;
    y=prod(L)/prod(M)
endfunction
function wynik=omega (x,X,n)
    wynik=1
    for i=0:n
        wynik=wynik*(x-X(i+1))
    end
    
endfunction
disp(omega(x_bar,X,n))

function y=W(x,n,X,Y)
    for j=0:n
        S(j+1)=Y(j+1)*phi(j,x,X,n); 
    end
    y=sum(S);
endfunction
disp(W(x_bar,n,X,Y));
