% Audio file path
audio_file_path = './audiofile.wav';

% Read the audio file
[speech, fs] = audioread(audio_file_path);

% Calculate time vector
duration = length(speech) / fs;
time = linspace(0, duration, length(speech));

% Plot the voice signal
figure;
plot(time, speech);
title('Voice Signal');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

% Display the plot
disp('Voice signal plot displayed.');
