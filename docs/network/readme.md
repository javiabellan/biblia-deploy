



## Referencias




- Hussein Nasser
  - [Cursos Udemy](https://www.udemy.com/user/hussein-nasser-7)
    - [Fundamentals of Backend Engineering](https://www.udemy.com/course/fundamentals-of-backend-communications-and-protocols/), [link2](https://drive.google.com/drive/folders/1uLVsVHNfpc0mvGUO8Jigxm6hF_yz58KQ)
    - [Introduction to NGINX](https://www.udemy.com/course/nginx-crash-course/), [link2](https://drive.google.com/drive/folders/1Mz2QMfHHLtS32sg9u8nVqn8KQXnFVNC6)
    - [Fundamentals of Networking Engineering](https://www.udemy.com/course/fundamentals-of-networking-for-effective-backend-design)
    - [Fundamentals of Database Engineering](https://www.udemy.com/course/database-engines-crash-course/)
    - [Python on the Backend](https://www.udemy.com/course/python-on-the-back-end-for-beginners-http-server/)
  - Youtube [Channel](https://www.youtube.com/@hnasr) [playlists](https://www.youtube.com/@hnasr/playlists)
    - [Network Engineering playlist](https://youtube.com/playlist?list=PLQnljOFTspQUBSgBXilKhRMJ1ACqr7pTr) 58 videos
    - [Computer Networking Playlist (thenewboston)](https://www.youtube.com/playlist?list=PL6gx4Cwl9DGBpuvPW0aHa7mKdn_k9SPKO)



## OSI model


|   | Layer        | Protocol     | "Sees"                    | Here we send
|---|--------------|--------------|---------------------------|----------------
| 7 | Application  | HTTP,gRPC    | HTTP Enpoints             |
| 6 | Presentation |              | Serailization/encoding    |
| 5 | Session      | TLS          | Session state             |
| 4 | Trasport     | TCP/UDP/QUIC | Ports                     | Segments(TCP), Datagram(UDP)
| 3 | Network      | IP           | IP adressses              | Packets
| 2 | Data Link    | MAC          | Phisical (MAC) adresses   | Frames
| 1 | Physical     |              | Electricity, fiber, radio | Bits


At the end of the day...
- ...Layers 5,6,7 all can be considered application layer
- ...Pyhical layer 1 can not be considered a layer, because is the medium itself.

```
Client                           Load balancer  Server
  _                              Proxy _ lvl7     _
  7|                     Firewall     |7|        |7
  6|                    Proxy lvl4    |6|        |6
  5|            Router       _        |5|        |5
  4|   Switch     _         |4|       |4|        |4
  3|     _       |3|        |3|       |3|        |3
  2|    |2|      |2|        |2|       |2|        |2
  1|____|1|______|1|________|1|_______|1|________|1
```

The lower the layer, the fastest.
- So switches (layer 2) are the fastest device.
- Layer 5 devices are rare but exist. (to manually managing sessions)
- Layer 6 devices never appears
- Layer 7 devices are the slower, specially if decrypition is involved (HTTPS).





## IPtables

Videos Hussein Nasser (1 Hora)
- [iptables Demystified - Port Redirection and Forwarding HTTP Traffic to another machine (part 1)](https://youtu.be/NAdJojxENEU)
- [iptables Demystified - Load Balancing without a Load Balancer (no software installation) (part 2)](https://youtu.be/-CraNvj48J0)





## Mixed content

Si una web HTTPS solicita algo HTTP (por ejemplo una imagen) es un **mixed content error**

SOLUCION: Un reverse proxy de NGNX




## CORS (Cross-Origin Resource Sharing)

Si una web (dominio A) solicita algo de un dominio distinto (por ejemplo una imagen) se produce un **error CORS**.

- Se considera un dominio distinto cuando:
  - Si cambia el subdominio (http://example.com vs http://www.example.com)
  - Si cambia el protocolo (http://example.com vs https://example.com)
  - Si cambia el puerto (http://example.com vs http://example.com:1000)
- Se considera el mismo dominio cuando:
  - Cambia el path (http://example.com vs http://example.com/path)

SOLUCION: **Que la cosa solicitada venga del mismo dominio, o en caso contrario traiga la cabecera HTTP** `Access-Control-Allow-Origin: *` o similar

https://www.youtube.com/watch?v=4KHiSt0oLJ0
https://developer.mozilla.org/es/docs/Glossary/CORS#cabeceras_cors




## Firewall

```bash
# iptables is already installed. I like ufw.

pacman -S ufw                # Install ufw
ufw enable                   # Enable it only once, when package is installed
ufw status verbose           # Check its status
systemctl start ufw          # Start the firewall
systemctl enable ufw         # Enable the start-up with the system [option a]
systemctl enable ufw.service # Enable the start-up with the system [option b]
```


## VPN

El protocolo SSTP (Secure Socket Tunneling Protocol) se utiliza para configurar las llamadas ,

PPTP -- The veteran VPN protocol. poor security
SSTP --(+ SSL for security)
OpenVPN --
L2TP   (+ IPSec for security)
IKEv2


- VPN de Centic: (PPP+SSL)
- VPN de GTRES: (Cisco IPSec), necesita:
  - Gateway (Direccion de servidor): vpn.gtresonline.com
  - Usuario (Nombre de cuenta): xxxxx
  - Contraseña (Contraseña): xxxxx
  - Secreto compartido: xxxxxx

openvpn
wireguard



## SSE





## maximo de 6 conxiones simultanesas


## caching mechanism
Memcached



## Reverse proxy
a system that forwards all requests from the web to our web server and back




- Que pasa si alguien sube una imagen (o imagenens) muy pesada? Relentiza el servidor?
  - gunicorn bloquearia la petición
  - Pero ngixn haria offloading buffering




## Load balancing

"failover" or "load balancing", which is where two servers provide the same service but allow for distribution in the event of problems.

Services like NGINX, Cloudflare, Apigee, AWS ELB, [HAProxy](http://www.haproxy.org/)


Existen distintos criterios para balancear:

- Por tamaño de paquete
- Por numero de peticiones
- ... 




