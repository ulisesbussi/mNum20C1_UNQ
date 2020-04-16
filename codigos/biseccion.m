a=0;
b=1;

f=@(x) cos(x+1);

c=(a+b)/2;
err = abs(f(c));

if(f(a)*f(b))>0
    disp('Che, le erraste')
end    
    
i=0;

while err > 0.00000001
    i+=1;
    if f(a)*f(c)<0
        b = c;
    else
        a = c;
    end
    c=(a+b)/2;
    err = abs(f(c));
end

i
c