# Wi Fi Network Analysis (NET Analyzer)
## Objective
The objective of this section is to analyze the Wi Fi network currently connected to the smartphone using the NET Analyzer application. Key parameters such as signal strength, speed, latency, channel usage, and network configuration are examined.

## Network Information (Current Connection)
-   Connection type: Wi Fi
-   Wi Fi standard: IEEE 802.11n
-   Operating band: 2.4 GHz
-   Channel: 1 (2412 MHz)
-   Security type: Not displayed (likely WPA2 PSK, typical for this setup)

## Router and Gateway Details
-	Local IP address: 10.211.20.42
-	Subnet mask: 255.255.240.0
-	Default gateway: 10.211.31.254
-	DNS servers:
    *	10.212.26.102
    *   10.212.26.104
-   IPv6 address: fe80::8c3c:86ff:fe9a:2dc6 (link local)

## Wi Fi Performance Metrics
-   Signal strength: –60 dBm
-   Link speed (Down / Up): 72 / 72 Mbps
-   Maximum supported speed: 72 / 72 Mbps
-   Connection state: Completed
-   DHCP lease time: 8 hours
## Interpretation
-   A signal strength of –60 dBm indicates a good and stable Wi Fi connection, suitable for high reliability.
-   The link speed of 72 Mbps is consistent with 802.11n on a 2.4 GHz channel using a 20 MHz bandwidth.

## SSID and BSSID
-   SSID: Not visible (hidden or restricted by app permissions)
-   BSSID (AP MAC address): Not available

## Nearby Wi Fi Networks and Channel Usage
Based on the NET Analyzer view:
-   The network operates on Channel 1, one of the three non overlapping channels in the 2.4 GHz band (1, 6, 11).
-   In dense environments, channel 1 is often congested due to multiple nearby access points.

## Location Based Observations
When moving within the building:
-   Closer to the access point: Signal strength remains around –55 to –60 dBm with stable speed.
-   Further away / behind walls: Signal strength degrades gradually, potentially reducing throughput and increasing latency.

## Analysis of Potential Issues
1. Network Congestion
Operating on the 2.4 GHz band increases the likelihood of congestion from neighboring networks and non Wi Fi devices (Bluetooth, microwaves).
2. Channel Interference
Even though channel 1 is non overlapping, nearby access points using the same channel can cause co channel interference, reducing performance.
3. Limited Throughput
The maximum speed of 72 Mbps suggests:
-   Single spatial stream
-   Narrow channel width
-   Older Wi Fi standard compared to modern 802.11ac/ax

## Proposed Improvements
-   Change Wi Fi channel: Switch to channel 6 or 11 if they are less congested.
-   Use 5 GHz band: If supported by the router and device, migrating to 5 GHz will reduce interference and increase throughput.
-   Router repositioning: Place the router in a central, elevated position away from walls and metal objects.
-   Upgrade Wi Fi standard: Using an 802.11ac or Wi Fi 6 (802.11ax) router would significantly improve performance.
-   Security optimization: Ensure WPA2 AES or WPA3 is enabled to prevent unauthorized access and reduce unnecessary network load.

## Conclusion
The Wi Fi network provides a stable and reliable connection with good signal strength. However, performance is limited by the use of the 2.4 GHz band and the 802.11n standard. With channel optimization, improved router placement, or migration to newer Wi Fi technologies, both speed and reliability can be significantly enhanced.

