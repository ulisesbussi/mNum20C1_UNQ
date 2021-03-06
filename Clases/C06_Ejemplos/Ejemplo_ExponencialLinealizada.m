%% Ejemplo exponencial, linealización
%f = @(x) 2*exp(x/3) + rand(1,length(x));

x = 1:.5:7;
y= [3.0130, 3.4149, 4.1921, 4.9207, 5.8607,...
    6.9304, 7.6729, 9.2259, 11.3900, 12.5386,...
    15.7070, 18.1886, 21.1131];

y0 = [ 2.7912    3.2974    3.8955    4.6020    5.4366...
        6.4225    7.5873    8.9634   10.5890   12.5094 ...
        14.7781   17.4583   20.6245];

figure(1)
plot(x,y,'o')


%%

%---------Transformacion de datos -------
y1 = log(y);
%----------------------------------------

%grafico
figure(2)
plot(x,y1,'o')
hold on

%----------Ajuste------------------------
n = length(x);
sx = sum(x);
sy = sum(y1);

sx2 = sum(x.*x);
sxy= sum(x.*y1);

a1 = (n *sxy -sx*sy) / (n*sx2 -sx^2);
b1 = sy/n - a1*sx/n;
%-----------------------------------------


plot(x,a1*x+b1,'r')


%% Volviendo a las variables originales:

%---------vuelvo a var orig---------------

a= a1;
b=exp(b1);
%-----------------------------------------

%creo la funcion ajusta
fitted = @(x) b*exp(a*x);


%la grafico
figure(1)
hold on
plot(x,y,'o')
plot(x,fitted(x),'r')

%% Calculo del residual

%Sr = sum( (y-fitted(x)).^2);
Sr = sum( (y-  b*exp(a*x)  ).^2);
St = sum( (y -mean(y)).^2);

r2 =   (St-Sr)/St;
