
%funkcja Rastrigin 3D- implementacja
function wynik = rastrigin(x)
    if x==0
        wynik=0;
    else
        x1=x;
        A=10;
        n=100;
        dx=(5.12-x)/n;
        wynik=A*n;
        for i=1:1:n
            x=x1+(i*dx);
            wynik=wynik+x^2-A*cos(2*pi*x);
        end
    end
end
















