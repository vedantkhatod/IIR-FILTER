clc;clear all; close all;
Ap=0.8;
As=0.2;
Wp=0.2*pi;
Ws=0.6*pi;
T=1;
Op=(2/T).*tan(Wp/2)
Os=(2/T).*tan(Ws/2)
m=0.5*(log10(((1/As^2)-1)/((1/Ap^2)-1))/log10(Os/Op))
N=ceil(m)
Oc=Op/(((1/Ap^2)-1)^(0.5/N))
[Num,Den]=butter(N,Oc,'s');
s=tf(Num,Den)
[N1,D1]=bilinear(Num,Den,1);
tf(N1,D1,1)
[H,W]=freqz(N1,D1);
plot(W/pi,abs(H));
xlabel('w');
ylabel('|H(w)|');
title('IIR Butterworth LPF Using BLT');
