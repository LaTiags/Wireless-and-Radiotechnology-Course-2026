# Effect of SNR on Demodulation Performance

## Objective
The goal of this experiment is to investigate how varying **Signal-to-Noise Ratio (SNR)** affects the performance of a communication system.  
We simulate a digital communication system using **Amplitude Shift Keying (ASK)** and observe how noise impacts the received and demodulated signals.

---

## Experiment Steps

1. **Generate Binary Message Signal**
   - Sampling frequency: `fs = 1000 Hz`  
   - Time vector: `t = 0:1/fs:1`  
   - Carrier frequency: `f_c = 50 Hz`  
   - Binary message: `0` or `1` randomly generated using `randi([0 1], 1, length(t))`

2. **Modulation**
   - Modulate the binary message using **ASK**.

3. **Add Gaussian Noise**
   - Simulate real-world conditions by adding noise at different **SNR values**:  
     - 10 dB, 5 dB, 0 dB, -5 dB

4. **Demodulation**
   - Demodulate the noisy ASK signal to recover the binary message.

5. **Plotting**
   - Plot the original modulated signal.  
   - Plot the received noisy signal and demodulated signal for each SNR.

---

## Observations

- **High SNR (10 dB):**
  - Received signal is very close to original.  
  - Demodulation accurately recovers the message.  

- **Moderate SNR (5 dB):**
  - Some noise is visible in the received signal.  
  - Minor errors in demodulated signal may appear.  

- **Low SNR (0 dB):**
  - Noise is comparable to the signal amplitude.  
  - Demodulated signal shows noticeable errors.  

- **Very Low SNR (-5 dB):**
  - Noise dominates the signal.  
  - Demodulation becomes unreliable; many bit errors occur.

---

## Experimentation

- Increasing **carrier frequency** may affect demodulation accuracy if sampling is not sufficient.  
- Changing **SNR values** demonstrates the importance of noise management in communication systems.  
- Trying other **modulation schemes** (e.g., FSK, PSK) can show how different methods perform under noise.

---

## Conclusion

- As **SNR decreases**, noise has a stronger impact on the received signal.  
- Lower SNR leads to **higher bit error rates** in demodulated data.  
- This experiment shows the importance of maintaining adequate SNR for reliable communication system performance.