A=[1 2 3 4; 1 1 -3 4; 2 1 3 4; 1 -2 1 4];
b=[1 2 3 4];

[m,n]=size(A);
Aex=[A b'];

n;

for k=1:n-1
    for i = k+1:n
        factor=Aex(i,k)/Aex(k,k);
        for j =k : n+1
            Aex(i,j)=Aex(i,j)-factor*Aex(k,j);
        end
    end
end

x=zeros(n,1);

x(n)=Aex(n,n+1)/Aex(n,n);



for i =n-1:-1:1
    factor=0;
    for j=i+1:n
        factor+=Aex(i,j)*x(j);
    end
    x(i)=(Aex(i,n+1)-factor)/Aex(i,i);
end

disp(x)