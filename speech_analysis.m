% Audio file in root Folder
audio_file_path = './audiofile.wav';

% Read the audio file
[speech, fs] = audioread(audio_file_path);

% Step 1: Preprocessing
% Normalize the speech signal
speech = speech / max(abs(speech));

% Step 2: Short-time Fourier Transform (STFT)
window_size = 30; % Choose an appropriate window size in milliseconds
overlap = 0.5; % Choose an overlap ratio
nfft = 1024; % Number of FFT points

spectrogram_data = spectrogram(speech, hamming(round(window_size * fs / 1000)), round(overlap * window_size * fs / 1000), nfft, fs);

% Step 3: Voiced/Unvoiced Decision
% You can use pitch detection algorithms like the Harmonic Product Spectrum (HPS), Zero Crossing Rate, etc.
hps = sum(abs(spectrogram_data).^2, 2);
[pitch_value, pitch_index] = max(hps);

% Set a threshold to determine if it's voiced or unvoiced
threshold = 0.1;
voiced = pitch_value > threshold;

% Displaying results
if voiced
    disp('Voiced')
else
    disp('Unvoiced')
end

disp(['Pitch: ', num2str(pitch_index * fs / nfft), ' Hz']);
