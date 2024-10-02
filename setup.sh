#!/bin/bash
dotFileDir=$(pwd)

function linkDotFile {
  dotFile="${HOME}/${1}"
  dateString=$(date +%Y-%m-%d-%H%M)

  [ -h "${dotFile}" ] && rm "${dotFile}"
  [ -f "${dotFile}" ] && mv "${dotFile}"{,."${dateString}"}
  [ -d "${dotFile}" ] && mv "${dotFile}"{,."${dateString}"}

  echo "Creating symlink: ${dotFile}"
  ln -s "${dotFileDir}/${1}" "${dotFile}"
}

#linkDotFile .bashrc
linkDotFile .vimrc
linkDotFile .gitconfig

sudo apt update
sudo apt install -y xclip
sudo apt install -y firefox
sudo apt install -y default-jdk
sudo apt install -y maven
sudo apt install -y gradle
sudo apt install -y tmux
sudo apt install -y dotnet-sdk-8.0
dotnet tool install --global Chickensoft.GodotEnv
godotenv godot install 4.3.0
curl https://get.volta.sh | bash
volta install node

sudo apt install flatpak
flatpak install flathub org.mozilla.Thunderbird

# Discord
wget -O ~/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo dpkg -i ~/discord.deb && rm ~/discord.deb

# Games
sudo apt install -y piper
sudo apt install -y steam
sudo dpkg --add-architecture i386
sudo add-apt-repository ppa:oibaf/graphics-drivers && sudo apt update && sudo apt upgrade
echo "deb [signed-by=/etc/apt/keyrings/lutris.gpg] https://download.opensuse.org/repositories/home:/strycore/Debian_12/ ./" | sudo tee /etc/apt/sources.list.d/lutris.list > /dev/null
wget -q -O- https://download.opensuse.org/repositories/home:/strycore/Debian_12/Release.key | gpg --dearmor | sudo tee /etc/apt/keyrings/lutris.gpg > /dev/null
sudo apt update
sudo apt install libvulkan1:i386 mesa-vulkan-drivers:i386 libvulkan1 mesa-vulkan-drivers vulkan-utils
sudo apt install lutris

read -p "Press Enter to reboot"
sudo reboot
