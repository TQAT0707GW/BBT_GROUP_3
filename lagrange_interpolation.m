function [P, Px] = lagrange_interpolation(xa, ya, xi)
    syms x;
    n = length(xa);
    P = 0;
    
    for i = 1:n
        L = 1;
        for j = 1:n
            if j ~= i
                L = L * (x - xa(j)) / (xa(i) - xa(j));
            end
        end
        P = P + ya(i) * L;
    end
    P = expand(P);
    F=matlabFunction(P);
    Px=F(xi);
   
end