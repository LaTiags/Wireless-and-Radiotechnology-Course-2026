# BLE Scanning and Analysis Report
## 1. Introduction
Bluetooth Low Energy (BLE) is widely used for short-range wireless communication in devices such as smartphones, wearables, IoT sensors, and beacons. This assignment explores BLE scanning behavior across environments, signal characteristics, and related security and privacy implications using the BLE Scanner mobile application.

## 2. Scanning Setup
-	Tool used: BLE Scanner (Android)
-	Device: Smartphone with Bluetooth enabled
-	Scan mode: Passive BLE scanning
-	Metrics observed:
    *	Device Name
    *  	RSSI (dBm)
    *	MAC Address / Device Identifier
    *	Approximate Distance (estimated by app)
    *	Advertising Interval (ms)

## 3. Scanning Environments
1. Classroom (Indoor, Moderate Density)
Characteristics:
-	Multiple BLE devices detected
-	Moderate RSSI values
-	Presence of personal devices (phones, laptops, wearables)
Typical observations:
-	RSSI range: –35 dBm to –86 dBm
-	Estimated distances: 0.06 m to ~28 m
-	Devices include:
-	Smartphones (Apple identifier visible)
    *	Unknown BLE peripherals
    *	Likely laptops (Windows icon)

2. Hallway (Indoor, Transitional Space)
Characteristics:
-	Fewer strong signals
-	More fluctuating RSSI values
-	Increased reflections and obstructions
Typical observations:
-	RSSI range: –48 dBm to –90 dBm
-	Estimated distances: 0.28 m to ~35 m
-	Devices frequently appear and disappear due to movement

3. Outdoor Area (Open Environment)
Characteristics:
-	Fewer detected devices
-	Weaker RSSI values overall
-	Less multipath interference but greater distance attenuation
Typical observations:
-	RSSI range: –70 dBm to –96 dBm
-	Estimated distances: >30 m up to ~70 m
-	Mostly non-connectable advertising devices

## 4. Collected Data (Sample from Screenshots)
   


Device Name	RSSI (dBm)	MAC Address	Approx. Distance	Connectable
N/A	-35	2C:AD:B7:92:EB:A6	0.06 m	No
EPIX	-48	14:13:0B:EB:1C:8C	0.28 m	Yes
N/A	-49	0E:70:35:40:3D:9D	0.32 m	No
N/A	-68	00:B6:DE:8E:AE:0F	2.82 m	No
N/A	-73	41:F1:B3:0A:97:74	5.01 m	No
N/A	-90	3F:10:63:B9:D6:86	35.48 m	No
N/A	-96	18:70:88:4B:A5:2D	70.79 m	No

## 5. Analysis
1. RSSI vs Distance Relationship
-	RSSI becomes more negative as distance increases
-	Strong signals (–35 dBm to –50 dBm) indicate very close proximity
-	Weak signals (below –85 dBm) correspond to longer distances or obstructions
- ⚠️ Important: Distance estimates are approximate and influenced by:
-	Transmit power
-	Antenna orientation
-	Human bodies and walls
-	Environmental reflections

2. Device Types Observed
-	Smartphones: Apple-identified device (likely iPhone)
-	Wearables: “EPIX” (likely Garmin Epix smartwatch)
-	Laptops / PCs: Windows icon
-	Unknown BLE Beacons: Advertising only, non-connectable

3. Advertising Interval Patterns
-	Short intervals (~110–140 ms): likely active personal devices
-	Longer intervals (~300+ ms): power-optimized devices (beacons, wearables)

4. Anomalies and Inconsistencies
-	Same MAC address appearing with different RSSI values
    *	Caused by movement, interference, or antenna orientation
-   Very strong RSSI (–35 dBm) but non-connectable
    *   Indicates advertising-only devices (beacons)

## 6. Environmental Effects
Physical Obstructions
-	Walls, doors, and human bodies significantly reduce signal strength indoors
Environmental Noise
-	Wi-Fi (2.4 GHz), other BLE devices, and electronics cause interference
Transmission Power
-	Wearables and beacons transmit at lower power to save battery
-	Smartphones often transmit stronger signals

## 7. Security and Privacy Considerations
1. BLE Usage in Everyday Devices
-	Fitness trackers
-	Smartwatches
-	Smart locks
-	IoT sensors
-	Retail and navigation beacons

2. Privacy Risks
Device Tracking
-	Static MAC addresses allow passive tracking of users
Identifier Exposure
-	Device names (e.g., “EPIX”) can reveal:
    *	Device model
    *	User habits
Passive Scanning Risks
-   No user consent required for scanning
-   Attackers can collect presence and movement data

3. Mitigations
-	MAC address randomization
-	Limiting advertising data
-	Using encrypted BLE connections
-	Disabling BLE when not needed

## 8. Conclusions
-	BLE scanning reveals numerous nearby devices, even without user interaction
-	RSSI provides a useful but unreliable distance estimate
-	Indoor environments show higher device density and signal variation
-	BLE raises significant privacy concerns, especially regarding passive tracking
-	Proper configuration and awareness are essential for secure BLE usage

