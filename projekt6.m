close all; clear all; clc;

%kolumnowa reprezentacja binarna pierwszych 20 duzych liter alfabetu dla tablicy 4x5
%dane wejsciowe:
          %A B C D E F G H I J K L M N O P R S T U
WEJSCIE = [0 1 0 1 1 1 0 1 1 1 1 1 1 1 0 1 1 0 1 1;
           1 1 1 1 1 1 1 0 1 1 0 0 0 0 1 1 1 1 1 0;
           1 1 1 1 1 1 1 0 1 1 0 0 0 0 1 1 1 1 1 0;
           0 0 0 0 1 1 0 1 0 1 1 0 1 1 0 0 0 0 0 1;
              
           1 1 1 1 1 1 1 1 0 0 1 1 1 1 1 1 1 1 0 1;
           0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 1 0;
           0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0;
           1 1 1 1 0 0 0 1 0 1 0 0 1 1 1 1 1 0 0 1;
           
          %A B C D E F G H I J K L M N O P R S T U 
           1 1 1 1 1 1 1 1 0 0 1 1 1 1 1 1 1 0 0 1;
           1 1 0 0 1 1 0 1 1 0 1 0 0 1 0 1 1 1 1 0;
           1 1 0 0 1 1 1 1 0 0 0 0 1 0 0 1 1 1 0 0;
           1 0 0 1 0 0 1 1 0 1 0 0 1 1 1 0 0 0 0 1;
        
           1 1 1 1 1 1 1 1 0 1 1 1 1 1 1 1 1 0 0 1;
           0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0;
           0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 1 0 0 0;
           1 1 1 1 0 0 1 1 0 1 0 0 1 1 1 0 0 1 0 1;
           
           1 1 0 1 1 1 0 1 1 0 1 1 1 1 0 1 1 0 0 0;
           0 1 1 1 1 0 1 0 1 1 0 1 0 0 1 0 0 1 1 1;
           0 1 1 1 1 0 1 0 1 1 0 1 0 0 1 0 0 1 0 1;
           1 0 0 0 1 0 0 1 0 1 1 1 1 1 0 0 1 0 0 0];
          %A B C D E F G H I J K L M N O P R S T U 

% PARAMETRY SIECI KOHONENA
dimensions   = [4 5];           %wymiar wektora
coverSteps   = 100;             %liczba krok�w szkoleniowych dla pocz�tkowego pokrycia przestrzeni wej�ciowej
initNeighbor = 1;               %pocz�tkowy rozmiar s�siedztwa
%topologyFcn  = 'gridtop';       %funkcja topologii warstw
topologyFcn  = 'hextop';       %funkcja topologii warstw
distanceFcn  = 'dist';          %funkcja odleg�o�ci neuronowej

% TWORZENIE SIECI KOHONENA (SOM)
net = selforgmap(dimensions, coverSteps, initNeighbor, topologyFcn, distanceFcn);
net.trainParam.epochs = 500;   %ustalenie maksymalnej liczby epok treningowych utworzonej sieci

% TRENING SIECI
[net, tr] = train(net, WEJSCIE);%uczenie sieci
y = net(WEJSCIE);               %sprawdzenie dzia�ania sieci
figure, pcolor(y); title('Dane wej�ciowe'); %wy�wietlenie mapy dla danych pocz�tkowych
xlabel('Kolejne litery alfabetu'); ylabel('przyporz�dkowana grupa');