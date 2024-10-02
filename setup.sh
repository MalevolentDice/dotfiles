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
sudo apt-get install -y xclip
sudo apt-get install -y firefox
sudo apt-get install -y default-jdk
sudo apt-get install -y maven
sudo apt-get install -y gradle
sudo apt-get install -y tmux
sudo apt-get install -y dotnet-sdk-8.0
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
sudo apt-get install -y piper
sudo apt-get install -y steam
sudo dpkg --add-architecture i386
sudo add-apt-repository ppa:oibaf/graphics-drivers && sudo apt-get update && sudo apt-get upgrade
echo "deb [signed-by=/etc/apt/keyrings/lutris.gpg] https://download.opensuse.org/repositories/home:/strycore/Debian_12/ ./" | sudo tee /etc/apt/sources.list.d/lutris.list > /dev/null
wget -q -O- https://download.opensuse.org/repositories/home:/strycore/Debian_12/Release.key | gpg --dearmor | sudo tee /etc/apt/keyrings/lutris.gpg > /dev/null
sudo apt update
sudo apt install libvulkan1 mesa-vulkan-drivers vulkan-utils
sudo apt install lutris

read -p "Press Enter to reboot"
sudo reboot
