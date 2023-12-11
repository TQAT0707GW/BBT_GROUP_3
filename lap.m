    function lap(app,fx1,fp1,a,b,saiso)
            %Hàm fx: Hàm nhập từ bên ngoài
            %a:cận trên
            %b: cận dưới
            %saiso
            % Hàm diff: dùng để đạo hàm hàm số F(x) và hàm G(x)
            % Trong bài này đầu tiên em kiểm tra hai cận a và b
            %Nếu hàm số F(x) thay hai cận trên vào mà bằng 0 thì 1 trong
            %hai cận đó là nghiệm
            %Tiếp theo là đạo hàm F(x) 2 lần xem có phải fx là hàm bậc 1 không
            %Nếu đúng thì hãy nhập lại hàm khác
            fx=str2func(['@(x)',fx1]); %Dùng để tạo thành 1 hàm ẩn danh
            syms x;
            fplot(app.UIAxes,fx); %fplot:dùng để vẽ hàm số
            df2=diff(fx(x),x,2);
            if df2==0
                y=solve(fx,x);
                app.ketqua.Value=['Nghiệm phương trình: ',char(string(y))];
                return;
            end           
            if fx(a)*fx(b) >0
                app.ketqua.Value=sprintf('Khoảng phân ly sai\n Hãy chọn lại a và b');
                return
            elseif fx(a)==0
                app.ketqua.Value=sprintf('Hàm số có nghiệm x=%d',a);
                return
            elseif fx(b)==0
                app.ketqua.Value=sprintf('Hàm số có nghiệm x=%d',b);
                return
            end
            %Tiếp theo là đạo hàm G(x) và kiểm tra G(x) xem có thỏa điều
            %kiện G'(x) <1
            %Nếu thỏa điều kiện thì bắt đầu thực hiện thuật toán
            fp=str2func(['@(x)',fp1]);
            fx2=diff(fp(x),x);
            fx2=matlabFunction(fx2);
            clear x;
            if fx2(a)>1 || fx2(b)>1
                app.ketqua.Value=sprintf('Hàm G(x) sai\nHãy nhập lại G(x)');
                %y=0;g=-3;
                return
            end
            %=============Thuật toán===========
            %Nếu số lần lặp lớn hơn 2000 thì sẽ báo lỗi số lần lặp quá lớn 
            c=(a+b)/2;
            if fx(a) * fx(c) <0
                x0=a;
            else
                x0=b;
            end
            x1=fp(x0);
            for i=1:2000
                x1=fp(x0);
                if abs(x1-x0) < saiso
                    break;
                end
                x0=x1;
            end
            if i>2000
                app.ketqua.Value=sprintf('Số lần lặp đã vượt quá 2000 lần');
                return
            else
                app.ketqua.Value=['Nghiệm phương trình là:',num2str(x1),...
                "Số lần lặp là:",i ];
            end
            
        end