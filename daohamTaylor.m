function dx = daohamTaylor(x,y,h,Oh,giatricantinh,pp)
    for i=1:length(x)
        if giatricantinh==x(i)
            break;
        end
    end
    Oh = strcmp(Oh,'O(h)');
    k=1;
    f=y;%Vì truyền y nên cần y=f(x)
    dx=0;
    switch pp
        case 'Tien'
    if Oh==1
        heso=[-1 1];
        dx=(f(i)*heso(k)+f(i+1)*heso(k+1))/h;
    else
        heso=[-3 4 -1];
        dx=(f(i)*heso(k)+f(i+1)*heso(k+1)+f(i+2)*heso(k+2))/(2*h);
    end
        case 'Lui'
     if Oh==1
         heso=[1 -1];
         dx=(f(i)*heso(k)+f(i-1)*heso(k+1))/h;
     else
        heso=[3 -4 1];
        dx=(f(i)*heso(k)+f(i-1)*heso(k+1)+f(i-2)*heso(k+2))/(2*h);
    end
        case 'TrungTam'
     if Oh==1
       heso=[-1 0 1];
       dx=(f(i-1)*heso(k)+f(i)*heso(k+1)+f(i+1)*heso(k+2))/(2*h);
     else
       heso=[1 -8 0 8 -1];
       for n=2:-1:-2
            dx=dx+f(i-n)*heso(k);
            k=k+1;
       end
       dx=dx/(12*h);
     end
    end
end
% clear;clc
% x = [0,0.25,0.5,0.75,1]
% y = [1.2 1.1035156 0.925 0.6363281 0.2]
% h = 0.25
% xi = 0.5
% pp = 'Lui'; pp = 'Tien'; pp = 'TrungTam';
% oh = 'O(h^2)'
% dx = daohamTaylor(x,y,h,oh,xi,pp)