# TCP Client–Server Sensor Communication

## Project Description

This project demonstrates basic client–server communication using Python sockets.
A TCP server listens for incoming connections and receives messages from a client.
The client simulates a sensor by generating random temperature data and sending it to the server every 5 seconds.

The server prints the received data and sends a confirmation message back to the client.

This project helps understand the fundamentals of network communication in Python.

---

## Bluetooth MAC Address Used

Bluetooth MAC Address used during testing:

`10:5f:ad:37:e2:53` but it has not work

*(Replace this with your actual Bluetooth MAC address.)*

---

## How to Run the Server and Client

### 1. Start the Server

Open a terminal and run:

```bash
python server.py
```

Example output:

```
Listening on 127.0.0.1:8000
Accepted connection from 127.0.0.1:53210
Received: Temperature: 23.45C
Received: Temperature: 25.12C
```

---

### 2. Start the Client

Open a **second terminal window** and run:

```bash
python client.py
```

Example output:

```
Connecting to 127.0.0.1:8000...
Connected! Starting to send telemetry data.
Sending: Temperature: 24.37C
Received from server: accepted
Waiting 5 seconds...
```

The client will continue sending temperature data every 5 seconds.

---

## Screenshot of Successful Communication


---

## Reflection

### What did you learn?

In this project I learned how TCP socket communication works in Python. I learned how to create a server that listens for connections and a client that connects and sends data. I also learned how data is sent and received using sockets and how to encode and decode messages between client and server.

---

### What was difficult?

One of the main difficulties was understanding how client and server communicate with each other and making sure both programs run at the same time. Another challenge was configuring the correct IP address and port so that the client could connect successfully to the server.

---

### Where could Bluetooth communication be useful in IoT?

Bluetooth communication is useful in many IoT applications where devices need to communicate over short distances with low power consumption. Examples include smart home devices, health monitoring devices like fitness trackers, smartwatches, and wireless sensors that send data to smartphones or local gateways.
