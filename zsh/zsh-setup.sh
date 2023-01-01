#!/bin/sh

# install zsh
sudo apt-get install -y zsh
sudo sed -i.bak "s|$HOME:/bin/bash|$HOME:$/bin/zsh|" /etc/passwd

# install zsh extension (prezto)
git clone --recursive https://github.com/sorin-ionescu/prezto.git $HOME/.zprezto
ln -s $HOME/.zprezto/runcoms/zlogin    $HOME/.zlogin \
  && ln -s $HOME/.zprezto/runcoms/zlogout   $HOME/.zlogout \
  && ln -s $HOME/.zprezto/runcoms/zpreztorc $HOME/.zpreztorc \
  && ln -s $HOME/.zprezto/runcoms/zprofile  $HOME/.zprofile \
  && ln -s $HOME/.zprezto/runcoms/zshenv    $HOME/.zshenv \
  && ln -s $HOME/.zprezto/runcoms/zshrc     $HOME/.zshrc
echo "zstyle ':prezto:module:prompt' theme 'powerlevel10k'" >> $HOME/.zpreztorc
echo 'alias d="docker"' >> $HOME/.zshrc
echo 'alias dc="docker compose"' >> $HOME/.zshrc
echo 'alias ll="ls -AlF"' >> $HOME/.zshrc
echo '[[ ! -f $HOME/.p10k.zsh ]] || source $HOME/.p10k.zsh' >> $HOME/.zshrc
cp $HOME/ubuntu-setup/zsh/.p10k.zsh $HOME
