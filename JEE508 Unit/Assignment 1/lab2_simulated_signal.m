clear;
clc;

freq = 151;
sampling = 400;
amp = 2;

duration = 2;
t = 0:1/sampling:duration-(1/sampling);

sinewave = amp*(sin(2*pi*freq*t));

figure
plot(t,sinewave);
grid;
title("Simulated sinewave");
ylabel("Amplitude (V)");
xlabel("Time (s)");
ylim([-2 2]);
grid on;

% Perform Discrete Fourier Transform (DFT)
dft_signal = fft(sinewave);

% Generate frequency axis
N = length(sinewave);
frequencies = (0:N-1) * (sampling / N);

% Find the peak frequency component
[~, peak_index] = max(abs(dft_signal));
peak_frequency = frequencies(peak_index);

% Plot the magnitude spectrum
figure;
stem(frequencies, abs(dft_signal));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Magnitude Spectrum (DFT)');
grid on;

fprintf('Original input frequency: %.2f Hz\n', peak_frequency);