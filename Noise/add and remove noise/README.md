# Signal Noise Addition and Removal Experiment

## Objective
The goal of this experiment is to simulate adding and removing noise from a signal using MATLAB.  
We explore how Gaussian noise affects a signal and how a simple low-pass filter can reduce high-frequency noise.

---

## Experiment Steps

1. **Generate a Sinusoidal Signal**
   - Sampling frequency: `fs = 1000 Hz`  
   - Time vector: `t = 0:1/fs:1`  
   - Signal frequency: `f_signal = 5 Hz`  
   - Amplitude: `1`  
   - Formula: `signal = amplitude * sin(2*pi*f_signal*t)`

2. **Add Gaussian White Noise**
   - Use MATLAB’s `randn()` to generate noise.  
   - Add noise to the original signal to create a noisy signal.

3. **Plot Original and Noisy Signals**
   - Compare the clean signal with the noisy signal to visualize the effect of noise.

4. **Remove Noise Using a Low-pass Filter**
   - Design a Butterworth low-pass filter.  
   - Default cutoff frequency: `10 Hz`  
   - Apply the filter to the noisy signal to remove high-frequency components.

5. **Plot Filtered Signal**
   - Observe how the filter restores the original signal while reducing noise.

---

## Observations

- Adding noise makes the signal **less smooth** and harder to interpret visually.  
- The low-pass filter **removes high-frequency noise**, restoring the sinusoidal shape.  
- The effectiveness of noise removal depends on:
  - **Noise level**: higher noise makes filtering more critical.  
  - **Cutoff frequency**: too low can distort the signal; too high may leave noise.  
  - **Signal frequency**: filters must be designed according to the signal spectrum.  

---

## Experimentation

- Changing the **noise amplitude** shows how robust the filter needs to be.  
- Adjusting the **cutoff frequency** affects signal fidelity and noise reduction.  
- Modifying the **signal frequency** requires recalculating filter parameters for optimal results.

---

## Conclusion

- Noise can significantly affect signal clarity.  
- A simple low-pass filter can **effectively reduce noise** if designed properly.  
- This experiment demonstrates the trade-off between noise reduction and signal distortion in practical signal processing.