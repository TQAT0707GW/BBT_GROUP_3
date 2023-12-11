function simpson13(app,f,a,b,N)
    if N<4
       app.ketqua_6.Value='Độ dài N phải lớn hơn 3';
       return
    end
    fx=str2func(['@(x)',f]);
    fx1=(fx(a)+fx(b));
    h=(b-a)/N;
    S=0;
    S1=0;
    for i=1:2:N-1
        S=S+fx(a+i*h);
    end 
    for j=2:2:N-1
        S1=S1+fx(a+j*h);
    end
    Tong=(S1*2+fx1+S*4)*h/3;
    app.ketqua_6.Value=sprintf("Nghiệm phương trình là %f\n",Tong);
end