close all; clear all; clc;

%Mo�liwe warto�ci pocz�tkowe- 0 lub 1; 25 wejsc do sieci( bo litery 5x5)
start = [0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 
         0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1;];

%maksymalna ilosc wyjsc
exit = 1;

%metoda 1
%net = newlin(start, exit);

%metoda 2
net = newp(start, exit);    

%kolumnowa reprezentacja binarna pierwszych 10 liter alfabetu dla tablicy 5x5
     %A a B b C c D d E e F f H h I i K k L l
IN = [0 0 1 1 0 0 1 0 1 0 1 0 1 1 1 1 1 1 1 1;
      1 1 1 0 1 0 1 0 1 1 1 1 0 0 0 0 0 0 0 0;
      1 1 1 0 1 0 1 0 1 1 1 1 0 0 0 0 0 0 0 0; 
      1 0 0 0 1 0 0 1 1 0 1 0 0 0 0 0 1 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0;
           
       1 0 1 1 1 0 1 0 1 1 1 1 1 1 1 0 1 1 1 1;
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0;
       0 1 1 0 0 0 1 1 0 1 0 0 0 0 0 0 0 0 0 0;
       1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0;

       1 0 1 1 1 0 1 0 1 1 1 1 1 1 1 1 1 1 1 1;
       1 1 1 1 0 1 0 1 1 1 1 1 1 1 0 0 1 0 0 0;
       1 1 1 1 0 1 0 1 1 1 1 1 1 1 0 0 0 1 0 0;
       1 1 0 0 0 0 1 1 0 0 0 0 1 0 0 0 0 0 0 0;
       1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0;
        
       1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0;
       0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0;
       0 1 1 1 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0;
       1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0;
           
       1 0 1 1 0 0 1 0 1 0 1 1 1 1 1 1 1 1 1 1;
       0 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 1 1;
       0 1 1 1 1 1 1 1 1 1 0 0 0 1 0 0 0 1 1 1;
       0 1 0 0 1 0 0 1 1 0 0 0 0 0 0 0 1 0 1 0;
       1 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0;];
       %A a B b C c D d E e F f H h I i K k L l
OUT =  [1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0]; 

%parametry treningu sieci
net.trainParam.epochs = 10000;           %max ilosc epok
net.trainParam.goal = 0.01;              %blad 
net.trainParam.mu = 0.5;               %wspolczynnik uczenia 

%uczenie sieci 
net = train(net, IN, OUT);

%dane do testow 
A_test = [0; 1; 1; 1; 0;
          1; 0; 0; 0; 1;
          1; 1; 1; 1; 1;
          1; 0; 0; 0; 1;
          1; 0; 0; 0; 1];
         
a_test = [0; 1; 1; 0; 0;
          0; 0; 0; 1; 0;
          0; 1; 1; 1; 0;
          1; 0; 0; 1; 0;
          0; 1; 1; 1; 1];
    
B_test = [1; 1; 1; 0; 0;
          1; 0; 0; 1; 0;
          1; 1; 1; 0; 0;
          1; 0; 0; 1; 0;
          1; 1; 1; 0; 0];
      
b_test = [1; 0; 0; 0; 0;
          1; 0; 0; 0; 0;
          1; 1; 1; 0; 0;
          1; 0; 0; 1; 0;
          1; 1; 1; 0; 0];
    
C_test = [0; 1; 1; 1; 0;
          1; 0; 0; 0; 0;
          1; 0; 0; 0; 0;
          1; 0; 0; 0; 0;
          0; 1; 1; 1; 0];
      
c_test = [0; 0; 0; 0; 0;
          0; 0; 0; 0; 0;
          0; 1; 1; 0; 0;
          1; 0; 0; 0; 0;
          0; 1; 1; 0; 0];
    
D_test = [1; 1; 1; 0; 0;
          1; 0; 0; 1; 0;
          1; 0; 0; 1; 0;
          1; 0; 0; 1; 0;
          1; 1; 1; 0; 0];
      
d_test = [0; 0; 0; 1; 0;
          0; 0; 0; 1; 0;
          0; 1; 1; 1; 0;
          1; 0; 0; 1; 0;
          0; 1; 1; 1; 0];
    
E_test = [1; 1; 1; 1; 0;
          1; 0; 0; 0; 0;
          1; 1; 1; 0; 0;
          1; 0; 0; 0; 0;
          1; 1; 1; 1; 0];
      
e_test = [0; 1; 1; 0; 0;
          1; 0; 0; 1; 0;
          1; 1; 1; 0; 0;
          1; 0; 0; 0; 0;
          0; 1; 1; 0; 0];
    
F_test = [1; 1; 1; 1; 0;
          1; 0; 0; 0; 0;
          1; 1; 1; 0; 0;
          1; 0; 0; 0; 0;
          1; 0; 0; 0; 0];
      
f_test = [0; 1; 1; 0; 0;
          1; 0; 0; 0; 0;
          1; 1; 1; 0; 0;
          1; 0; 0; 0; 0;
          1; 0; 0; 0; 0];
    
H_test = [1; 0; 0; 0; 1;
          1; 0; 0; 0; 1;
          1; 1; 1; 1; 1;
          1; 0; 0; 0; 1;
          1; 0; 0; 0; 1];
      
h_test = [1; 0; 0; 0; 0;
          1; 0; 0; 0; 0;
          1; 1; 1; 0; 0;
          1; 0; 1; 0; 0;
          1; 0; 1; 0; 0];
    
I_test = [1; 0; 0; 0; 0;
          1; 0; 0; 0; 0;
          1; 0; 0; 0; 0;
          1; 0; 0; 0; 0;
          1; 0; 0; 0; 0];
      
i_test = [1; 0; 0; 0; 0;
          0; 0; 0; 0; 0;
          1; 0; 0; 0; 0;
          1; 0; 0; 0; 0;
          1; 0; 0; 0; 0];
    
K_test = [1; 0; 0; 1; 0;
          1; 0; 1; 0; 0;
          1; 1; 0; 0; 0;
          1; 0; 1; 0; 0;
          1; 0; 0; 1; 0];
      
k_test = [1; 0; 0; 0; 0;
          1; 0; 0; 0; 0;
          1; 0; 1; 0; 0;
          1; 1; 0; 0; 0;
          1; 0; 1; 0; 0];
    
L_test = [1; 0; 0; 0; 0;
          1; 0; 0; 0; 0;
          1; 0; 0; 0; 0;
          1; 0; 0; 0; 0;
          1; 1; 1; 1; 0];
      
l_test = [1; 0; 0; 0; 0;
          1; 0; 0; 0; 0;
          1; 0; 0; 0; 0;
          1; 0; 0; 0; 0;
          1; 1; 1; 0; 0];

%testowanie dzialania 
efect = [sim(net, a_test); sim(net, C_test); sim(net, d_test); sim(net, F_test); sim(net, h_test); sim(net, H_test); sim(net, i_test); sim(net, k_test); sim(net, L_test); sim(net, l_test)]

%wynik
if round(efect) == 0    
    disp('Litera mala');
else
    disp('Litera duza');
end