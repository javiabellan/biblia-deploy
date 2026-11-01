

╭─────────────────────────────────────────────────────────╮
│              Applications                               │
│                         ╭───────────────────────────────┤
│                         │         System Libraries      │
╰─────────────────────────┴───────────────────────────────╯

╭─────────────────────────────────────────────────────────╮
│              System calls                               │
╰─────────────────────────────────────────────────────────╯
                   (read,write,open,stat,chmod)  socketcall
                   ╭────────────────────────╮      
                   │         VFS            │      
                   ╰────────────┬───────────╯
 ╭──────────────────────╮   ╭───┴──────────────────────────────────╮
 │     File System      │   │           Sockets                    │
 ╰──────────────────────╯   ╰────┬───────────┬─────────┬────────┬──╯
                            SOCK_STREAM  SOCK_DGRAM  SOCK_RAW   │xs
                            ╭────┴────╮  ╭───┴────╮    │     ╭──┴───╮
                            │   TCP   │  │  UDP   │    │     │ ICMP │  Trasport layer
                            ╰─────┬───╯  ╰───┬────╯    │     ╰──┬───╯
                            ╭─────┴──────────┴─────────┴────╮
                            │             IP              │ Network layer
                            ╰─────────────────────────────╯
                                              ╭───┴───╮ 
                                              │  ARP  │
                                              ╰───┬───╯ 
                            ╭─────────────────────────────╮
                            │          Data link          │
                            ╰─────────────────────────────╯

http://www.embeddedlinux.org.cn/linux_net/0596002556/understandlni-CHP-13-SECT-1.html





socketcall()
- accept(2)
- bind(2)
- connect(2)
- getpeername(2)
- getsockname(2)
- getsockopt(2)
- listen(2),
- recv(2)
- recvfrom(2)
- recvmsg(2)
- send(2)
- sendmsg(2)
- sendto(2)
- setsockopt(2)
- shutdown(2)
- socket(2)
- socketpair(2)

