clear;
clc;
M=[2.5410 2.1120
   1.8720 1.5560];
E=[0.001 0.001
   -0.001 -0.002];
b=[4.653
   3.428];
   
function d=wz2(C);
    d=C(1,1)*C(2,2)-C(2,1)*C(1,2);
endfunction;

function ME=msum(M,E);
    ME=M+E;
endfunction;

function C=Cmk(ME,b,k);
    C=ME;
    C(:,k)=b;
endfunction

sum_mac=msum(M,E)
wyznacznik=wz2(sum_mac)
if(wyznacznik)==0 then
    disp("nie bajgla")
    else
    x1=wz2(Cmk(sum_mac,b,1))/wyznacznik
    mprintf("\nPierwszy x to: %f \n", x1);
    x2=wz2(Cmk(sum_mac,b,2))/wyznacznik
    mprintf("Drugi x to: %f", x2);
    end
