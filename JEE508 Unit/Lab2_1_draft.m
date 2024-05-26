clear;
clc;

load data\lab2-1\case_6.lvm;

A = case_6;

% For DFT
L = 200;                % length of data
Fs = 100;               % sampling frequency
T = 1/Fs;               % period

% Import data for plotting
t = A(1:201,1);
DL_6351 = A(1:201,2);
Tenma_6351 = A(1:201,3);
DL_6000 = A(1:201,4);
Tenma_6000 = A(1:201,5);

% Plot
figure
subplot(4,1,1);
plot(t,DL_6351);
grid;
title("DL 6351")
ylabel ("Amplitude");
%xlim([0 2]);

subplot(4,1,2);
plot(t,Tenma_6351);
grid;
title("Tenma 6351")
ylabel ("Amplitude");
%xlim([0 2]);

subplot(4,1,3);
plot(t,DL_6000);
grid;
title("DL 6000")
ylabel ("Amplitude");
%xlim([0 2]);

subplot(4,1,4);
plot(t,Tenma_6000);
grid;
title("Tenma 6000")
ylabel ("Amplitude");
xlabel("Time (s)");
%xlim([0 2]);

% Perform DFT for checking the input frequency
f = Fs*(0:(L/2))/L;

% For DL_6351
Y = fft(DL_6351);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

[peak_value, peak_index] = max(P1);
DL_6351_peak = f(peak_index);

figure
subplot(4,1,1);
stem(f,P1);
% hold on;
% stem(DL_6351_peak, peak_value, 'b', 'LineWidth', 2);
% hold off;
title('DL 6351 Single-Sided Amplitude Spectrum');
%xlabel('Frequency (Hz)');
ylabel('Magnitude');
%text(DL_6351_peak + 0.5, peak_value - 0.25*peak_value, ['Frequency = ', num2str(DL_6351_peak), ' Hz'], 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left', 'FontSize', 10, 'Color', 'blue');

% For Tenma_6351
Y = fft(Tenma_6351);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

[peak_value, peak_index] = max(P1);
Tenma_6351_peak = f(peak_index);

subplot(4,1,2);
stem(f,P1);
hold on;
stem(Tenma_6351_peak, peak_value, 'b', 'LineWidth', 2);
hold off;
title('Tenma 6351 Single-Sided Amplitude Spectrum');
% xlabel('Frequency (Hz)');
ylabel('Magnitude');
text(Tenma_6351_peak + 0.5, peak_value - 0.25*peak_value, ['Frequency = ', num2str(Tenma_6351_peak), ' Hz'], 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left', 'FontSize', 10, 'Color', 'blue');

% For DL_6000
Y = fft(DL_6000);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

[peak_value, peak_index] = max(P1);
DL_6000_peak = f(peak_index);

subplot(4,1,3);
stem(f,P1);
hold on;
stem(DL_6000_peak, peak_value, 'b', 'LineWidth', 2);
hold off;
title('DL 6000 Single-Sided Amplitude Spectrum');
% xlabel('Frequency (Hz)');
ylabel('Magnitude');
text(DL_6000_peak + 0.5, peak_value - 0.25*peak_value, ['Frequency = ', num2str(DL_6000_peak), ' Hz'], 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left', 'FontSize', 10, 'Color', 'blue');


% For Tenma_6000
Y = fft(Tenma_6000);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

[peak_value, peak_index] = max(P1);
Tenma_6000_peak = f(peak_index);

subplot(4,1,4);
stem(f,P1);
hold on;
stem(Tenma_6000_peak, peak_value, 'b', 'LineWidth', 2);
hold off;
title('Tenma 6000 Single-Sided Amplitude Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
text(Tenma_6000_peak + 0.5, peak_value - 0.25*peak_value, ['Frequency = ', num2str(Tenma_6000_peak), ' Hz'], 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left', 'FontSize', 10, 'Color', 'blue');
