clear;
clc;

% Load the data file
load data\Delorenzo_1.lvm;
load data\Delorenzo_2.lvm;
load data\Delorenzo_3.lvm;

data = Delorenzo_2;

t = data(:,1);          % time (s)
uc = data(:,2);         % control signal (V)

% Raw data
level = data(:,3);      % level (V)
flow = data(:,4);       % flow rate (V)
temp = data(:,5);       % temperature (V)
pressure = data(:,6);   % pressure (V)

figure
subplot(5,1,1);
plot(t,uc, 'LineWidth', 2);
grid;
ylabel("uc (V)")
ylim([2 8]);
title("Control Signal");

subplot(5,1,2);
plot(t,level);
grid;
ylabel("Level (V)")
ylim([0 4]);
yticks(0:2:4);
title("Level Transmitter");

subplot(5,1,3);
plot(t,flow);
grid;
ylabel("Flow (V)")
ylim([0 8]);
yticks(0:3:9);
title("Flow Transmitter");

subplot(5,1,4);
plot(t,temp);
grid;
ylabel("Temperature (V)")
title("Temperature Transmitter");

subplot(5,1,5);
plot(t,pressure);
grid;
xlabel("Time (s)")
ylabel("Pressure (V)")
title("Pressure Transmitter");

sgtitle('    Raw Signal');

% Save the figure
saveas(gcf, 'Delorenzo Raw Signal.png')

% Conditioned data
level1 = data(:,3);                 % level (cm)
flow1 = (data(:,4) * 28) + 20;      % flow (L/hr)
temp1 = data(:,5) * 10;             % temperature (C)
pressure1 = data(:,6) * 0.2;        % pressure (bar)

% figure
% subplot(5,1,1);
% plot(t,uc, 'LineWidth', 2);
% grid;
% ylabel("uc (V)")
% ylim([2 8]);
% title('Control Signal');
% 
% subplot(5,1,2);
% plot(t,level1);
% grid;
% ylabel("Level (cm)");
% ylim([0 4]);
% yticks(0:2:4);
% title("Level Transmitter");
% 
% subplot(5,1,3);
% plot(t,flow1);
% grid;
% ylabel("Flow Rate (L/hr)");
% ylim([0 300]);
% title("Flow Transmitter");
% 
% subplot(5,1,4);
% plot(t,temp1);
% grid;
% ylabel("Temperature (^{\circ}C)");
% title("Temperature Transmitter");
% 
% subplot(5,1,5);
% plot(t,pressure1);
% grid;
% xlabel("Time (s)")
% ylabel("Pressure (bar)")
% title("Pressure Transmitter");
% 
% sgtitle('         Conditioned Signal');
