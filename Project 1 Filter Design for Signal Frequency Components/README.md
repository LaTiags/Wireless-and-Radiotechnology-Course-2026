# Fundamentals of RF Communication Systems  
## Filtering – Frequency Selection Problem

### 1. Input Signal

The input signal is:

x(t) = A1·sin(2π·100t)  
     + A2·sin(2π·200t)  
     + A3·sin(2π·300t)  
     + A4·sin(2π·400t)

The signal contains four discrete frequency components:

- 100 Hz
- 200 Hz
- 300 Hz
- 400 Hz

According to RF signal theory, filters operate in the **frequency domain** and are used to:

- Limit bandwidth
- Reject interference
- Improve signal-to-noise ratio (SNR)
- Select desired spectral components

---

### 2. Cutoff Frequency Strategy

To isolate frequency components, cutoff frequencies are selected at midpoints between adjacent components:

- Between 100 Hz and 200 Hz → 150 Hz
- Between 200 Hz and 300 Hz → 250 Hz
- Between 300 Hz and 400 Hz → 350 Hz

This ensures proper separation while minimizing spectral overlap.

---

### 3. Filter Design Table

| Desired Frequency Component | Filter Type | Cutoff Frequency / Frequencies |
|-----------------------------|------------|--------------------------------|
| 100 Hz | Low Pass Filter (LPF) | fc = 150 Hz |
| 400 Hz | High Pass Filter (HPF) | fc = 350 Hz |
| 100 Hz and 200 Hz | Low Pass Filter (LPF) | fc = 250 Hz |
| 200 Hz | Band Pass Filter (BPF) | 150 Hz – 250 Hz |
| 300 Hz | Band Pass Filter (BPF) | 250 Hz – 350 Hz |
| 300 Hz and 400 Hz | High Pass Filter (HPF) | fc = 250 Hz |
| 200 Hz and 300 Hz | Band Pass Filter (BPF) | 150 Hz – 350 Hz |
| 200 Hz, 300 Hz, and 400 Hz | High Pass Filter (HPF) | fc = 150 Hz |
| 100 Hz and 400 Hz | Band Stop Filter (BSF) | Stopband: 150 Hz – 350 Hz |

---

### 4. Engineering Justification

#### Low Pass Filter (LPF)
Allows frequencies below the cutoff frequency to pass and attenuates higher frequencies.

#### High Pass Filter (HPF)
Allows frequencies above the cutoff frequency to pass and attenuates lower frequencies.

#### Band Pass Filter (BPF)
Allows frequencies within a defined range to pass while rejecting others.

#### Band Stop Filter (BSF)
Rejects frequencies within a defined stopband while passing others.

---

### 5. Practical Considerations in RF Systems

In real RF systems:

- Filters are not ideal (non-zero transition band)
- Roll-off depends on filter order
- Higher order → sharper frequency selectivity
- Filter choice impacts bandwidth and SNR

Proper filter placement is critical in both transmitter and receiver chains to control spectral content and reduce interference.

---

## Conclusion

By selecting cutoff frequencies at the midpoint between adjacent signal components, each desired frequency (or combination of frequencies) can be effectively isolated using LPF, HPF, BPF, or BSF filters. This approach follows fundamental RF filtering principles used in communication systems.    