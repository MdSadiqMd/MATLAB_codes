clc;
num = [1 0];   % Numerator coefficients
den = [1 1];   % Denominator coefficients
sampling_freq=100;
% Create the transfer function object
H = tf(num, den);
t = 0:1/sampling_freq:1;  
signal = sin(2*pi*100*t); 
% Plot the frequency response
subplot(2,1,1);
plot(t, signal);
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');
% Plot the frequency response
subplot(2,1,2)
bode(H);
title('Frequency Response of Low-Pass Filter:s/(1+s)');
