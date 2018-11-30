close all; clear all; clc;

%Wygenerowanie danych wejœciowych (-2.0, -1.9 ... 1.9 2.0)
wejscie=zeros(1);
m=-2;
for i=1:41
    wejscie(i)=m;
    m=m+0.1;
end
%wygenerowaie wartoœci funkcji Rastrigin 3D dla danych wejœciowych
wyjscie=zeros(1);
for i=1:41
    wyjscie(i)=rastrigin(wejscie(i));
end

%Inicjalizacja wartoœci testowych
test = zeros(1);
k=-1.15;
for i=1:10
    test(i)=k;
    k=k+0.25;
end

%Sprawdzenie poprawnej wartoœci funkcji dla wartoœci testowych
test_wynik = zeros(1);

for i=1:10
    test_wynik(i)=rastrigin(test(i));
end

%Tworzenie sieci z 4 warstwami ukrytymi
net = feedforwardnet(4);

%U¿ycie algorytmu wstecznej propagacji 
net.trainFcn = 'traingd';

%Dobranie wspó³czynników dla funkcji
%wspó³czynnik uczenia
net.trainParam.lr = 0.5;
% wspó³czynnik bezwladnoœci
net.trainParam.mc = 1; 

%Trenowanie sieci
net = train(net, wejscie, wyjscie);

%Inizjalizacja tablicy wynikowej 
wynik = zeros(size(net));

%Wywo³anie funkcji Rastrigin dla liczb z przedzia³u [-2,2]
for i = 1:41
    wynik(i) = sim(net, wejscie(i)); %Testowanie sieci
end   

for i = 1:41
fprintf('Dla %i : Wartoœæ funkcji %i, wartoœæ podana przez sieæ: %i \n',wejscie(i), wyjscie(i), wynik(i));
end 



test_wynik_siec = zeros(1);

for i=1:10
    test_wynik_siec(i)=sim(net, test(i));
end
fprintf('\n -----TEST------\n');
for i = 1:10
fprintf('Dla %i : Wartoœæ funkcji %i, wartoœæ podana przez sieæ: %i \n',test(i), test_wynik(i), test_wynik_siec(i));
end 

wynik2=wynik';
test_wynik_siec2=test_wynik_siec';