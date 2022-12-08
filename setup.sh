GIT_USERNAME=$1
GIT_USEREMAIL=$2
RUST_TOOLCHAIN=$3
echo "Git user name: $1"
echo "Git user email: $2"
echo "Rust Toolchain Version: $3"

# set directory name under home directory to English
LANG=C xdg-user-dirs-gtk-update

# install minimum libraries
sudo apt update && sudo apt install -y git curl

# git initial setup
git config --global user.name $GIT_USERNAME
git config --global user.email senken32@gmail.com
git config --global init.defaultBranch main

# Install Docker, Docker Compose 
sudo snap install docker

# Install VSCode
curl -L https://go.microsoft.com/fwlink/?LinkID=760868 -o vscode.deb
sudo apt install -y ./vscode.deb && rm ./vscode.deb

# Install Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb

# install discord
sudo snap install discord

# install copyq
sudo apt install -y copyq

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | \
    sh -s -- -y --default-toolchain "${RUST_TOOLCHAIN}" --no-modify-path

# install xremap
cargo install xremap --features gnome

# start xremap automatically on boot
sudo cp ./xremap.service /etc/systemd/system/

# remove keyring
cp $HOME/.local/share/keyrings/login.keyring ./login-bak.keyring && rm -f $HOME/.local/share/keyrings/login.keyring

# reboot
sudo reboot