"""
multi_sensor.py
Simulates multiple IoT sensors in parallel, each publishing on its own MQTT topic.

Available sensors:
  - temperature  →  savonia/zzz/temperature
  - humidity     →  savonia/zzz/humidity
  - pressure     →  savonia/zzz/pressure
  - co2          →  savonia/zzz/co2
  - light        →  savonia/zzz/light
"""

import paho.mqtt.client as mqtt
import random
import time
import threading

# ── Configuration ─────────────────────────────────────────────────────────────
BROKER   = "broker.emqx.io"
PORT     = 1883
INTERVAL = 5   # seconds between each reading

SENSORS = [
    {
        "name":  "Temperature",
        "topic": "savonia/zzz/temperature",
        "unit":  "°C",
        "min":   20.0,
        "max":   35.0,
    },
    {
        "name":  "Humidity",
        "topic": "savonia/zzz/humidity",
        "unit":  "%",
        "min":   30.0,
        "max":   80.0,
    },
    {
        "name":  "Pressure",
        "topic": "savonia/zzz/pressure",
        "unit":  "hPa",
        "min":   980.0,
        "max":   1025.0,
    },
    {
        "name":  "CO2",
        "topic": "savonia/zzz/co2",
        "unit":  "ppm",
        "min":   400.0,
        "max":   1200.0,
    },
    {
        "name":  "Light",
        "topic": "savonia/zzz/light",
        "unit":  "lux",
        "min":   0.0,
        "max":   1000.0,
    },
]
# ──────────────────────────────────────────────────────────────────────────────


def on_connect(client, userdata, flags, rc):
    if rc == 0:
        print(f"[MQTT] Connected to broker {BROKER}")
    else:
        print(f"[MQTT] Connection failed (code {rc})")


def sensor_loop(client: mqtt.Client, sensor: dict) -> None:
    """Infinite loop for one sensor: generates and publishes a value every INTERVAL seconds."""
    name  = sensor["name"]
    topic = sensor["topic"]
    unit  = sensor["unit"]
    lo    = sensor["min"]
    hi    = sensor["max"]

    # Random offset so sensors don't all publish at the same time
    time.sleep(random.uniform(0, INTERVAL))

    while True:
        value = round(random.uniform(lo, hi), 2)
        client.publish(topic, value, qos=1)
        print(f"  [{name:>12}]  {value:>8} {unit:<4}  →  {topic}")
        time.sleep(INTERVAL)


def main() -> None:
    client = mqtt.Client(client_id="multi_sensor_publisher")
    client.on_connect = on_connect
    client.connect(BROKER, PORT, keepalive=60)
    client.loop_start()

    print("=== Multi-Sensor Publisher ===")
    print(f"Broker  : {BROKER}:{PORT}")
    print(f"Active sensors: {len(SENSORS)}")
    print("-" * 55)

    threads = []
    for sensor in SENSORS:
        t = threading.Thread(target=sensor_loop, args=(client, sensor), daemon=True)
        t.start()
        threads.append(t)

    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        print("\nShutting down sensors.")
    finally:
        client.loop_stop()
        client.disconnect()


if __name__ == "__main__":
    main()