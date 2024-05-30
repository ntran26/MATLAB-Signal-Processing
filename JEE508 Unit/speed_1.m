clear;
clc;

load data\lab2-2\fs_10k.lvm;
data = fs_10k;

t = data(40001:50001,1);
acc = data(40001:50001,2);

% Plot the acceleration
figure
plot(t - 4,acc);
grid;
title("Acceleration")
xlabel("Time [s]")
ylabel ("Acceleration [V]");

