######################## Program 2 (Subscriber)

import socket

server_host = "127.0.0.1"
server_port = 5555
server_addr = (server_host, server_port)

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)


# Send data (to connect)
try:
    print("Connecting...")
    sent = sock.sendto(b"connect", server_addr)
    print("...Connected")
except Exception as e:
    print('...ERROR', str(e))
    sock.close()

# Wait for server notifications
while True:
    message, server_hostport = sock.recvfrom(10)
    print(f"Received message: {message.decode()}", server_hostport)