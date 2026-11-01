

# Protocols


- Data format
  - Text: HTTP 1, JSON, XML
  - Binary: HTTP2, HTTP3, protbuf, Redis' RESP
- Transfer mode
  - Message: UDP, HTTP
  - Stream of bytes: TCP, WebRTC



http:// 1, 1.1, 2, 3
https http + tls
grpc
soap
ftp://
ws://
rabitMQ
  - ampq://
  - stomp://
  - mqtt://

apache thrift

# server-server communication (IPC and microservices)

- Kafka (publishers and sucribers)
- RabbitMQ
- Twitter's Finagle 


# Client-server communication (internet)

- Patters
  - Request-response (Sync IO) (HTTP)
  - Polling (Async IO) (HTTP)
  - Push (WebSocket)
  - SSE: Server Sent Events (HTTP)
- Data
  - XML
  - JSON
  - Protocl Buffers 



--------
## Request-response (Sync IO) (HTTP)

    Client      Server
       |           |
   Send|---------->|
 Blocks|           |
   Recv|<----------|


## Polling (Async IO) (HTTP)
- Upluad a video

    Client      Server
       |           |
   Send|---------->|
       |           |
  Check|---------->|
   Recv|<----------|


## Push (WebSocket)

    Client      Server
       |           |
       |<.........>| Bidirectional connection stablished
       |           |
  Notif|<----------|


#### Clinet code

```js
let ws = new WebSocket("ws://localhost:8080"); // Bidirectional connection stablished
ws.onmessage = msg => console.log(`${msg.data}`); // Callback for reciving msgs
ws.send("hi"); // Sebd msg
````



## SSE (server sent events) (HTTP)

Is a normal HTTP request, but the response does not finish (final 2 lines \n\n) until the final mensage is sent.

the 

    Client      Server
       |           |
   Send|---------->|
       |           |
  RecvA|<----------| send head "Conten-Type": "text/event-stream"
  RecvB|<----------| send head "Conten-Type": "text/event-stream"


### Clinet code

```js
let sse = new EventSource("http://ip:port/endpoint");
sse.onmessage = console.log;
```

Nota: ChatGPT usa SSE para mostrar la respuresta palabra por palabra, pero en el cliete no usa `EventSource`, sino que usan su propia libria


# Publisher-suscribers


Multiple concurrent requests from the same client --> HTTP/2 (multiplexing)
Fewer requests but from many clients --> HTTP/1.1 (vanilla simple)


websockets: Stablish the connection once, then both can push events in both directtions
sse (server sent events): Cliente makes a request, then server can respons multiple times
gRPC