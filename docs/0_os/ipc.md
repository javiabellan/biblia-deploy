# Inter Process Comunication (IPC)



## Types of IPC

#### Shared memory

- 📄 Shared files `mmap(SHARED, FILE)`
- 💽 Shared memory segment (with semaphores) `mmap(SHARED, ANON)`
- 🔒 Locks
  - 🚦 Semaphores
  - Mutex: MUTually EXclusive locks
  - Futex: Fast User-space muTEX
    - `futex(2)`
  - Spin locks
  - RW locks: Reader/writer locks

#### ✉️ Message passing
- 🚪 Pipe
  - unnamed pipes `|`
  - named pipes `mkfifo my_pipe` (aka FIFO)
    - Duda: Pueden tener varios escritores ? Creo que si
    - Duda: Pueden tener varios lectores ? Creo que no
- 📫 Queue
  - System V message queue (mas antigua, api mas rara)
  - POSIX message queue (mas moderno, api mas simple)
- ✉️ Socket:
  - Unix domain socket (unix:// address):
    - `socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)`: connection based. Send consecutive bytes.
    - `socket.socket(socket.AF_UNIX, socket.SOCK_DGRAM)`: connection-less. Send independented datagrams.
  - Internet socket:
    - `socket.socket(socket.AF_INET, socket.SOCK_STREAM)`: Realiable (Uses TCP).
    - `socket.socket(socket.AF_INET, socket.SOCK_DGRAM)`: Not realiable (Uses UDP).
- Señañes
  - Señales
  - Mascaras

https://man7.org/linux/man-pages/man1/ipcs.1.html



## System V IPC vs POSIX IPC


Both have the same basic tools. They offer a slightly different interface to those tools.

|               | SystemV IPC (see `sysvipc(7)`)             | POSIX IPC                          |
|---------------|--------------------------------------------|------------------------------------|
| Shared Memory | shmget(2), shmat(2), shmdt(2), shmctl(2)   | see `shm_overview(7)`              |
| Semaphores    | semget(2), semop(2), semctl(2)             | see `sem_overview(7)`              |
| Queues        | msgget(2), msgsnd(2), msgrcv(2), msgctl(2) | see `mq_overview(7)`               |
| Sockets       | socket(), bind(), listen(), and accept()   |                                    |
| Sockets (GET) | getmsg()                                   | recv(), recvfrom(), and recvmsg()  |
| Async IO      | - NO -                                     | select(), poll() (for queues and sockests) | 


Sys V IPC has been around for longer (1983). POSIX IPC was designed after Sys V IPC. Therefore, the designers of the POSIX API were able to learn from the strengths and weaknesses of the Sys V API. As a result the POSIX API is simpler and easier to use IMO, and I recommend it over the Sys V API.

Conclusion: **WRITE NEW CODE WITH POSIX**


https://stackoverflow.com/questions/4582968/system-v-ipc-vs-posix-ipc
https://www.tutorialspoint.com/inter_process_communication/inter_process_communication_system_v_posix.htm



## Faster to Slower
   
1. Same thread
   - Use program variables
2. Same process, different thread
   - Note that the stack is different.
   - Use global vars or HEAP  
3. Same machine, different process (IPC)
   1. Shared memory is the fastest
   2. Messege passing is slower
4. Same network, different machine
   1. UDP is faster
   2. TCP is slower (needs to stablish conn. SYNC + ACK)
5. Diff network


## References
- https://www.tutorialspoint.com/inter_process_communication/index.htm
- https://linasm.sourceforge.net/docs/syscalls/ipc.php
- https://www.mpi-hd.mpg.de/personalhomes/fwerner/research/2021/09/grpc-for-ipc







