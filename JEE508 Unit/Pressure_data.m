clear;
clc;

% Load the data file
load data\Delorenzo_1.lvm;
load data\Delorenzo_2.lvm;
load data\Delorenzo_3.lvm;

data = Delorenzo_2;

% Time (s)
t = data(:,1);     

% Raw pressure data (V)
p = data(:,6);       

% Plot the raw signal
figure
plot(t,p);
grid on;
xlabel("Time (s)");
ylabel("Pressure (V)")
title("Pressure Transmitter");

% saveas(gcf, "Pressure_raw.png");