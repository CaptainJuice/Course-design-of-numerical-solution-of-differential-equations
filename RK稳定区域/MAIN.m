clear;clc
figure
for k=4:-1:1
    fprintf("K=%d\n",k);
    bar = waitbar(0,'计算数据中...');
    x=[];
    y=[];
    t=[];
    r=[];
    count=1;
    for theta=linspace(0,2*pi,3600)
        coeff=polyKR(k,theta);
        R=solvepoly(coeff);
        for jj=1:length(R)
            x(end+1)=R(jj)*cos(theta);
            y(end+1)=R(jj)*sin(theta);
            %t(end+1)=theta;
            %r(end+1)=R(jj);
        end
        str=['计算中...',num2str(100*count/3600),'%']; 
        count=count+1;
        waitbar(count/3600,bar,str)  
    end
    close(bar)
    plot(x,y,'.');
    %polarplot(t,r);
    hold on;
end
title("Runge Kutta 绝对稳定范围");
xlabel("x");
ylabel("y");
legend("K=4","K=3","K=2","K=1");
