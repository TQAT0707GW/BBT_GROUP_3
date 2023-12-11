    function Chiadoi(app,fx1,a,b,saiso)
            fx=str2func(['@ (x)',fx1]);
            fplot(app.UIAxes,fx);
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
            for i=1:2000
                c=(a+b)/2;
                if (fx(c)*fx(a))<0
                    b=c;
                else
                    a=c;
                end
                e=b-a;
       
                if e < saiso
                    break;
                end
            end
            if i>2000
               app.ketqua.Value=sprintf('Số lần lặp đã vượt quá 2000 lần');
               return
            else
               app.ketqua.Value=['Nghiệm phương trình là:',num2str(c),...
                "Số lần lặp là:",i ];
            end
        end