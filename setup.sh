#!/bin/sh

if [ $# -lt 3 ]; then
  echo Error: Missing arguments
  echo ./setup.sh [Git user name] [Git user email] [Rust Toolchain Version]
  exit
fi

GIT_USERNAME=$1
GIT_USEREMAIL=$2
RUST_TOOLCHAIN=$3
echo "Git User Name         : $1"
echo "Git User Email        : $2"
echo "Rust Toolchain Version: $3"

read -p "ok? (y/N): " yn
case "$yn" in [yY]*) ;; *) echo "abort." ; exit ;; esac

# set directory name under home directory to English
LANG=C xdg-user-dirs-gtk-update

# install minimal libraries
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get install -y git curl

# set system language to English
sudo update-locale LANG=en_US.UTF8

# install zsh
sudo apt-get install -y zsh
NEW_SHELL=/usr/bin/zsh
sudo sed -i.bak "s|$SHELL|$NEW_SHELL|" /etc/passwd

# install zsh extension (prezto)
RUN git clone --recursive https://github.com/sorin-ionescu/prezto.git $HOME/.zprezto
RUN ln -s $HOME/.zprezto/runcoms/zlogin    $HOME/.zlogin \
  && ln -s $HOME/.zprezto/runcoms/zlogout   $HOME/.zlogout \
  && ln -s $HOME/.zprezto/runcoms/zpreztorc $HOME/.zpreztorc \
  && ln -s $HOME/.zprezto/runcoms/zprofile  $HOME/.zprofile \
  && ln -s $HOME/.zprezto/runcoms/zshenv    $HOME/.zshenv \
  && ln -s $HOME/.zprezto/runcoms/zshrc     $HOME/.zshrc
echo "zstyle ':prezto:module:prompt' theme 'powerlevel10k'" >> $HOME/.zpreztorc
\cp -f zsh/.* $HOME

# git initial setup
git config --global user.name $GIT_USERNAME
git config --global user.email $GIT_USEREMAIL
git config --global init.defaultBranch main
git config --global --add safe.directory *

# Install Docker, Docker Compose -> https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
# Do not use snap install. Not working well on VSCode Dev Containers extension
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Use docker command without sudo
sudo groupadd docker
sudo usermod -aG docker $USER

# set firewall
# sudo ufw default deny
# sudo ufw enable

# Install VSCode
curl -L https://go.microsoft.com/fwlink/?LinkID=760868 -o vscode.deb
sudo apt install -y ./vscode.deb && rm ./vscode.deb

# Install Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb && rm ./google-chrome-stable_current_amd64.deb

# install discord
sudo snap install discord

# install copyq
sudo apt install -y copyq

# install rust
sudo apt install -y gcc
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | \
    sh -s -- -y --default-toolchain "${RUST_TOOLCHAIN}"
source "$HOME/.cargo/env"

# install xremap
cargo install xremap --features gnome

# start xremap automatically on boot
sudo cp ./xremap/xremap.service /etc/systemd/system/
sudo systemctl enable xremap.service

# remove login keyring
cp $HOME/.local/share/keyrings/login.keyring ./login-bak.keyring && rm -f $HOME/.local/share/keyrings/login.keyring

# set keybindings
./keybindings.sh

# reboot
sudo reboot
