clc;
clear all;
t=-5:0.01:5;
s1=[t>=0];
s2=t.*[t>=0];
y=-[t==-2]+2*[t==-1]-2*[t==1]+(t+2).*[t>=-2];
subplot(311)
plot(t,s1)
title("unit step fucnction")
subplot(312)
plot(t,s2)
title("ramp fucnction")
subplot(313)
plot(t,y)
title("expression y(t)")
