clear;
clc;

load data\lab2-2\fs_10k.lvm;
load data\lab2-2\fs_1000.lvm;

data = fs_10k;

% Speed = 1V
t_1 = data(40001:50001,1);
acc_1 = data(40001:50001,2);

% Speed = 2V
t_2 = data(95001:105001,1);
acc_2 = data(95001:105001,2);

% Speed = 3V
t_3 = data(145001:155001,1);
acc_3 = data(145001:155001,2);

% Plot the acceleration over time
figure

subplot(3,1,1);
plot(t_1 - 4, acc_1);
grid on;
title("Acceleration at 1 V")
ylabel ("Acceleration [V]");

subplot(3,1,2);
plot(t_2 - 9.5, acc_2);
grid on;
title("Acceleration at 2 V")
ylabel ("Acceleration [V]");

subplot(3,1,3);
plot(t_3 - 14.5, acc_3);
grid on;
title("Acceleration at 3 V")
xlabel("Time [s]")
ylabel ("Acceleration [V]");

% % Adjust the size of the figure
% width = 900;
% height = 600;  
% set(gcf, 'Position', [100, 100, width, height]);
% 
% % Save the figure
% saveas(gcf, 'raw_acceleration_signal.png');


