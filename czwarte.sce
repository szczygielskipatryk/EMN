clear;
clc;
X=[1;2;3;5;5;6;7;8];
n=7;
x_dach=%pi/2
function Y=f(X);
for i=0:n
    Y(i+1)=sin(X(i+1));
end
endfunction
Y=f(X)

function wynik=omega (x,X,n)
    wynik=1
    for i=0:n
        wynik=wynik*(x-X(i+1))
    end
endfunction
function wynik=odle(X,n)
    hi=X(2)-X(1)
    wynik=[1,hi];
    for i=2:n-1;
        h=X(i+1)-X(i);
        if h~=hi then
            wynik=[0,0];
            break;
        end
    end
endfunction

D=zeros(n+1,n+1);
D(:,1)=Y;
if odle(X,n)(1)==1 then
    h=odle(X,n)(2);
    for k=1:n
        for i=0:(n-k)
            D(i+1,k+1)=D(i+2,k)-D(i+1,k)
        end
    end
    Tmp(i+1)=D(1,1);
    for i=1:k
        Tmp(i+1)=(D(1,i+1)*omega(x_dach,X,i-1))/(factorial(i)*h^i)
    end
    Wn=sum(Tmp);
            
else
           for k=1:n
        for i=0:(n-k)
            D(i+1,k+1)=(D(i+2,k)-D(i+1,k))/(X(i+k+1)-X(i+1));
        end
    end
    Tmp(i+1)=D(1,1);
    for i = 1:k
        Tmp(i+1)=(D(1,i+1)*omega(x_bar,X,i-1));
    end;
    Wn=sum(Tmp);
end
disp(Wn)
