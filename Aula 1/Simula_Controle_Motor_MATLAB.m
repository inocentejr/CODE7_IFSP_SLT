clear all
close all
clc

%% Simulação do Motor

J = 0.01 %Inércia do rotor [kgm²/s²]
B = 0.1 %Atrito viscoso do rotor [Nms]
Kv = 0.01
Kt = 0.01
Ra = 1 %Resistência elétrica da armadura [Ohm]
La = 0.5 %Indutância da armadura [H]

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