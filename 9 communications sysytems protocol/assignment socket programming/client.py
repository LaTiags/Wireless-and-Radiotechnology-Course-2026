import socket
import time
import random

def run_client():
    # Configuration
    server_ip = "172.20.10.3"  # Replace with your server's IP address
    server_port = 8000         # Replace with your server's port
    
    # Create a socket object
    client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    try:
        # Establish connection with server
        print(f"Connecting to {server_ip}:{server_port}...")
        client.connect((server_ip, server_port))
        print("Connected! Starting to send telemetry data.")

        while True:
            # 1. Generate a random temperature between 18.0 and 28.0
            temp = round(random.uniform(0, 100.0), 2)
            msg = f"Temperature: {temp}C"
            
            # 2. Send the message to the server
            print(f"Sending: {msg}")
            client.send(msg.encode("utf-8")[:1024])

            # 3. Receive response from the server
            response = client.recv(1024).decode("utf-8")
            print(f"Received from server: {response}")

            # 4. Check if the server wants to close the connection
            if response.lower() == "closed":
                print("Server requested to close the connection.")
                break

            # 5. WAIT for 5 seconds before the next loop
            print("Waiting 5 seconds...")
            time.sleep(5)

    except ConnectionRefusedError:
        print("Error: Could not connect to the server. Is it running?")
    except KeyboardInterrupt:
        print("\nClient stopped by user (Ctrl+C).")
    except Exception as e:
        print(f"An error occurred: {e}")
    finally:
        # Always close the connection at the end
        client.close()
        print("Connection closed.")

if __name__ == "__main__":
    run_client()