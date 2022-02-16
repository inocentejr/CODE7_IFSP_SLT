clear all
close all
clc

%% Simula��o do Motor

J = 0.01 %In�rcia do rotor [kgm�/s�]
B = 0.1 %Atrito viscoso do rotor [Nms]
Kv = 0.01
Kt = 0.01
Ra = 1 %Resist�ncia el�trica da armadura [Ohm]
La = 0.5 %Indut�ncia da armadura [H]

s = tf('s')

G = Kt/((J*s+B)*(Ra+La*s)+Kv*Kt)
step(G)

%% Controlador
Kp = 100
Ki = 10
Kd = 1

K = Kp+1/s*Ki+s*Kd

%% Malha Fechada
%T = K*G/(1+K*G)
T = feedback(K*G,1)
figure
step(T)