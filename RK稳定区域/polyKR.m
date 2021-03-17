function coeff=polyKR(k,theta)
%获得k阶RungeKutta公式绝对稳定表达式左端系数
syms R
rowlen=1;
collen=0;
for ii=1:k
    rowlen=rowlen+R^ii*cos(ii*theta)/factorial(ii);
    collen=collen+R^ii*sin(ii*theta)/factorial(ii);
end
coeff=sym2poly(rowlen^2+collen^2-1);%从表达式中获得系数