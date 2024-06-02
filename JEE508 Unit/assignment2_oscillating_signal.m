clear;
clc;

load data\lab2-2\fs_10k.lvm;
data = fs_10k;

t = data(1:10001,1);

% Speed = 1V
acc_1 = data(40001:50001,2);

% Speed = 2V
acc_2 = data(95001:105001,2);

% Speed = 3V
acc_3 = data(145001:155001,2);

% % Plot the acceleration over time
% figure
% 
% subplot(3,1,1);
% plot(t, acc_1);
% grid on;
% title("Acceleration at 1 V")
% ylabel ("Acceleration [V]");
% 
% subplot(3,1,2);
% plot(t, acc_2);
% grid on;
% title("Acceleration at 2 V")
% ylabel ("Acceleration [V]");
% 
% subplot(3,1,3);
% plot(t, acc_3);
% grid on;
% title("Acceleration at 3 V")
% xlabel("Time [s]")
% ylabel ("Acceleration [V]");

% % Adjust the size of the figure
% width = 900;
% height = 600;  
% set(gcf, 'Position', [100, 100, width, height]);
% 
% % Save the figure
% saveas(gcf, 'raw_acceleration_signal.png');

% Statistical properties
mean_1 = mean(acc_1);
std_1 = std(acc_1);
snr_1 = abs(mean_1)/std_1;

mean_2 = mean(acc_2);
std_2 = std(acc_2);
snr_2 = abs(mean_2)/std_2;

mean_3 = mean(acc_3);
std_3 = std(acc_3);
snr_3 = abs(mean_3)/std_3;

% Display the results
fprintf('Noise Mean and Standard Deviation:\n');
fprintf('1V: Mean = %.3f, Std = %.3f, SNR = %.3f dB\n', mean_1, std_1, snr_1);
fprintf('2V: Mean = %.3f, Std = %.3f, SNR = %.3f dB\n', mean_2, std_2, snr_2);
fprintf('3V: Mean = %.3f, Std = %.3f, SNR = %.3f dB\n', mean_3, std_3, snr_3);

% Design a Butterworth low-pass filter
Fs = 10000;     % Sampling frequency
Fc = 3500;        % Cut-off frequency
[b, a] = butter(2, Fc *(2/Fs), 'low');

% Apply the filter to each acceleration signal
filtered_acc_1 = filtfilt(b, a, acc_1);
filtered_acc_2 = filtfilt(b, a, acc_2);
filtered_acc_3 = filtfilt(b, a, acc_3);

% Plot the filtered signals
figure
subplot(3,1,1);
plot(t, acc_1);
hold on;
plot(t, filtered_acc_1, 'r-', 'LineWidth', 1);
grid on;
title("Original and Filtered Acceleration at 1 V");
ylabel ("Acceleration [V]");
legend('Original', 'Filtered');

subplot(3,1,2);
plot(t, acc_2);
hold on;
plot(t, filtered_acc_2, 'r-', 'LineWidth', 1);
grid on;
title("Original and Filtered Acceleration at 2 V");
ylabel ("Acceleration [V]");
legend('Original', 'Filtered');

subplot(3,1,3);
plot(t, acc_3);
hold on;
plot(t, filtered_acc_3, 'r-', 'LineWidth', 1);
grid on;
title("Original and Filtered Acceleration at 3 V");
xlabel("Time [s]")
ylabel ("Acceleration [V]");
legend('Original', 'Filtered');

% % Adjust the size of the figure
% width = 900;
% height = 600;  
% set(gcf, 'Position', [100, 100, width, height]);
% 
% % Save the figure
% saveas(gcf, 'filtered_acceleration_signal.png');

% Statistical properties
mean_1 = mean(filtered_acc_1);
std_1 = std(filtered_acc_1);
snr_1 = abs(mean_1)/std_1;

mean_2 = mean(filtered_acc_2);
std_2 = std(filtered_acc_2);
snr_2 = abs(mean_2)/std_2;

mean_3 = mean(filtered_acc_3);
std_3 = std(filtered_acc_3);
snr_3 = abs(mean_3)/std_3;

% Display the results
fprintf('Noise Mean and Standard Deviation:\n');
fprintf('1V: Mean = %.3f, Std = %.3f, SNR = %.3f dB\n', mean_1, std_1, snr_1);
fprintf('2V: Mean = %.3f, Std = %.3f, SNR = %.3f dB\n', mean_2, std_2, snr_2);
fprintf('3V: Mean = %.3f, Std = %.3f, SNR = %.3f dB\n', mean_3, std_3, snr_3);

% Frequency spectrum analysis
L = 10000;
fs = length(t);
T = 1/fs;

% Perform DFT for checking the input frequency
f = fs*(0:(L/2))/L;

figure

% Single-sided amplitude spectrum for acceleration 1
Y = fft(filtered_acc_1);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

[peak_value_1, peak_index] = max(P1);
filtered_acc_1_peak = f(peak_index);

subplot(3,1,1);
stem(f,P1);
hold on;
stem(filtered_acc_1_peak, peak_value_1, 'b', 'LineWidth', 2);
hold off;
title("Motor Voltage = 1 (V)");
ylabel("Magnitude");
text(filtered_acc_1_peak, peak_value_1, ['f = ', num2str(filtered_acc_1_peak), ' Hz'], 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left', 'FontSize', 10, 'Color', 'red');

% Single-sided amplitude spectrum for acceleration 2
Y = fft(filtered_acc_2);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

[peak_value_2, peak_index] = max(P1);
filtered_acc_2_peak = f(peak_index);

subplot(3,1,2);
stem(f,P1);
hold on;
stem(filtered_acc_2_peak, peak_value_2, 'b', 'LineWidth', 2);
hold off;
title("Motor Voltage = 2 (V)");
ylabel("Magnitude");
text(filtered_acc_2_peak, peak_value_2, ['f = ', num2str(filtered_acc_2_peak), ' Hz'], 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left', 'FontSize', 10, 'Color', 'red');



% Single-sided amplitude spectrum for acceleration 3
Y = fft(filtered_acc_3);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

[peak_value_3, peak_index] = max(P1);
filtered_acc_3_peak = f(peak_index);




subplot(3,1,3);
stem(f,P1);
hold on;
stem(filtered_acc_3_peak, peak_value_3, 'b', 'LineWidth', 2);
hold off;
title("Motor Voltage = 3 (V)");
ylabel("Magnitude");
text(filtered_acc_3_peak, peak_value_3, ['f = ', num2str(filtered_acc_3_peak), ' Hz'], 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left', 'FontSize', 10, 'Color', 'red');

