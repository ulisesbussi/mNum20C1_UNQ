clc;                                               
clear all;
h=0.8;                                             
t=1:h:50;

S = zeros(1,length(t));
I = zeros(1,length(t));
R = zeros(1,length(t));


S(1) = 64340;
I(1) = 1;
R(1) = 0;        
   
gamma=0.3;
beta=0.000013;

Sp = @(S, I) -beta*S*I;
Ip = @(S, I) beta*S*I-gamma*I;
Rp = @(S, I) gamma*I;

for i=1:(length(t)-1)                             

    k_1 = Sp(S(i),I(i));
    k_2 = Sp(S(i)+0.5*h,I(i)+0.5*h*k_1);
    k_3 = Sp((S(i)+0.5*h),(I(i)+0.5*h*k_2));
    k_4 = Sp((S(i)+h),(I(i)+k_3*h));
    S(i+1) = S(i) + (1/6)*(k_1+2*k_2+2*k_3+k_4)*h; 
    
    k_1 = Ip(S(i),I(i));
    k_2 = Ip(S(i)+0.5*h,I(i)+0.5*h*k_1);
    k_3 = Ip((S(i)+0.5*h),(I(i)+0.5*h*k_2));
    k_4 = Ip((S(i)+h),(I(i)+k_3*h));
    I(i+1) = I(i) + (1/6)*(k_1+2*k_2+2*k_3+k_4)*h; 
    
    k_1 = Rp(S(i),I(i));
    k_2 = Rp(S(i)+0.5*h,I(i)+0.5*h*k_1);
    k_3 = Rp((S(i)+0.5*h),(I(i)+0.5*h*k_2));
    k_4 = Rp((S(i)+h),(I(i)+k_3*h));
    R(i+1) = R(i) + (1/6)*(k_1+2*k_2+2*k_3+k_4)*h; 

end

hold on
plot(t,S)
plot(t,I)
plot(t,R)

legend({'Susceptibles','Infectados','Recuperados'},'Location','southeast')
