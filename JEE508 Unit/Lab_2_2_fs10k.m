clear;
clc;

load data\lab2-2\fs_10k.lvm;
load data\lab2-2\fs_1000.lvm;

A = fs_10k;

t = A(:,1);
acc = A(:,2);
speed = A(:,3);
current = A(:,4);

% Plot
figure
subplot(3,1,1);
plot(t,acc);
grid;
title("Acceleration")
ylabel ("Acceleration [V]");

subplot(3,1,2);
plot(t,speed);
grid;
title("Speed")
ylabel ("Speed [V]");
yticks(0:0.5:3);

subplot(3,1,3);
plot(t,current);
grid;
title("Current")
ylabel ("Current [V]");

L = 10000;
fs = 10000;
T = 1/fs;

t_05 = A(12001:22001,1);
acc_05 = A(12001:22001,2);

% Perform DFT for checking the input frequency
f = fs*(0:(L/2))/L;

% For DL_6351
Y = fft(acc_05);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

[peak_value, peak_index] = max(P1);
acc_05_peak = f(peak_index);

figure
subplot(6,1,1);
stem(f,P1);
hold on;
stem(acc_05_peak, peak_value, 'b', 'LineWidth', 2);
hold off;
title("Motor Voltage = 0.5 (V)");
ylabel("Magnitude");
text(3600, peak_value - 0.5*peak_value, ['f = ', num2str(acc_05_peak), ' Hz'], 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left', 'FontSize', 10, 'Color', 'blue');

t_1 = A(40001:50001,1);
acc_1 = A(40001:50001,2);

% Perform DFT for checking the input frequency
f = fs*(0:(L/2))/L;

% Single-sided amplitude spectrum
Y = fft(acc_1);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

[peak_value, peak_index] = max(P1);
acc_1_peak = f(peak_index);

subplot(6,1,2);
stem(f,P1);
hold on;
stem(acc_1_peak, peak_value, 'b', 'LineWidth', 2);
hold off;
title("Motor Voltage = 1 (V)");
ylabel("Magnitude");
text(3600, peak_value - 0.5*peak_value, ['f = ', num2str(acc_1_peak), ' Hz'], 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left', 'FontSize', 10, 'Color', 'blue');

t_15 = A(70001:80001,1);
acc_15 = A(70001:80001,2);

% Perform DFT for checking the input frequency
f = fs*(0:(L/2))/L;

% Single-sided amplitude spectrum
Y = fft(acc_15);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

[peak_value, peak_index] = max(P1);
acc_15_peak = f(peak_index);

subplot(6,1,3);
stem(f,P1);
hold on;
stem(acc_15_peak, peak_value, 'b', 'LineWidth', 2);
hold off;
title("Motor Voltage = 1.5 (V)");
ylabel("Magnitude");
text(3600, peak_value - 0.5*peak_value, ['f = ', num2str(acc_15_peak), ' Hz'], 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left', 'FontSize', 10, 'Color', 'blue');

t_2 = A(95001:105001,1);
acc_2 = A(95001:105001,2);

% Perform DFT for checking the input frequency
f = fs*(0:(L/2))/L;

% Single-sided amplitude spectrum
Y = fft(acc_2);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

[peak_value, peak_index] = max(P1);
acc_2_peak = f(peak_index);

subplot(6,1,4);
stem(f,P1);
hold on;
stem(acc_2_peak, peak_value, 'b', 'LineWidth', 2);
hold off;
title("Motor Voltage = 2 (V)");
ylabel("Magnitude");
text(3600, peak_value - 0.5*peak_value, ['f = ', num2str(acc_2_peak), ' Hz'], 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left', 'FontSize', 10, 'Color', 'blue');

t_25 = A(120001:130001,1);
acc_25 = A(120001:130001,2);

% Perform DFT for checking the input frequency
f = fs*(0:(L/2))/L;

% Single-sided amplitude spectrum
Y = fft(acc_2);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

[peak_value, peak_index] = max(P1);
acc_25_peak = f(peak_index);

subplot(6,1,5);
stem(f,P1);
hold on;
stem(acc_25_peak, peak_value, 'b', 'LineWidth', 2);
hold off;
title("Motor Voltage = 2.5 (V)");
ylabel("Magnitude");
text(3600, peak_value - 0.5*peak_value, ['f = ', num2str(acc_25_peak), ' Hz'], 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left', 'FontSize', 10, 'Color', 'blue');

t_3 = A(145001:155001,1);
acc_3 = A(145001:155001,2);

% Perform DFT for checking the input frequency
f = fs*(0:(L/2))/L;

% Single-sided amplitude spectrum
Y = fft(acc_2);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

[peak_value, peak_index] = max(P1);
acc_3_peak = f(peak_index);

subplot(6,1,6);
stem(f,P1);
hold on;
stem(acc_3_peak, peak_value, 'b', 'LineWidth', 2);
hold off;
title("Motor Voltage = 3 (V)");
ylabel("Magnitude");
xlabel("Frequency (Hz)");
text(3600, peak_value - 0.5*peak_value, ['f = ', num2str(acc_3_peak), ' Hz'], 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left', 'FontSize', 10, 'Color', 'blue');
