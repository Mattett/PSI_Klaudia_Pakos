close all; clear all; clc;

WEJSCIE = iris_dataset;     %dane wejsciowe
size(WEJSCIE);              %okreslenie rozmiaru tablicy
x=1:50;
plot(WEJSCIE(1, x), WEJSCIE(2, x), 'r.', WEJSCIE(3, x), WEJSCIE(4, x), 'r*');
hold on; grid on; 
x=51:100;
plot(WEJSCIE(1, x), WEJSCIE(2, x), 'b.', WEJSCIE(3, x), WEJSCIE(4, x), 'b*');
hold on; grid on;
x=101:150;
plot(WEJSCIE(1, x), WEJSCIE(2, x), 'g.', WEJSCIE(3, x), WEJSCIE(4, x), 'g*');
legend('Platki Setosa','Kielichy Setosa','Platki Versicolor','Kielichy Versicolor','Platki Virginica','Kielichy Virginica'); %legenda
hold on; grid on;           % wyœwietlenie danych wejœciowych

% PARAMETRY SIECI KOHONENA
dimensions   = [10, 10];     %wymiar wektora
coverSteps   = 100;         %liczba kroków szkoleniowych dla pocz¹tkowego pokrycia przestrzeni wejœciowej
initNeighbor = 0;           %pocz¹tkowy rozmiar s¹siedztwa
topologyFcn  = 'hextop';    %funkcja topologii warstw
distanceFcn  = 'dist';      %funkcja odleg³oœci neuronowej

% TWORZENIE SIECI KOHONENA (SOM)
net = selforgmap(dimensions, coverSteps, initNeighbor, topologyFcn, distanceFcn);
net.trainParam.epochs = 500;%ustalenie maksymalnej liczby epok treningowych utworzonej sieci

% TRENING SIECI
[net, tr] = train(net, WEJSCIE);
%wartoœci testowe
test=[  5.0 	3.2 	1.2 	0.2 ;	
        5.5 	3.5 	1.3 	0.2 ;	
        4.9 	3.6 	1.4 	0.1 ;	
        4.4 	3.0 	1.3 	0.2 ;	
        5.1 	3.4 	1.5 	0.2 ;	
        5.0 	3.5 	1.3 	0.3 ;	
        4.5 	2.3 	1.3 	0.3 ;	
        4.4 	3.2 	1.3 	0.2 ;	
        5.0 	3.5 	1.6 	0.6 ;	
        5.1 	3.8 	1.9 	0.4 ;	
        4.8 	3.0 	1.4 	0.3 ;	
        5.1 	3.8 	1.6 	0.2 ;	
        4.6 	3.2 	1.4 	0.2 ;	
        5.3 	3.7 	1.5 	0.2 ;	
        5.0 	3.3 	1.4 	0.2 ;	
        7.0 	3.2 	4.7 	1.4 ;	
        6.4 	3.2 	4.5 	1.5 ;	
        6.9 	3.1 	4.9 	1.5 ;	
        5.5 	2.3 	4.0 	1.3 ;	
        6.5 	2.8 	4.6 	1.5 ;	
        5.7 	2.8 	4.5 	1.3 ;	
        6.3 	3.3 	4.7 	1.6 ;	
        4.9 	2.4 	3.3 	1.0 ;	
        6.6 	2.9 	4.6 	1.3 ;	
        5.2 	2.7 	3.9 	1.4 ;	
        5.0 	2.0 	3.5 	1.0 ;	
        5.9 	3.0 	4.2 	1.5 ;	
        6.0 	2.2 	4.0 	1.0 ;	
        6.1 	2.9 	4.7 	1.4 ;	
        5.6 	2.9 	3.6 	1.3; 	
        6.3 	3.3 	6.0 	2.5 ;	
        6.5 	3.0 	5.5 	1.8 ;	
        7.7 	3.8 	6.7 	2.2 ;	
        7.7 	2.6 	6.9 	2.3 ;	
        6.0 	2.2 	5.0 	1.5 ;	
        6.9 	3.2 	5.7 	2.3 ;	
        5.6 	2.8 	4.9 	2.0 ;	
        7.7 	2.8 	6.7 	2.0 ;	
        6.3 	2.7 	4.9 	1.8 ;	
        6.7 	3.3 	5.7 	2.1 ;	
        7.2 	3.2 	6.0 	1.8 ;	
        6.2 	2.8 	4.8 	1.8 ;	
        6.1 	3.0 	4.9 	1.8 ;	
        6.4 	2.8 	5.6 	2.1 ;	
        7.2 	3.0 	5.8 	1.6 ;	];
    test=test';
    
%wyswietlenie wartoœci testowych    
x=1:15;  
plot(test(1, x), test(2, x), 'y.', test(3, x), test(4, x), 'y*');
hold on; grid on; 
x=16:30;
plot(test(1, x), test(2, x), 'm.', test(3, x), test(4, x), 'm*');
hold on; grid on;
x=31:45;
plot(test(1, x), test(2, x), 'c.', test(3, x), test(4, x), 'c*');
legend('Platki Setosa','Kielichy Setosa','Platki Versicolor','Kielichy Versicolor','Platki Virginica','Kielichy Virginica','Platki Setosa-test','Kielichy Setosa-test','Platki Versicolor-test','Kielichy Versicolor-test','Platki Virginica-test','Kielichy Virginica-test'); %legenda
xlabel('D³ugoœæ'),ylabel('Szerokoœæ');
hold on; grid on;           % wyœwietlenie danych wejœciowych


y = net(test); %testowanie sieci dla danych testowych
y2=net(WEJSCIE);%testowanie sieci dla danych wejœciowych

figure, pcolor(y); title('Dane testowe'); %wyœwietlenie mapy dla danych testowych
figure, pcolor(y2); title('Dane wejœciowe'); %wyœwietlenie mapy dla danych pocz¹tkowych
