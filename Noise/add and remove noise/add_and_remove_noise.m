%% Signal Noise Addition and Removal
% Objective: Add noise to a sinusoidal signal and remove it using a low-pass filter

clc; clear; close all;

%% --- Parameters ---
fs = 1000;              % Sampling frequency (Hz)
t = 0:1/fs:1;           % Time vector (1 second)
f_signal = 5;           % Signal frequency (Hz)
amplitude = 1;          % Signal amplitude

noise_level = 0.5;      % Standard deviation of Gaussian noise
cutoff_frequency = 10;  % Low-pass filter cutoff frequency (Hz)
filter_order = 4;       % Butterworth filter order

%% --- Generate Original Signal ---
signal = amplitude * sin(2*pi*f_signal*t);

%% --- Add Gaussian White Noise ---
noisy_signal = signal + noise_level * randn(size(signal));

%% --- Plot Original and Noisy Signals ---
figure;
subplot(3,1,1);
plot(t, signal, 'b', 'LineWidth', 1.5);
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(3,1,2);
plot(t, noisy_signal, 'r');
title('Noisy Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

%% --- Design Low-pass Butterworth Filter ---
% Normalized cutoff frequency for digital filter (0 to 1)
Wn = cutoff_frequency / (fs/2);
[b,a] = butter(filter_order, Wn, 'low');

%% --- Apply Filter to Remove Noise ---
filtered_signal = filtfilt(b, a, noisy_signal);

%% --- Plot Filtered Signal ---
subplot(3,1,3);
plot(t, filtered_signal, 'g', 'LineWidth', 1.5);
title(['Filtered Signal (Low-pass, Cutoff = ', num2str(cutoff_frequency), ' Hz)']);
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

%% --- Optional: Comparison Plot ---
figure;
plot(t, signal, 'b', 'LineWidth', 1.5); hold on;
plot(t, noisy_signal, 'r'); 
plot(t, filtered_signal, 'g', 'LineWidth', 1.5);
legend('Original','Noisy','Filtered');
title('Comparison of Signals');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;