clc;
close all;
num = [1 0]; 
den = [1 1];  
H = tf(num, den);
t = 0:0.1:1;  
signal = sin(2*pi*100*t); 
hpFilt = designfilt('highpassiir', 'FilterOrder', 8, ...
             'PassbandFrequency', 75, 'PassbandRipple', 0.2,...
             'SampleRate', 200);
lpFilt = designfilt('lowpassfir', 'PassbandFrequency', 0.25,...
             'StopbandFrequency', 0.35, 'PassbandRipple', 0.5, ...
             'StopbandAttenuation', 65, 'DesignMethod', 'kaiserwin');
Low_Pass_Signal = filter(lpFilt , signal);
High_Pass_Signal = filter(hpFilt , signal);
figure;
subplot(3,1,1);
plot(t, signal);
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');
subplot(3,1,2);
plot(t, Low_Pass_Signal);
title('Low pass Signal');
xlabel('Time (s)');
ylabel('Amplitude');
subplot(3,1,3);
plot(t, High_Pass_Signal);
title('High Pass Signal');
xlabel('Time (s)');
ylabel('Amplitude');
