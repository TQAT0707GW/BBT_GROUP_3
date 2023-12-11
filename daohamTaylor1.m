% đầu vào là hàm số
function dx = daohamTaylor1(fxi,h,oh,x,pp)
   fx = str2func(['@(x)',fxi]);
   oh = strcmp(oh,'O(h)');
   switch pp
       case 'Tien'
   if oh == 1  % he so cat cut o(h)
            dx = (-fx(x) + fx(x+h)) / (h);
   else
           dx = (-3*fx(x) + 4* fx(x+h) - fx(x+2*h)) / (2*h); % heso cat cut o(h^2)
   end
      case 'Lui'
           if oh==1 % he so cat cut o(h)
           dx = (-fx(x-h) + fx(x))/ h;
          else
            dx = (fx(x - 2*h) -4*fx(x-h) + 3*fx(x)) / (2*h);
           end
       case 'TrungTam'
           if oh == 2
                dx = (-fx(x-h) + fx(x+h)) / (2*h);
          else 
                dx = (-fx(x+2*h) + 8*fx(x+h) -8*fx(x-h) + fx(x - 2*h))/ (12*h);
           end
   end
end
%clear;clc
% fxi  = '-0.1*x^4 - 0.15*x^3 -0.5*x^2 -0.25*x +1.2'
% h = 0.25
% x = 0.5
% oh = 'O(h^2)'
% pp = 'Lui'; pp = 'Tien'; pp = 'TrungTam'
% dx = daohamTaylor1(fxi,h,oh,x,pp)