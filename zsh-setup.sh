#!/bin/sh

# install zsh
sudo apt-get install -y zsh
NEW_SHELL=$(which zsh)
sudo sed -i.bak "s|$HOME:$SHELL|$HOME:$NEW_SHELL|" /etc/passwd

# install zsh extension (prezto)
git clone --recursive https://github.com/sorin-ionescu/prezto.git $HOME/.zprezto
ln -s $HOME/.zprezto/runcoms/zlogin    $HOME/.zlogin \
  && ln -s $HOME/.zprezto/runcoms/zlogout   $HOME/.zlogout \
  && ln -s $HOME/.zprezto/runcoms/zpreztorc $HOME/.zpreztorc \
  && ln -s $HOME/.zprezto/runcoms/zprofile  $HOME/.zprofile \
  && ln -s $HOME/.zprezto/runcoms/zshenv    $HOME/.zshenv \
  && ln -s $HOME/.zprezto/runcoms/zshrc     $HOME/.zshrc
echo "zstyle ':prezto:module:prompt' theme 'powerlevel10k'" >> $HOME/.zpreztorc
cp $HOME/ubuntu-setup/zsh/.p10k.zsh $HOME
cp $HOME/ubuntu-setup/zsh/.zshrc $HOME
