  function [P, result] = newton_interpolation(xa, ya, xi)
    n = length(xa);
    d = ya;
    for i = 1:n
        for j = 1:i-1
            d(i) = (d(j) - d(i)) / (xa(j) - xa(i));
        end
    end
    da = d;
    n= length(da);
    result = da(n);
    syms x;
    for i = n-1:-1:1
        result = result * (x - xa(i)) + da(i);
    end
    P = expand(result);
    F=matlabFunction(P);
    P=vpa(P,4);
    result=F(xi);
end