# Wireless and Radiotechnology Course 2026  
## RF System Block Analysis Assignment

---

## Student Information

Name: ALVES Tiago
Student ID: S2600229

---

## Selected Device

Device: Nordic nRF52840  
Manufacturer: Nordic Semiconductor  

Datasheet (Official):  
https://docs.nordicsemi.com/bundle/ps_nrf52840/page/blockdiagram.html  

---

# 1. Introduction

The objective of this assignment is to analyze the internal RF system structure of a real wireless communication device and identify its main RF functional blocks based on the official datasheet.

The Nordic nRF52840 is a Bluetooth Low Energy (BLE) System-on-Chip (SoC) operating in the 2.4 GHz ISM band. It integrates an MCU and a full RF transceiver in a single chip.

---

# 2. Simplified RF System Block Diagram

See file: rf_block_diagram.png

(The diagram clearly shows signal flow from MCU to antenna and from antenna back to MCU.)

---

# 3. RF Block Identification and Explanation

## 3.1 Information Source / MCU

The ARM Cortex-M4 microcontroller acts as the information source and system controller. It generates digital data packets for transmission and processes received data after demodulation.

---

## 3.2 Baseband Processing / Modulation

The baseband processor prepares BLE packets and applies GFSK modulation. During transmission, digital bits are converted into frequency deviations around the carrier frequency; during reception, the process is reversed.

---

## 3.3 RF Transceiver (Tx/Rx)

The RF transceiver performs frequency conversion between baseband and 2.4 GHz RF signals. It contains mixers, oscillators, and switching logic to alternate between transmit and receive modes.

---

## 3.4 Power Amplifier (PA)

The Power Amplifier increases the power level of the outgoing RF signal before it reaches the antenna. This determines the communication range while maintaining power efficiency.

---

## 3.5 Low Noise Amplifier (LNA)

The LNA amplifies weak incoming RF signals with minimal added noise. It improves receiver sensitivity and enhances the signal-to-noise ratio.

---

## 3.6 RF Filtering and Matching Network

The RF matching network ensures impedance matching (typically 50 Ω) between the transceiver and the antenna. It also suppresses unwanted harmonics and ensures regulatory compliance.

---

## 3.7 Antenna Interface

The antenna interface connects the RF front-end to a PCB or external antenna. It radiates modulated RF energy into free space and receives incoming RF signals.

---

## 3.8 RF Power Supply

The RF section uses dedicated internal voltage regulation to provide stable power during transmission bursts. Stable supply voltage is critical for maintaining consistent output power and low phase noise.

---

# 4. Signal Flow Summary

Transmission Path:  
MCU → Baseband → RF Transceiver → PA → Matching Network → Antenna  

Reception Path:  
Antenna → Matching Network → LNA → RF Transceiver → Demodulation → MCU  

---

# 5. Conclusion

The nRF52840 integrates all essential RF communication blocks within a single SoC. Understanding the signal flow between digital processing, modulation, amplification, filtering, and radiation is essential for system-level RF engineering.