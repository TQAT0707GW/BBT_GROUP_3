    function Tieptuyen(app,fx1,a,b,saiso)
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
            fx=str2func(['@(x)',fx1]);
            fplot(app.UIAxes,fx);
            syms x;
            df=diff(fx(x),x);
            df2=diff(fx(x),x,2);
             if fx(a)*fx(b) > 0
                app.ketqua.Value=sprintf('Khoảng phân ly sai\n Hãy chọn lại a và b');
                return
            elseif fx(a)==0
                app.ketqua.Value=sprintf('Hàm số có nghiệm x=%d',a);
                return
            elseif fx(b)==0
                app.ketqua.Value=sprintf('Hàm số có nghiệm x=%d',b);
                return
            end
            if df2==0
                ham1=solve(fx,x);
                app.ketqua.Value=['Nghiệm phương trình: ',char(string(ham1))];
                return;
            end 
            
            %matlabFunction:đưa về dạng hàm
            df=matlabFunction(df);
            x0=0;
            x1=0;
            tieptuc=0;%biến cờ
            numdf2=string(expand(df2));
            df2=matlabFunction(df2);
            numdf2=str2num(numdf2); %Kiểm tra xem đạo hàm cấp 2 có phải là hàm hay số hay là chuỗi
            clear x;
            % Kiểm tra sự hội tụ của hàm số cấp 1
            if df(a)*df(b) < 0
               app.ketqua.Value=sprintf('Đạo hàm F(x) cấp 1 không hội tụ trên khoảng [%d %d]\n',a,b);
               return
            end
            % Ở bài này liên qua đến đạo hàm cấp 2 nên phải xem xét hàm
            % F(x) xem có phải bậc 2 hay không
            %Nếu F(x) là bậc 2 thì khi đạo hàm cấp 2 hàm số luôn liên tục
            %và không thay cận vào được nên phải chia ra hai trường hợp
            % Trường hợp 1: Là hàm F(x) là bậc 2
            %Trường hợp 2: Hàm F(x) là bậc khác bậc 2
            if isempty(numdf2)
                tieptuc=1;%Nếu hàm F(x) là hàm khác bậc 2 thì cờ tieptuc bật lên 1
                % Còn không phải thì cờ tieptuc bật về 0
                if df2(a)*df2(b) < 0 %Kiểm tra sự hội tụ của hàm số cấp 2
                    app.ketqua.Value=sprintf('Đạo hàm F(x) cấp 2 không hội tụ trên khoảng [%d %d]\n',a,b);
                    return
                end
            else  
                temp=b;
                temp1=a;
                if numdf2 > 0
                    if fx(temp) > 0
                        x0=temp;
                    else
                        x0=temp1;
                    end
                else
                    if fx(temp) <0
                        x0=temp;
                    else 
                        x0=temp1;
                    end
                end
            end
            if tieptuc==1
                if df2(a)==0
                    temp=b;
                    temp1=a;
                else
                    temp=a;
                    temp1=b;
                end
                %Chọn cận a hoặc b trước khi bắt đầu thuật toán
                if fx(temp)*df2(temp) >0
                    x0=temp;
                elseif fx(temp)*df2(temp) <0
                    x0=temp1;
                end
            end
            %============Thuật toán=================
            for i=1:2000
                phi=x0-fx(x0)/df(x0);
                x1=phi;       
                if abs(x1-x0)<saiso
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