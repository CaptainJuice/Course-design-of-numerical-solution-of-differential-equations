function answer=solvepoly(coeff)
%二分法解方程
k=length(coeff)-1;
range=linspace(0,3,31);
range(end)=[];
answer=[];
for left=range
    right=left+0.1;
    mid=(left+right)/2;
    while(abs(polyval(coeff,mid))>0.01 && right-left>0.01)
        if(polyval(coeff,mid)*polyval(coeff,left)>0)
            left=mid;
        else 
            right=mid;
        end
        mid=(left+right)/2;
    end
    if(abs(polyval(coeff,mid))<=0.01)
        answer(end+1)=mid;
    end
end

        
