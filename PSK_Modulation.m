clc;
clear all;
close all;
fc=input("Enter the Frequency of Carrier Signal :");
fm=input("Enter the Frequency of Message Signal :");
t=0:0.001:1;
m=(square(2*pi*fm*t)+1)/2;
c=sin(2*pi*fc*t);
for i=0:1000
    if(m(i+1)==1)
        s(i+1)=c(i+1);
    else
        s(i+1)=-c(i+1);
    end
end
subplot(3,1,1);
plot(t,m);
subplot(3,1,2);
plot(t,c);
subplot(3,1,3);
plot(t,s);
