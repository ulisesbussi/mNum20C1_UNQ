
f = @(x) 3 +2*x + 2*x.^2 + rand(1,length(x));

x = -3:0.2:3;
y = f(x);

plot(x,y,'o')


n= length(x);

sy  = sum(y);
sxy = sum(y.*x);
sx2y= sum(y.*(x.^2));

sx = sum(x);
sx2 = sum(x.^2);
sx3 = sum(x.^3);
sx4 = sum(x.^4);


A =[n,sx,sx2;
    sx,sx2,sx3;
    sx2,sx3,sx4];
b=[sy;sxy;sx2y];

%%
coeffs = A\b;%resuelvo el sistema

fitted = @(x) coeffs(1) + coeffs(2)*x  +  coeffs(3)*(x.^2);


figure()
hold on
plot(x,y,'o')
plot(x,fitted(x),'r')