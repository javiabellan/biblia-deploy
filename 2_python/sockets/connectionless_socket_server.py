

######################## Program 1 (Publisher)


import socket
import threading

host = "127.0.0.1" # 'localhost'
port = 5555        # 10000

clients_addresses = []


# Create a UDP socket
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.bind((host, port))


# ACCEPT NEW CLIENTS (SUBSCRIBERS) LOOP

def accept_new_clients():
    while True:
        data, client_hostport = sock.recvfrom(4096)
        clients_addresses.append(client_hostport)
        print(f"New client address: {client_hostport}", flush=True)

accept_new_clients_thread = threading.Thread(target=accept_new_clients)
accept_new_clients_thread.start()



# SERVER NOTIFICATIONS LOOP

while True:
    message = input("Enter a message: ") # b"asdfasdfasdf"
    for client_addr in clients_addresses:
        print(f"Sending message to {client_addr}")
        sock.sendto(message.encode(), client_addr)







