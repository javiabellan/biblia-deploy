Then there are those of you who like to use your own editors. That is completely fine. For this, we require sshfs which has ports on many different machines.




## Install client

Mac
```bash
brew install --cask macfuse     # installs macfuse
brew install sshfs              # installs sshfs
```

- Windows https://github.com/billziss-gh/sshfs-win
- Mac https://github.com/osxfuse/osxfuse/wiki/SSHFS
- Linux https://help.ubuntu.com/community/SSHFS


## Usage

```bash
mkdir ~/remote
sudo sshfs NETID@sp24--???.cs.illinois.edu:/<MOUNT_POINT> ~/remote
sudo umount ~/remote # Once you’re done, you can unmount it with
```

At that point, the files on your VM are synced with the files on your machine and edits can be made and will be synced.

https://cs341.cs.illinois.edu/tutorials/sshfs
https://cs341.cs.illinois.edu/coursebook/Background#editors