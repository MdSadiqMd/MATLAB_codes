fs = 8000; 
duration = input('Enter the Duration of the Speech Signal :'); 
t = 0:1/fs:duration-1/fs;

% Speech Signal
speech = sin(2*pi*100*t) + sin(2*pi*200*t); 

% Convert speech signal to Speech.mav audio
audiowrite('speech.wav', speech, fs);
disp('speech.wav file generated successfully.');

% Load the Speech.mav File
[speech, fs] = audioread('speech.wav');
pre_emphasized = filter([1, -0.95], 1, speech);

% Power speech waveform
t = (0:length(speech)-1) / fs; 
power_signal = bandpower(speech_signal, fs, [0 fs/2]);
fprintf('Power of the speech signal: %.2f Watts\n', power_signal);

% Pitch of the Signal
autocorr = xcorr(speech);
[~, lag] = max(autocorr(length(speech) + 1 : end));
pitch = fs / lag;

disp("Pitch of the speech signal: " + string(pitch) + " Hz");

% Vocal Configuration of the Speech Signal
window_length = round(0.025 * fs); 
window = pre_emphasized(1:window_length);
order = 12; 
[a, ~] = lpc(window, order);
rts = roots(a); 
rts = rts(imag(rts) > 0); 
formants = sort(fs * angle(rts) / (2 * pi)); % Roots to Frequencies
disp('Estimated Formants:');
disp(formants);

% Plot the Speech Signal
figure;
plot(t, speech);
xlabel('Time (s)');
ylabel('Amplitude');
title('Speech Waveform');
