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

function installDiscord {
  wget -O ~/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
  sudo dpkg -i ~/discord.deb && rm ~/discord.deb
}