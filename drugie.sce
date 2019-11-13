//zadanie 2
clc;
clear;

M = [2.5410 2.1120
 1.8720 1.5560];

E = [0.0 0.0
 0.0 0.0];

b = [4.6530
 3.4280];

function d=wz2(C);
d=C(1,1)*C(2,2)-C(2,1)*(1,2);
endfunction;

function C=msum(A,B);
    C=A+B;
endfunction;

function C=Cmk(ME,b,k);
    C=ME;
    C(:,k)=b;
endfunction;

ME=msum(M,E);
detME=wz2(ME);

if detME<>0 then
    x(1)=wz2(Cmk(ME,b,1))/detME;
    x(2)=wz2(Cmk(ME,b,2))/detME;
    disp(x,"x=");
else
    disp("Wyznacznik główny zerowy - brak rozwiązań układu");
end;
