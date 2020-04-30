
%Punto Fijo
%f(x) =x^2-x-1

x = -5:0.1:5;


%f = @(x) x.^2-x-1;
f = @(x) exp(-x) -x;
g = @(x) f(x)+x;

figure(1)
plot( x, f(x) )
hold on
grid on

figure(2)
plot(x, g(x) )
hold on
plot(x,x,'r')
grid on


%%
%Algoritmo de punto fijo

x0 = 5;
% x1 = g(x0);
% x2 = g(x1);
% x3 = g(x2);
r = x0; %candidatos a raices
i = 1;
funcEval = f(r(1));

maxIter = 100;

while(abs(funcEval)>1e-5 && i<maxIter)
   r(i+1) = g( r(i) ); 
   funcEval = f(r(i+1)) ;
   i = i+1;
end



%%

fAbs= @(x) abs(f(x));

figure()
plot(fAbs(r),'o')


