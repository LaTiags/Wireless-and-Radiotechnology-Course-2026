import socket

HOST = "0.0.0.0"  # Listen on all network interfaces
PORT = 5000

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1) # Allows immediate restart
server.bind((HOST, PORT))
server.listen()

print(f"Server listening on port {PORT}...")

conn, addr = server.accept()
print("Connected by:", addr)

try:
    while True:
        data = conn.recv(1024)
        if not data:
            break
        print("Sensor data received:", data.decode())
finally:
    conn.close()
    server.close()