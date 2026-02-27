% --- Parameters ---
fs = 1000;          % Sampling frequency (Hz)
t = 0:1/fs:0.1;     % Time vector (shortened for visual clarity)
f_c = 50;           % Carrier frequency (Hz)
SNR_vector = [10, 5, 0, -5]; % SNR values in dB

% --- 1. Generate Binary Message ---
% Create a random sequence of bits
message_bits = randi([0 1], 1, length(t)); 

% --- 2. ASK Modulation ---
carrier = sin(2*pi*f_c*t);
modulated_signal = message_bits .* carrier;

% --- 3. Add Noise, Demodulate, and Plot ---
figure('Name', 'ASK Demodulation under varying SNR');

for i = 1:length(SNR_vector)
    % Add White Gaussian Noise
    received_signal = awgn(modulated_signal, SNR_vector(i), 'measured');
    
    % Simple Demodulation (Rectification + Smoothing/Thresholding)
    % We take the absolute value and check if it's above a threshold
    demodulated_signal = abs(received_signal) > 0.5; 
    
    % Plotting
    subplot(4, 2, 2*i-1);
    plot(t, received_signal);
    title(['Received Signal (SNR = ', num2str(SNR_vector(i)), ' dB)']);
    grid on;
    
    subplot(4, 2, 2*i);
    stem(t, demodulated_signal, 'Marker', 'none');
    ylim([-0.1 1.1]);
    title(['Demodulated Bits (SNR = ', num2str(SNR_vector(i)), ' dB)']);
    grid on;
end

xlabel('Time (s)');