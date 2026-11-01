# Pacman

```bash
pacman -S {pkg}    # Install package
pacman -Syu        # Update packages. Update database (-y) and upgrade packages (-u)
pacman -Ss {pkg}   # Search for a new package

pacman -Q          # Display all installed packages
pacman -Qe         # Display only packages explicitly installed
pacman -Qn         # Display only packages installed from main repositories
pacman -Qm         # Display only packages installed from AUR
pacman -Qdt        # Display orphaned dependencies
pacman -Qs {pkg}   # Search local repository for package

pacman -R {pkg}    # Remove package {pkg}
pacman -Rs {pkg}   # Remove package as well as unneeded dependencies (-s)
pacman -Rns {pkg}  # Remove package, dependencies (-s), and system config files (-n)
pacman -Rdd {pkg}  # Remove solo ese package, dejande dependencias padres e hijos huerfanod (orphans)
```


## Update the system

```bash
# Update Arch Linux Keyring:
# The first step is to ensure that your system's keyring is up-to-date.
# The keyring contains the public keys used for verifying packages.
# Run the following command:
sudo pacman -Sy archlinux-keyring

# After updating the keyring, try running the system update again:
sudo pacman -Syu
```



## Change mirrorlist (source servers)

Conseguir los mirrors mas rapidos con `reflector`

1. Install `reflector`:

```bash
sudo pacman -S reflector
```

2. Create a backup of your current mirrorlist:

```bash
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
```

3. Run `reflector` to generate a new mirrorlist. The following example sorts the mirrors by download speed and updates the mirrorlist with the top 5 fastest mirrors:

```bash
sudo reflector --country es --latest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
```

4. After generating the new mirrorlist, you can update your package databases:

```bash
sudo pacman -Syy
```



## Change repositorises


```bash
sudo nano /etc/pacman.conf
```

No activar los reposirotrios de testing que dan problemas. Ejemplo de problema:
- linux-lts: esta solo en `core`
- nvidia-lts: está en `extra` y `extra-testing`

si esta extra-testing activado, el driver de envidia no funciona



## [Arch User Repository (AUR)](https://aur.archlinux.org/packages)

|                                     | Manually           | `yay` (AUR Helper) | `pamac` (AUR Helper) |
|:-----------------------------------:|--------------------|--------------------|----------------------|
| Preparation<br>(install yay)        |                    | `sudo pacman -S --needed base-devel git`<br>`git clone https://aur.archlinux.org/yay.git`<br>`cd yay`<br>`makepkg -si` | Default in manjaro |
| Install<br>some package<br>(chrome) | `git clone https://aur.archlinux.org/google-chrome.git`<br>`cd google-chrome`<br>`makepkg -si` | `yay -S google-chrome` | `pamac install google-chrome` |
| Upgrade<br>some package<br>(chrome) | `cd google-chrome`<br>`git pull`<br>`makepkg -si` | `yay -Syu` | `pamac upgrade -a` |


### YAY

https://www.chrisatmachine.com/Linux/03-AUR-yay/


### PARU

```bash
git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin
makepkg -si
```


## Create pacman packege

Templates:

- Single package (with specific vesion): `/usr/share/pacman/PKGBUILD.proto`
- Single package (with latest vesion, suffix `-git`): `/usr/share/pacman/PKGBUILD-vcs.proto`
- Multiple package: `/usr/share/pacman/PKGBUILD-split.proto`



## Python

### PIP: `pip install --user package`

Note we’ve installed here using the user flag to install this Python package only for the current user. However, you might prefer to use a tool like pipx to install Python applications in an isolated environment.

### Conda

Conda is SLOOOOOOOW. If you really need to use conda you can use **Mamba**



