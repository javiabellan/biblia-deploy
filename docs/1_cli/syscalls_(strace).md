## `strace`

Is a cli tool to monitor the syscalls done by a process


```bash
strace myprogram
```


%clock    Trace all system calls that read or modify system clocks.
%creds    Trace all system calls that read or modify user and group identifiers or capability sets.
%desc     Trace all file descriptor related system calls.
%file     Trace all system calls which take a file name as an argument.
%fstat    Trace fstat and fstatat syscall variants.
%fstatfs  Trace fstatfs, fstatfs64, fstatvfs, osf_fstatfs, and osf_fstatfs64 system calls.
%ipc      Trace all IPC related system calls.
%lstat    Trace lstat syscall variants.
%memory   Trace all memory mapping related system calls.
%network  Trace all the network related system calls.
%process  Trace all system calls which involve process management.
%pure     Trace syscalls that always succeed and have no arguments.
%signal   Trace all signal related system calls.
%stat     Trace stat syscall variants.
%statfs   Trace statfs, statfs64, statvfs, osf_statfs, and osf_statfs64 system calls.
%%stat    Trace syscalls used for requesting file status.
%%statfs  Trace syscalls related to file system statistics.