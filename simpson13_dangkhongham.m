function simpson13_dangkhongham(app,a,b,N)
    if N>length(a) || N<4
       app.ketqua_6.Value='Nhập lại độ dài đoạn con(lớn hơn 3)';
       return
    end
    L=b(1)+b(length(b));
    h=(a(length(a))-a(1))/N;
    S=0;
    S1=0;
    for i=2:2:N
        S=S+b(i);
    end 
    for j=3:2:N-1
        S1=S1+b(j);
    end
    Tong=(S1*2+L+S*4)*h/3;
    app.ketqua_6.Value=sprintf("Nghiệm phương trình là %f\n",Tong);
end