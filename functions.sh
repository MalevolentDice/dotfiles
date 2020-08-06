#!/bin/bash
dotfilesDir=$(pwd)

function linkDotfile {
  dotFile="${HOME}/${1}"
  dateString=$(date +%Y-%m-%d-%H%M)

  [ -h "${dotFile}" ] && rm "${dotFile}"
  [ -f "${dotFile}" ] && mv "${dotFile}"{,."${dateString}"}
  [ -d "${dotFile}" ] && mv "${dotFile}"{,."${dateString}"}

  echo "Creating symlink: ${dotFile}"
  ln -s "${dotfilesDir}/${1}" "${dotFile}"
}

function install {
  local program="${1}"
  if [ ! "$(which "${program}")" ]; then
    echo "Installing: ${program}..."
    sudo apt-get -y install "${program}"
  else
    echo "Already installed: ${program}"
  fi
}

function installDiscord {
  wget -O ~/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
  sudo gdebi ~/discord.deb && rm ~/discord.deb
}
