clear;
clc;

% sine wave equation : y(t) = A*sin(2*pi*freq*t + phase)

%   freq	amp	    phase		    Hard	Easy   Easiest
D = [0.1	1	    0.174532925		0.1	    0.2	   0.3125
     0.12	1.2	    0.523598776		0.12	0.5	   0.625
     0.05	1.4	    0.872664626		0.05	1	   0.9375];

n_sample = 2550;      % number of samples
step = 0.1;           % sampling time = 10 sec / sample freq = 10 Hz

t = 0:step:(n_sample-1)*step;

% Amplitude (-)
A1 = D(1,2);
A2 = D(2,2);
A3 = D(3,2);

% Phase (rad)
p1 = D(1,3);
p2 = D(2,3);
p3 = D(3,3);

% Dataset 1
f11 = D(1,4);
f12 = D(2,4);
f13 = D(3,4);

y1 = A1*sin(2*pi*f11*t + p1) + A2*sin(2*pi*f12*t + p2) + A3*sin(2*pi*f13*t + p3);

% Dataset 2
f21 = D(1,5);
f22 = D(2,5);
f23 = D(3,5);

y2 = A1*sin(2*pi*f21*t + p1) + A2*sin(2*pi*f22*t + p2) + A3*sin(2*pi*f23*t + p3);

% Dataset 3
f31 = D(1,6);
f32 = D(2,6);
f33 = D(3,6);

y3 = A1*sin(2*pi*f31*t + p1) + A2*sin(2*pi*f32*t + p2) + A3*sin(2*pi*f33*t + p3);

% Plot the results
figure
subplot(3,1,1);
plot(t,y1);
grid;
title("Set 1")
ylabel ("Amplitude");
xlim([0 (n_sample-1)*step]);
ylim([-4 4]);

subplot(3,1,2);
plot(t,y2);
grid;
title("Set 2")
ylabel ("Amplitude");
xlim([0 (n_sample-1)*step]);

subplot(3,1,3);
plot(t,y3);
grid;
title("Set 3")
ylabel ("Amplitude");
xlabel("Time (s)");
xlim([0 (n_sample-1)*step]);