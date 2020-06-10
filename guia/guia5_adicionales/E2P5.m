function [x,y] = E2P5()
% E2P5 genera datos para el ejercicio 1 de la practica 5
% [x,y] = E2P5() 
% x es la variable independiente
% y es la variable dependiente
x = 5:.02:13;
y = 5 - exp(- (x-8).^2) +0.2*(x-8).^2;

end