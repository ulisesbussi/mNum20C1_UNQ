

tna = 0.277;
tnaTruncada = 0.27;
capitalInicial = 1000;

x1 = capitalInicial * (1 + tna/12);
x2 = capitalInicial * (1 + tna/12)*(1 + tna/12);
x2 = x1 * (1 + tna/12);
x3 = capitalInicial * (1 + tna/12)*(1 + tna/12)*(1 + tna/12);


meses = 1:200;

capital = zeros(1,200);
capital(1)= capitalInicial;

capitalAprox = zeros(1,200);
capitalAprox (1)= capitalInicial;


for mes=meses
    capital(mes) = capitalInicial * (1 + tna/12)^ mes;
    capitalAprox(mes) = capitalInicial * (1 + tnaTruncada/12)^ mes;
end


figure(1)
hold on

plot(meses,capital)
plot(meses,capitalAprox)



figure(2)
hold on
plot(meses,capital-capitalAprox)


e_r = abs(capital-capitalAprox)  ./ capital;

figure(3)
hold on
plot(meses,e_r)
