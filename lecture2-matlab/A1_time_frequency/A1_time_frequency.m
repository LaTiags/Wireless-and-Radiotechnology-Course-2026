clear; close all; clc;

Fs = 10000;
T  = 0.05;
t  = 0:1/Fs:T-1/Fs;

Vin = 10*sin(2*pi*500*t) ...
    + 5*sin(2*pi*600*t) ...
    + 3*sin(2*pi*700*t) ...
    + 5*sin(2*pi*800*t);

t_ms = t*1000;
idx = t_ms <= 10;

figure;
plot(t_ms(idx), Vin(idx));
grid on;
xlabel('Time [ms]');
ylabel('Amplitude [mV]');
title('A1: Time Domain');
exportgraphics(gcf,'A1_time.png','Resolution',200);

N = length(Vin);
X = fft(Vin);

f = (0:N-1)*(Fs/N);
halfN = floor(N/2);

figure;
plot(f(1:halfN), abs(X(1:halfN)));
grid on;
xlabel('Frequency [Hz]');
ylabel('Magnitude');
title('A1: FFT Spectrum');
xlim([0 1200]);
exportgraphics(gcf,'A1_spectrum.png','Resolution',200);
