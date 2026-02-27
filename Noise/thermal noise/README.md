## Observations

### 1. Time Domain Observation

When we look at the signal in the time domain, we can see that the noise is completely random.  
There is no specific pattern or repetition. The signal fluctuates around zero with both positive and negative values.

The amplitude is very small (in the microvolt range), which is normal for thermal noise with the chosen parameters (B = 1 MHz, R = 100 Ω, T = 300 K).

We can notice that:
- The signal is unpredictable  
- It is centered around zero  
- It looks like typical white noise  

---

### 2. Power Spectral Density (PSD) Observation

On the PSD graph, the curve is almost flat across the whole frequency range.

This means that the noise power is distributed uniformly over the frequencies.  
There is no dominant frequency component.

The small variations visible in the curve are normal and are caused by the random nature of the noise and the limited number of samples.

---

### 3. Effect of Parameters

After changing the values:

- Increasing the bandwidth (B) increases the noise level.  
- Increasing the temperature (T) also increases the noise.  
- Increasing the resistance (R) increases the noise amplitude.  

This matches the theoretical formula:

Vrms = sqrt(4 k T R B)

---

### Conclusion

The simulation results match the theory.  
Thermal noise is random, spread over all frequencies (white noise), and directly depends on temperature, resistance, and bandwidth.