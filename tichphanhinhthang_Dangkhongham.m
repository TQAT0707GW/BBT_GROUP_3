function tichphanhinhthang_Dangkhongham(app,a,b,N)
    if N>length(a)
       app.ketqua_6.Value='Nhập lại độ dài đoạn con';
       return
    end
    h=(a(length(a))-a(1))/N;
    L=(b(1)+b(length(b)))/2;
    y=0;
    for i=2:N
        y=y+2*b(i);
    end
    sum=L*h+y*h/2;
    app.ketqua_6.Value=sprintf("Nghiệm của phương trình là %f\n",sum);
end