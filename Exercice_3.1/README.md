# Service Mode Exploration

## Objective

The objective of this experiment is to explore a smartphone’s service (field test) mode and observe how key radio parameters change under different environmental and network conditions. The study focuses on signal strength, signal quality, and cell-related parameters, and analyzes how these affect data speed, network stability, and connectivity reliability.
Measurement Results
 

## Scenario 1: Indoors (Center of Building)

*   Parameter	Value
*   Network technology	4G LTE
*   RSSI (dBm)	-68 dBm
*   RSRP (dBm)	-96 dBm
*   RSRQ (dB)	-8 dB
*   SINR (dB)	4 dB
*   Cell ID	0x9FBA53PCL9
*   Carrier frequency	LTE Band 1 (2100 MHz)
*   Bandwidth	20 MHz

## Observations

-   The measurements were taken indoors, likely in the center of a building, as indicated by moderate RSRP and low SINR.
-   Despite a relatively strong RSSI, the SINR value shows significant interference and noise.
-   The use of LTE Band 1 (2100 MHz) explains reduced indoor penetration.
-   No 5G NR connection was established (ENDC inactive), likely due to insufficient LTE anchor quality.

## Analysis

Effect of Signal Strength and Quality on Data Speed
Stronger signal strength (higher RSSI/RSRP values closer to 0 dBm) and better signal quality (higher SINR and less negative RSRQ) resulted in higher data speeds. Poor signal quality caused lower modulation and coding schemes, reducing throughput.
Effect on Network Stability
Low SINR and poor RSRQ led to more frequent retransmissions and occasional handovers between cells. Indoors, especially in the center of buildings, the connection was less stable due to attenuation from walls and floors.
Effect on Connectivity Reliability
Connectivity was most reliable outdoors, where line-of-sight to the base station was clearer. Indoors, physical obstructions such as concrete walls and metal structures significantly reduced reliability, especially for higher-frequency carriers.
Factors Influencing Results
-   Distance from cell tower: Greater distance reduced RSRP and SINR.
-	Physical obstructions: Walls, floors, and building materials caused attenuation and multipath interference.
-   Network load: During busy periods, signal quality and data speeds were reduced even with good signal strength.
-   Frequency band: Lower frequencies penetrated buildings better, while higher frequencies provided higher capacity but poorer indoor coverage.

## Conclusion

The experiment demonstrates that both signal strength and signal quality are critical for achieving high data speed, stable connections, and reliable connectivity. Environmental conditions and network technology significantly influence radio performance, with outdoor and line-of-sight conditions providing the best overall results.

