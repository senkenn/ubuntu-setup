# set directory name under home directory to English
LANG=C xdg-user-dirs-gtk-update

# install minimum libraries
sudo apt update && sudo apt install -y git curl

# git initial setup
git config --global user.name senkenn
git config --global user.email senken32@gmail.com
git config --global init.defaultBranch main

# Install Docker, Docker Compose 
sudo snap install docker

# capslock -> ctrl
sudo sh -c "echo 'evdev:atkbd:dmi:bvn*:bvr*:bd*:svn*:pn*:pvr*\n\tKEYBOARD_KEY_3A=leftctrl' > /etc/udev/hwdb.d/90-nocaps-keyboard.hwdb" 

# Install VSCode
curl -L https://go.microsoft.com/fwlink/?LinkID=760868 -o vscode.deb
sudo apt install -y ./vscode.deb && rm ./vscode.deb

# Install Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb

# install discord
sudo apt install -y discord

# install copyq
sudo apt install -y copyq
