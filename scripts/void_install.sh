#!/bin/sh
sudo xbps-install -u xbps && sudo xbps-install -Syu && sudo \
xbps-install -y xorg-minimal xorg-fonts xprop xrdb xsel xset xsetroot \
  xsettingsd xtitle xf86-input-synaptics xf86-video-intel xdo xmodmap unzip\
  brightnessctl pipewire pulsemixer noto-fonts-ttf noto-fonts-emoji pcmanfm \
  gvfs gvfs-mtp gtk-engine-murrine android-udev-rules picom neovim git make \
  github-cli nodejs chromium mpv elogind i3lock dmenu feh gcc libX11-devel \
  libXft-devel libXinerama-devel arc-theme breeze-icons lxappearance zsh go \
  breeze-obsidian-cursor-theme pkg-config alacritty iwd docker docker-compose \
  file-roller htop pfetch

sudo usermod -aG docker,input,audio,video $USER && \
  usermod -s /bin/zsh $USER && scripts/ohMyZsh.sh && cp -v scripts/{.xinirc,.zprofile,.zshrc} $HOME && \
  mkdir $HOME/.config && cp -vr scripts/{alacritty,neovim} $HOME/.config 

sudo ln -s /etc/sv/dbus /var/service && \
  ln -s /etc/sv/elogind /var/service && \
  ln -s /etc/sv/polkitd /var/service && \
  ln -s /etc/sv/iwd /var/service && \
  rm -rf /var/service/wpa_supplicant 

sudo mkdir /etc/pipewire/pipewire.conf.d && \ 
ln -s /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d && \
ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d

sudo cp -rv apps/.dwm $HOME && \
  make -C $HOME/.dwm/dwm-6.4 install

git clone --depth 1 https://github.com/wbthomason/packer.nvim \
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim 
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

mkdir -p $HOME/Pictures/wallpapers && cp -v img/current.png $HOME/Pictures/wallpapers
