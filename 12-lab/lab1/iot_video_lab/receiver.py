import socket
import os

HOST = "127.0.0.1"
PORT = 5001
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
SAVE_FOLDER = os.path.join(BASE_DIR, "received_videos")

os.makedirs(SAVE_FOLDER, exist_ok=True)
print(f"Dossier surveillé : {os.path.abspath(SAVE_FOLDER)}")
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind((HOST, PORT))
server.listen(5)

print("Receiver is waiting for files...")

while True:
    conn, addr = server.accept()
    print(f"Connected by {addr}")

    # Receive filename first
    filename = conn.recv(1024).decode().strip()
    conn.sendall(b"FILENAME_OK")

    save_path = os.path.join(SAVE_FOLDER, filename)

    with open(save_path, "wb") as f:
        while True:
            data = conn.recv(4096)
            if data == b"EOF":
                break
            f.write(data)

    print(f"Received: {filename}")
    conn.sendall(b"OK")
    conn.close()