clear;
clc;

load data\lab2-2\fs_10k.lvm;
data = fs_10k;

t = data(95001:105001,1);
acc = data(95001:105001,2);

% Plot the acceleration
figure
plot(t - 9.5,acc);
grid;
title("Acceleration")
xlabel("Time [s]")
ylabel ("Acceleration [V]");