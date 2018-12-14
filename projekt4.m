%%
close all; clear all; clc;

%wejœcia do sieci z min i max wartoœciami 
minmax=[0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 
    0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1;
    0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 
    0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1;
    0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 
    0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1;
    0 1; 0 1; 0 1; 0 1];

%iloœæ wyjœæ z sieci 
ilosc_wyj = 64;

%u¿ycie funkcji tworz¹cej sieæ
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

%zmienna zawieraj¹ca 1 gdy trafimy w emotikon i 0 gdy chybimy 
output = [ 1 0 0 0   %SMILE
           0 1 0 0   %SAD
           0 0 1 0   %KISS
           0 0 0 1]; %CONFUSE 

%parametry regu³y Hebba
lp.dr = 0.01; %wsp. zapominania
lp.lr = 0.001; %wsp. uczenia

%u¿ycie regu³y Hebba
hebb = learnh( [], input, [], [], output, [], [], [], [], [], lp, []);
heb=hebb';

net.trainParam.epochs = 1000;
net.trainParam.goal = 0.001;
net.trainParam.lr=0.5;

%trenowanie sieci z u¿yciem regu³y Hebba 
net = train(net, input, heb);
       
       
%DANE TESTUJACE
smile = [0 0 0 0 0 0 0 0;  0 0 1 0 0 1 0 0;  0 0 1 0 0 1 0 0;  0 0 0 0 0 0 0 0;  0 1 0 0 0 0 1 0;  0 0 1 0 0 1 0 0;  0 0 0 1 1 0 0 0;  0 0 0 0 0 0 0 0 ];
sad = [0 0 0 0 0 0 0 0;  0 0 1 0 0 1 0 0;  0 0 1 0 0 1 0 0;  0 0 0 0 0 0  0 0;  0 0 0 1 1 0 0 0;  0 0 1 0 0 1 0 0;  0 1 0 0 0 0 1 0;  0 0 0 0 0 0 0 0 ];
kiss=[0 0 0 0 0 0 0 0;  0 0 1 0 0 1 0 0;  0 0 1 0 0 1 0 0;  0 0 0 0 0 0 0 0;  0 0 0 0 0 1 0 0;  0 0 0 1 1 0 0 0;  0 0 0 0 0 1 0 0;  0 0 0 0 0 0 0 0 ];
confuse = [  0 0 0 0 0 0 0 0;  0 0 1 0 0 1 0 0;  0 0 1 0 0 1 0 0;  0 0 0 0 0 0 0 0;  0 0 0 0 0 0 0 0;  0 1 1 1 1 1 1 0;  0 0 0 0 0 0 0 0;  0 0 0 0 0 0 0 0 ];

%sprawdzenie poprawnoœci wytrenowanej sieci 
test = sim(net, smile);
test1 = sim(net, sad);
test2 = sim(net, kiss);
test3 = sim(net, confuse);



%wypisanie wartoœci 
disp('Wartoœci')
disp('SMILE ='), disp(test(1));
disp('SAD ='), disp(test1(2));
disp('KISS ='), disp(test2(3));
disp('CONFUSE ='), disp(test3(4));




