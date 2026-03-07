clear all;
close all;
clc;

%% Constants and Shared Parameters
G_t = 1;            % Gain of transmitting antenna
G_r = 1;            % Gain of receiving antenna
c = 3*1e8;          % Speed of light (m/s)
Pn = 500*1e-6;      % Noise power (Watts)

%% Task 1: WiFi Simulation (IEEE 802.11b)
f_wifi = 2.4*1e9;
BW_wifi = 22*1e6;
d_wifi = 1:5:100;
P_t_wifi = 100*1e-3;
lamb_wifi = c/f_wifi;

% Calculations
Pr_wifi = (P_t_wifi * G_t * G_r * lamb_wifi^2) ./ (4 * pi * d_wifi).^2;
SINR_wifi = Pr_wifi / Pn;
C_wifi = BW_wifi * log2(1 + SINR_wifi);

%% Task 2: Bluetooth Simulation (IEEE 802.11)
f_bluetooth = 2.45*1e9;
BW_bluetooth = 2*1e6;
d_bluetooth = 0.5:0.5:10;
P_t_bluetooth = 10*1e-3;
lamb_bluetooth = c/f_bluetooth;

% Calculations
Pr_bluetooth = (P_t_bluetooth * G_t * G_r * lamb_bluetooth^2) ./ (4 * pi * d_bluetooth).^2;
SINR_bluetooth = Pr_bluetooth / Pn;
C_bluetooth = BW_bluetooth * log2(1 + SINR_bluetooth);

%% Task 3: Cellular Simulation (2G GSM)
f_cellular = 850*1e6;
BW_cellular = 200*1e3;
d_cellular = 100:100:5000;
P_t_cellular = 40;
lamb_cellular = c/f_cellular;

% Calculations
Pr_cellular = (P_t_cellular * G_t * G_r * lamb_cellular^2) ./ (4 * pi * d_cellular).^2;
SINR_cellular = Pr_cellular / Pn;
C_cellular = BW_cellular * log2(1 + SINR_cellular);

%% Visualization
figure('Name', 'Wireless Technology Comparison', 'NumberTitle', 'off');

% Row 1: Received Power (dB)
subplot(3,3,1); plot(d_wifi, 10*log10(Pr_wifi)); title('WiFi'); ylabel('P_r (dB)'); grid on;
subplot(3,3,2); plot(d_bluetooth, 10*log10(Pr_bluetooth)); title('Bluetooth'); grid on;
subplot(3,3,3); plot(d_cellular, 10*log10(Pr_cellular)); title('Cellular'); grid on;

% Row 2: SINR (dB)
subplot(3,3,4); plot(d_wifi, 10*log10(SINR_wifi)); ylabel('SINR (dB)'); grid on;
subplot(3,3,5); plot(d_bluetooth, 10*log10(SINR_bluetooth)); grid on;
subplot(3,3,6); plot(d_cellular, 10*log10(SINR_cellular)); grid on;

% Row 3: Capacity (dB) - Calculated as 10*log10(Capacity)
subplot(3,3,7); plot(d_wifi, 10*log10(C_wifi)); ylabel('Capacity (dB)'); xlabel('distance (m)'); grid on;
subplot(3,3,8); plot(d_bluetooth, 10*log10(C_bluetooth)); xlabel('distance (m)'); grid on;
subplot(3,3,9); plot(d_cellular, 10*log10(C_cellular)); xlabel('distance (m)'); grid on;