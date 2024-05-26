% Parameters
A1 = 1; A2 = 1.2; A3 = 1.4;
phi1 = 0.174533; phi2 = 0.523599; phi3 = 0.872665;
f1 = 0.2; f2 = 0.5; f3 = 1;

% Convert frequencies to angular frequencies
omega1 = 2*pi*f1;
omega2 = 2*pi*f2;
omega3 = 2*pi*f3;

% Number of samples and total time
N = 256;
T = 10; % Total time in seconds

% Calculate time step and generate time vector
t = linspace(0, T, N); % Generates N values evenly spaced between 0 and T

% Calculate the combined wave
y = A1*sin(omega1*t + phi1) + A2*sin(omega2*t + phi2) + A3*sin(omega3*t + phi3);

% Plot the result
figure;
plot(t, y, 'LineWidth', 1.5);
xlabel('Time (seconds)', 'FontSize', 12);
ylabel('Amplitude', 'FontSize', 12);
title('Combined Sine Waves over 10 Seconds', 'FontSize', 14);
grid on;