% Load the data
load data\lab2-2\fs_10k.lvm;
data = fs_10k;

% Segmentation of Data
acc_1 = data(40001:50001, 2);
acc_2 = data(95001:105001, 2);
acc_3 = data(145001:155001, 2);

% Sampling frequency
Fs = 10000;

% Plot the frequency spectrum for each acceleration data
figure;

% Frequency spectrum for 1V
subplot(3,1,1);
plotFrequencySpectrum(acc_1, Fs);
title('Frequency Spectrum at 1V');

% Frequency spectrum for 2V
subplot(3,1,2);
plotFrequencySpectrum(acc_2, Fs);
title('Frequency Spectrum at 2V');

% Frequency spectrum for 3V
subplot(3,1,3);
plotFrequencySpectrum(acc_3, Fs);
title('Frequency Spectrum at 3V');

% Function to plot frequency spectrum
function plotFrequencySpectrum(signal, Fs)
    N = length(signal);
    Y = fft(signal);
    f = (0:N-1)*(Fs/N);     % Frequency range
    P = abs(Y)/N;           % Normalized amplitude
    plot(f, P);
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
    xlim([0 Fs/2]);         % Plot only up to Nyquist frequency
    grid on;
end