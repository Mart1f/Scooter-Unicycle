
%% Control PI
clc
clf
clear all
close all
TL=0.025  %Tiempo de retardo
ts=0.001; %Tiempo de muestreo

%Calculo de la pendiente
Kmax=0.4745;
K63=0.4745*0.63;
K10=0.4745*0.1;

T63=0.167;
T10=0.025;

m=(K63-K10)/(T63-T10)  %Pendiente del flanco de subida

%Calculo de las variables de control
kc=0.9/(TL*m);
kp=kc;

ti=3.3*TL;
ki=kc/ti;

%Discretización
kik=ki*ts;
kpk=kp;  %Euler en adelanto
%kpk=kp-kik/2 %Trapezoidal

%% Control PID
clc
clf
clear all
close all
TL=0.025  %Tiempo de retardo
m=1.771; %Pendiente flanco de subida
ts=0.001; %Tiempo de muestreo

%Calculo de la pendiente
Kmax=0.4745;
K63=0.4745*0.63;
K10=0.4745*0.1;

T63=0.167;
T10=0.025;

kc=1.2/(TL*m);
kp=kc;

ti=2*TL;
td=0.5*TL;

ki=kc/ti;
kd=kc*td;

%Discretización
kik=ki*ts;
kpk=kp;  %Euler en adelanto
%kpk=kp-kik/2 %Trapezoidal
kdk=kd/ts;
