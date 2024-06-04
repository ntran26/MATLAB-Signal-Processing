clear;
clc;

load data\lab2-2\fs_10k.lvm;
load data\lab2-2\fs_100.lvm;
load data\lab2-2\fs_1000.lvm;
load data\lab2-2\fs_5k.lvm;

A = fs_1000;

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
yticks(0:0.5:3)

subplot(3,1,3);
plot(t,current);
grid;
title("Current");
ylabel ("Current [V]");
xlabel("Time (s)");

% Define the voltage and RPM data
% voltage = [0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2, 2.25, 2.5, 2.75, 3]; 
% rpm = [400, 796.8, 1193.8, 1598.4, 1993.6, 2398.4, 2796.2, 3200, 3595.2, 4000, 4396.8, 4792];
voltage = [0.5, 1, 1.5, 2, 2.5, 3];
rpm = [796.8, 1598, 2398.4, 3200, 4000, 4792];

% Perform linear regression
coefficients = polyfit(voltage, rpm, 1);    % Fit a first-degree polynomial (line)
slope = coefficients(1);                    % Slope of the line (relationship between voltage and RPM)
intercept = coefficients(2);                % Intercept of the line

% Display the equation of the line
fprintf('Equation of the line (RPM = m * V + b):\n');
fprintf('RPM = %.2f * V + %.2f\n', slope, intercept);

% Plot the data points and the line of best fit
figure;
plot(voltage, rpm, 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'r'); % Data points
hold on;
v_fit = linspace(min(voltage), max(voltage), 100);  % Voltage values for the line
rpm_fit = slope * v_fit + intercept;                % RPM values using the line equation
plot(v_fit, rpm_fit, 'b', 'LineWidth', 1);          % Line of best fit
hold off;
xlabel('Motor voltage (V)');
ylabel('Angular velocity (RPM)');
title('Relationship between Motor Voltage and Angular Velocity');
grid on;
legend('Data Points', 'Line of Best Fit', 'Location', 'northwest');
xticks(0:0.25:3);
text(1.5, 1500, ['Slope: m = ' num2str(slope), char(10), 'Intercept: b = ' num2str(intercept)], 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left', 'FontSize', 10, 'Color', 'blue');
