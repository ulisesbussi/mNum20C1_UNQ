function [t,x,y] = E1P5()
% E1P5 genera datos para el ejercicio 1 de la practica 5
% [t,x,y] = E1P5() 
% t es el vector de tiempos
% x es la coordenada x del móvil
% y es la coordenada y del móvil
t = 0:.1:5;
 
x = t + t.^2  ;
y = 3 + t- t.^3+0.2 * t.^4;

end