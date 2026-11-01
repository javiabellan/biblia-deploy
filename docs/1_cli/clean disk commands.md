


lsblk
df -h


sudo du -ahx / | sort -rh | head -n 20
# du -ahx / ---> This lists all files and directories on / (which is /dev/sda2) including their sizes.
#  -a option includes files
#  -h displays sizes in human-readable format
#  -x restricts the search to the current filesystem, avoiding other mounts like /home or /tmp.
#
# sort -rh ---> This sorts the files by size in descending order
#  -r for reverse
#  -h for human-readable format).
#
# head -n 20 ---> This limits the output to the top 20 largest files.


1. Clear Pacman Cache:
sudo paccache -r
sudo pacman -Sc

2. Remove Unused Packages:
pacman -Qdtq
sudo pacman -Rns $(pacman -Qdtq)

3. Clean the var/log Directory:
sudo journalctl --vacuum-size=100M

4. Clean Temporary Files:
sudo rm -rf /tmp/*


5. Remove big packages
sudo pacman -Rns cuda
 -s dependencies which are not required by any other installed package:
 -n config files
