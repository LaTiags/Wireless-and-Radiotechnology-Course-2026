import socket
import paho.mqtt.client as mqtt

# Socket Config
HOST = "0.0.0.0"
PORT = 5000

# MQTT Config
broker = "broker.emqx.io"
topic = "savonia/zzz/temperature"

# Setup MQTT
mqtt_client = mqtt.Client()
mqtt_client.connect(broker, 1883)
mqtt_client.loop_start() # Run network loop in background

# Setup Socket
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
server.bind((HOST, PORT))
server.listen()

print("Edge device waiting for sensor...")
conn, addr = server.accept()
print("Sensor connected:", addr)

try:
    while True:
        data = conn.recv(1024)
        if not data:
            break
        
        value = data.decode()
        print("Edge received via Socket:", value)

        # Forward to MQTT
        mqtt_client.publish(topic, value)
        print("Forwarded to MQTT:", value)
finally:
    conn.close()
    mqtt_client.loop_stop()