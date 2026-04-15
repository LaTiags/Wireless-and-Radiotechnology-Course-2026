# IoT Video Pipeline Lab

## Team

| Role     | Laptop |
|----------|--------|
| Sender   | Laptop A |
| Receiver | Laptop B |

**Receiver IP address:** `192.168.X.X` *(à remplacer par l'IP réelle de Laptop B)*

---

## Project Structure

```
Laptop A (Sender)
iot_video_lab/
├── recorder.py
├── sender.py
└── videos/

Laptop B (Receiver)
iot_video_lab/
├── receiver.py
└── received_videos/
```

---

## How to Run

### 1. Start the receiver (Laptop B)

```bash
python receiver.py
```

Leave it running — it listens on port `5001` and waits for incoming files.

### 2. Start the recorder (Laptop A — window 1)

```bash
python recorder.py
```

Records a 10-second video every 2 minutes and saves it to the `videos/` folder.

### 3. Start the sender (Laptop A — window 2)

```bash
python sender.py
```

Watches the `videos/` folder every 5 seconds, sends each `.mp4` to the receiver, and deletes the local file only after receiving `OK` confirmation.

---

## How It Works

```
Record → Save locally → Send over TCP → Wait for OK → Delete local file
```

1. `recorder.py` opens the webcam and saves timestamped `.mp4` clips into `videos/`
2. `sender.py` detects new files, connects to the receiver, and streams the file
3. `receiver.py` receives the file, saves it to `received_videos/`, and replies `OK`
4. `sender.py` deletes the local copy only after the `OK` is received

---

## Results

- ✅ Videos recorded automatically every 2 minutes
- ✅ Videos transferred automatically over the network
- ✅ Receiver stored each video in `received_videos/`
- ✅ Sender deleted each file only after transfer confirmation

---

## Problems & Fixes

### Problem 1 — `videos/` folder not found

The sender couldn't find the `videos/` folder because `os.listdir("videos")` looks relative to the current working directory, which changes depending on where the script is launched from.

**Fix:** Use an absolute path based on the script location:

```python
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
VIDEO_FOLDER = os.path.join(BASE_DIR, "videos")
```

### Problem 2 — Videos received but corrupted / incomplete

The original protocol used `b"EOF"` as a transfer terminator. Since TCP is a byte stream, `EOF` could arrive split across chunks or fused with video data, causing the receiver to never detect the end — or to write `EOF` into the file.

**Fix:** Send the file size as a header before the content using `struct.pack`. The receiver reads exactly that many bytes, no marker needed.

```python
# Sender
file_size = os.path.getsize(filepath)
client.sendall(struct.pack(">Q", file_size))  # 8-byte header

# Receiver
file_size = struct.unpack(">Q", recv_exact(conn, 8))[0]
# then read exactly file_size bytes
```

---

## Requirements

```bash
# Both laptops
python --version  # Python 3.x required

# Laptop A only
pip install opencv-python
```

Both laptops must be on the same WiFi network. If the connection fails, check Windows Firewall settings and verify the IP address with `ipconfig`.