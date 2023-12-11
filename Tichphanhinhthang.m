function Tichphanhinhthang(app,f,a,b,N)
    fx=str2num(['@(x)',f]);
    h=(b-a)/N;
    L=(fx(a)+fx(b))/2;
    y=0;
    for i=1:N-1
        x=a+i*h;
        y=y+fx(x);
    end
    sum=L*h+y*h;
    app.ketqua_6.Value=sprintf("Nghiệm phương trình là %f\n",sum);
end