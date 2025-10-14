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

%%
%calculos PD
angcero=80;
xc=8-(8.26/(tan(angcero*(pi()/180))))
angp=angcero+34.88;
angp1=180-angp;
xp=(8.26/(tan(angp1*(pi()/180))))+8
aux=abs(((sqrt((-8+xc)^2+(8.26)^2))/(sqrt((-8+xp)^2+(8.26)^2)))*((0.011)/(((-8)^2+(8.26)^2))*(sqrt((-8+1.8479)^2+(8.26)^2))));
k=1/aux

num = [1 xc];
den = [1 xp];
g = tf(num,den);
sysd = c2d(g, 0.01)
