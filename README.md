# dotfiles
Personal repository to store config files


```shell
sudo pacman -Syu
sudo pacman -S arch-keyring
sudo pacman -S kde-connect python nodejs nvim git obsidian zsh alacritty stow i3status-rust rofi rofi-calc gnome-tweaks ripgrep gnome-power-manager gnome-flashback polkit-gnome cargo gcc
yay -S spotify hack-nf-git i3-gnome
```

- use tweaks to invert capslock with escape
- setup git ssh [link](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
- clone dotfile repo

```shell
git clone git@github.com:Filippo831/dotfiles.git
```
- stow everything
- remove super loud beep

```shell
echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf
```
