#!/bin/bash

# install zsh
sudo apt-get install -y zsh
sudo sed -i.bak "s|$HOME:/bin/bash|$HOME:/bin/zsh|" /etc/passwd

# Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.p10k

cp $HOME/ubuntu-setup/zsh/.zshrc $HOME
cp $HOME/ubuntu-setup/zsh/.p10k.zsh $HOME
