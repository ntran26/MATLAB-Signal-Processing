% Clear the workspace and command window
clear;
clc;

% Load the data
load('data\lab2-2\fs_10k.lvm');
data = fs_10k;

% Extract time vector
t = data(1:10001, 1);
Fs = 10000; % Sampling frequency (Hz)

% Speed = 1V
acc_1 = data(40001:50001, 2);

% Speed = 2V
acc_2 = data(95001:105001, 2);

% Speed = 3V
acc_3 = data(145001:155001, 2);

% Perform FFT
n = length(t);
f = (0:n-1)*(Fs/n); % Frequency range

Y1 = fft(acc_1);
Y2 = fft(acc_2);
Y3 = fft(acc_3);

% Compute amplitude spectrum (normalized)
amplitude_1 = abs(Y1)/n;
amplitude_2 = abs(Y2)/n;
amplitude_3 = abs(Y3)/n;

% Plot the amplitude spectrum for each speed
figure;

subplot(3,1,1);
plot(f, amplitude_1);
title('Amplitude Spectrum of Acceleration at 1V');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

subplot(3,1,2);
plot(f, amplitude_2);
title('Amplitude Spectrum of Acceleration at 2V');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

subplot(3,1,3);
plot(f, amplitude_3);
title('Amplitude Spectrum of Acceleration at 3V');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

% Limit the x-axis to focus on the relevant frequency range (e.g., up to 500 Hz)
% xlim([0 500]);