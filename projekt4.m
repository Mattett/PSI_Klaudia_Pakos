%%
close all; clear all; clc;

%wej�cia do sieci z min i max warto�ciami 
minmax=[0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 
    0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1;
    0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 
    0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1;
    0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 
    0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1;
    0 1; 0 1; 0 1; 0 1];

%ilo�� wyj�� z sieci 
ilosc_wyj = 64;

%u�ycie funkcji tworz�cej sie�
net = newff(minmax, ilosc_wyj,{'tansig'}, 'trainlm', 'learnh');

%kolumnowe wprowadzenie emotikon w formie 0-1
%        SMILE/SAD/KISS/CONFUSE
input  = [0 0 0 0;
          0 0 0 0;
          0 0 0 0;
          0 0 0 0;
          0 0 0 0;
          0 0 0 0;
          0 0 0 0;
          0 0 0 0;
          0 0 0 0; 
          0 0 0 0;
          1 1 1 1;
          0 0 0 0;
          0 0 0 0;
          1 1 1 1;
          0 0 0 0; 
          0 0 0 0;
          0 0 0 0;
          0 0 0 0;
          1 1 1 1;
          0 0 0 0;
          0 0 0 0;
          1 1 1 1;
          0 0 0 0;
          0 0 0 0;
          0 0 0 0;
          0 0 0 0;
          0 0 0 0;
          0 0 0 0;
          0 0 0 0;
          0 0 0 0;
          0 0 0 0;
          0 0 0 0;
          0 0 0 0; 
          1 0 0 0;
          0 0 0 0;
          0 1 0 0;
          0 1 0 0;
          0 0 1 0; 
          1 0 0 0;
          0 0 0 0;
          0 0 0 0;
          0 0 0 1; 
          1 1 0 1;
          0 0 1 1;
          0 0 1 1;
          1 1 0 1;
          0 0 0 1;
          0 0 0 0;
          0 0 0 0; 
          0 1 0 0;
          0 0 0 0;
          1 0 0 0;
          1 0 0 0;
          0 0 1 0;
          0 1 0 0;
          0 0 0 0;
          0 0 0 0;
          0 0 0 0;
          0 0 0 0;
          0 0 0 0;
          0 0 0 0;
          0 0 0 0;
          0 0 0 0;
          0 0 0 0;
          ]; 

%zmienna zawieraj�ca 1 gdy trafimy w emotikon i 0 gdy chybimy 
output = [ 1 0 0 0   %SMILE
           0 1 0 0   %SAD
           0 0 1 0   %KISS
           0 0 0 1]; %CONFUSE 

%parametry regu�y Hebba
lp.dr = 0.01; %wsp. zapominania
lp.lr = 0.001; %wsp. uczenia

%u�ycie regu�y Hebba
hebb = learnh( [], input, [], [], output, [], [], [], [], [], lp, []);
heb=hebb';

net.trainParam.epochs = 1000;
net.trainParam.goal = 0.001;
net.trainParam.lr=0.5;

%trenowanie sieci z u�yciem regu�y Hebba 
net = train(net, input, heb);
       
       
%DANE TESTUJACE
smile = [0 0 0 0 0 0 0 0;  0 0 1 0 0 1 0 0;  0 0 1 0 0 1 0 0;  0 0 0 0 0 0 0 0;  0 1 0 0 0 0 1 0;  0 0 1 0 0 1 0 0;  0 0 0 1 1 0 0 0;  0 0 0 0 0 0 0 0 ];
sad = [0 0 0 0 0 0 0 0;  0 0 1 0 0 1 0 0;  0 0 1 0 0 1 0 0;  0 0 0 0 0 0  0 0;  0 0 0 1 1 0 0 0;  0 0 1 0 0 1 0 0;  0 1 0 0 0 0 1 0;  0 0 0 0 0 0 0 0 ];
kiss=[0 0 0 0 0 0 0 0;  0 0 1 0 0 1 0 0;  0 0 1 0 0 1 0 0;  0 0 0 0 0 0 0 0;  0 0 0 0 0 1 0 0;  0 0 0 1 1 0 0 0;  0 0 0 0 0 1 0 0;  0 0 0 0 0 0 0 0 ];
confuse = [  0 0 0 0 0 0 0 0;  0 0 1 0 0 1 0 0;  0 0 1 0 0 1 0 0;  0 0 0 0 0 0 0 0;  0 0 0 0 0 0 0 0;  0 1 1 1 1 1 1 0;  0 0 0 0 0 0 0 0;  0 0 0 0 0 0 0 0 ];

%sprawdzenie poprawno�ci wytrenowanej sieci 
test = sim(net, smile);
test1 = sim(net, sad);
test2 = sim(net, kiss);
test3 = sim(net, confuse);



%wypisanie warto�ci 
disp('Warto�ci')
disp('SMILE ='), disp(test(1));
disp('SAD ='), disp(test1(2));
disp('KISS ='), disp(test2(3));
disp('CONFUSE ='), disp(test3(4));




