function simpson3_8(app,f,a,b,N)
    fx=str2func(['@(x)',f]);
    if N<3 
       app.ketqua_6.Value='N phải lớn hơn hoặc bằng 3';
       return
    elseif mod(N,3) ~=0
       app.ketqua_6.Value='N phải chia hết cho 3';
       return
    end
    h=(b-a)/N;
    L=fx(a)+fx(b);
    S=0;
    S1=0;
    if N==3
        Tong=h*(L+3*fx(a+h)+3*fx(a+2*h))*3/8;
    else
        for i=1:N-1 
            S=S+fx(a+i*h);
        end
        for i=3:3:N-1
            S=S-fx(a+i*h);
            S1=S1+fx(a+i*h);
        end
        Tong=(L+3*S+2*S1)*h*3/8;
    end
    app.ketqua_6.Value=sprintf("Nghiệm phương trình là %f\n",Tong);
end