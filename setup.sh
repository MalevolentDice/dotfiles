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

linkDotFile .vimrc
linkDotFile .gitconfig

sudo apt update
sudo apt-get install -y steam
sudo apt-get install -y piper
