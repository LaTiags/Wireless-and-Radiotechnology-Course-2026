% --- Parameters ---
B = 10e6;            % Bandwidth (1 MHz)
R = 1000;            % Resistance (100 Ohms)
T = 3000;            % Temperature (300 K)
k = 1.38e-23;       % Boltzmann Constant
n_samples = 10000;  % Number of samples

% --- Thermal Noise Generation ---
% Root Mean Square (RMS) Voltage: V_rms = sqrt(4 * k * T * R * B)
v_rms = sqrt(4 * k * T * R * B);
thermal_noise = v_rms * randn(1, n_samples);
time = (0:n_samples-1) / B;

% --- Visualization: Time Domain ---
figure;
subplot(2,1,1);
plot(time * 1e6, thermal_noise * 1e6); % Plot in microseconds and microvolts
title(['Thermal Noise (Time Domain) - B=', num2mstr(B/1e6), 'MHz, T=', num2str(T), 'K']);
xlabel('Time (\mu s)');
ylabel('Amplitude (\mu V)');
grid on;

% --- Visualization: Power Spectral Density (PSD) ---
[psd, freq] = pwelch(thermal_noise, [], [], [], B);
subplot(2,1,2);
semilogx(freq, 10*log10(psd));
title('Power Spectral Density of Thermal Noise');
xlabel('Frequency (Hz)');
ylabel('Power/Frequency (dB/Hz)');
grid on;