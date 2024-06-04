clear;
clc;

% Load the data file
load data\Foxboro_2.lvm;

data = Foxboro_2;

t = data(:,1);          % time (s)
uc = data(:,2);         % control signal (V)

% Raw data
level = data(:,3);      % level (V)
flow = data(:,4);       % flow rate (V)
pressure = data(:,5);   % pressure (V)

figure
subplot(2,2,1);
plot(t,uc);
grid;
ylabel("uc (V)")
title("Control Signal");

subplot(2,2,2);
plot(t,level);
grid;
ylabel("Level (V)")
title("Level Sensor");

subplot(2,2,3);
plot(t,flow);
grid;
ylabel("Flow (V)")
xlabel("Time(s)")
title("Flow Meter");

subplot(2,2,4);
plot(t,pressure);
grid;
xlabel("Time (s)")
ylabel("Pressure (V)")
title("Pressure Sensor");

% Conditioned data
level1 = (data(:,3) - 1) * 100;
flow1 = (data(:,4) - 1) * 25;
pressure1 = ((data(:,5) - 1)*20)+20;

figure
subplot(2,2,1);
plot(t,uc);
grid;
ylabel("uc (V)")
title("Control Signal");

subplot(2,2,2);
plot(t,level1);
grid;
ylabel("Level (mm)")
title("Level Sensor");

subplot(2,2,3);
plot(t,flow1);
grid;
ylabel("Flow Rate (%)")
xlabel("Time(s)")
title("Flow Meter");

subplot(2,2,4);
plot(t,pressure1);
grid;
xlabel("Time (s)")
ylabel("Pressure (kPa)")
title("Pressure Sensor");

