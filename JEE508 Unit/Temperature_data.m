clear;
clc;

% Load the data file
load data\Delorenzo_1.lvm;
load data\Delorenzo_2.lvm;
load data\Delorenzo_3.lvm;

data = Delorenzo_2;

% Time (s)
t = data(:,1);     

% Raw temperature data (V)
temp = data(:,5);       

% Plot the raw signal
figure
plot(t,temp);
grid on;
xlabel("Time (s)");
ylabel("Temperature (V)")
title("Temperature Transmitter");

% saveas(gcf, "Temperature_raw.png");

% Designing the FIR filter
Fs = 1000;      % Sampling frequency
N = 100;        % Filter order
Fpass = 50;      % Passband frequency
Fstop = 130;     % Stopband frequency

d = designfilt('lowpassfir', 'FilterOrder', N, 'PassbandFrequency', Fpass, ...
    'StopbandFrequency', Fstop, 'SampleRate', Fs);

% Applying the FIR filter using filtfilt
filtered_temp = filtfilt(d, temp);

% Plot the filtered signal
figure
plot(t, filtered_temp, 'r');
grid on;
xlabel("Time (s)");
ylabel("Temperature (V)")
ylim([2.4 2.6]);
title("Filtered Temperature Transmitter Signal");

% saveas(gcf, "Temperature_filtered.png");

figure
plot(t,temp, 'b', 'LineStyle','--');
hold on;
plot(t, filtered_temp, 'r', 'LineWidth', 1);

grid on;
