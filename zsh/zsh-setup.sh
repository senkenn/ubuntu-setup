#!/bin/bash

# install zsh
sudo apt-get install -y zsh
sudo sed -i.bak "s|$HOME:/bin/bash|$HOME:/bin/zsh|" /etc/passwd

# install zsh extension (prezto)
git clone --recursive https://github.com/sorin-ionescu/prezto.git $HOME/.zprezto
ln -s $HOME/.zprezto/runcoms/zlogin    $HOME/.zlogin \
  && ln -s $HOME/.zprezto/runcoms/zlogout   $HOME/.zlogout \
  && ln -s $HOME/.zprezto/runcoms/zpreztorc $HOME/.zpreztorc \
  && ln -s $HOME/.zprezto/runcoms/zprofile  $HOME/.zprofile \
  && ln -s $HOME/.zprezto/runcoms/zshenv    $HOME/.zshenv
echo "zstyle ':prezto:module:prompt' theme 'powerlevel10k'" >> $HOME/.zpreztorc
cp $HOME/ubuntu-setup/zsh/.zshrc $HOME
cp $HOME/ubuntu-setup/zsh/.p10k.zsh $HOME
