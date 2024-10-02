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

#!/bin/bash
sudo apt update
sudo apt-get install -y kubuntu-restricted-extras
sudo apt-get install -y xclip
sudo apt-get install -y firefox
sudo apt-get install -y default-jdk
sudo apt-get install -y maven
sudo apt-get install -y gradle
sudo apt-get install -y steam
sudo apt-get install -y piper

# Discord
wget -O ~/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo dpkg -i ~/discord.deb && rm ~/discord.deb
