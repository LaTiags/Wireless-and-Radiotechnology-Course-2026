# Short Answers (Lecture-2)

## Q1 — What is the difference between time domain and frequency domain?

The time domain shows how a signal varies over time and is what we directly observe when plotting amplitude versus time. It is useful to understand waveform shape and timing behavior. The frequency domain shows which frequencies are present in the signal and how strong they are, usually computed using the FFT. Instead of seeing oscillations, we see spectral peaks. This representation is very important in RF because systems are designed around frequency bands. Many signals that look complex in time become simple sets of tones in frequency. Engineers use both domains together to fully understand signals.

## Q2 — Why does filtering help in RF receivers?

Filtering allows an RF receiver to keep only the desired frequency components and reject unwanted ones such as interference and noise. In wireless systems many signals exist at the same time, so filters select only the useful band. This improves signal quality and increases signal-to-noise ratio. Without filtering, different channels would overlap and corrupt the data. Filters are used at multiple stages: RF front-end, intermediate frequency, and baseband. Practical receivers always rely on low-pass, high-pass, band-pass, or band-stop filters. Filtering is therefore essential for channel selection and stable reception.

## Q3 — What does modulation achieve in an RF system?

Modulation shifts a low-frequency baseband signal to a higher carrier frequency so it can be efficiently transmitted through an antenna. Low frequencies radiate poorly and would require very large antennas. By using a carrier, the signal can travel long distances. Modulation also allows multiple users to share the spectrum using different carrier frequencies. In addition, modulation makes signals compatible with RF hardware such as mixers and amplifiers. In our experiment, multiplication created new frequency components around the carrier. This demonstrates frequency translation, which is the core idea of RF communication.

## Q4 — From A2: which filter was easiest to design and why?

The easiest filters to design were the low-pass and high-pass filters because they require only one cutoff frequency. Their behavior is intuitive: one keeps frequencies below a limit and the other keeps frequencies above a limit. In MATLAB they are also simple to implement with one parameter. Band-pass filters require two cutoff frequencies and more tuning. When the tones are well separated, LPF and HPF work reliably with minimal adjustment. For quick signal isolation they are usually the first practical choice. That is why they felt the most straightforward in this assignment.

## Q5 — From A3: where do the new frequency components appear after modulation?

After modulation by multiplication with a carrier, new frequency components appear at the sum and difference of the carrier and message frequencies. This means the spectrum shifts to fc + fm and fc − fm. In our case with fc = 2000 Hz and fm = 100 Hz, the peaks appear near 1900 Hz and 2100 Hz. The original baseband peak at 100 Hz is no longer dominant in the modulated spectrum. This effect is predicted by trigonometric product identities. It shows how modulation performs frequency translation. This principle is used in mixers and transmitters in real RF systems.
