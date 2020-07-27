#!/bin/bash
dotfilesDir=$(pwd)

function linkDotfile {
  dest="${HOME}/${1}"
  dateStr=$(date +%Y-%m-%d-%H%M)

  [ -h ~/${1} ] && rm ${dest}
  [ -f "${dest}" ] && mv ${dest}{,.${dateStr}}
  [ -d "${dest}" ] && mv ${dest}{,.${dateStr}}

  echo "Creating symlink: ${dest}"
  ln -s ${dotfilesDir}/${1} ${dest}
}

function install {
  local program="${1}"
  if [ ! "$(which "${program}")" ]; then
    echo "Installing: ${1}..."
    sudo apt-get install "${1}"
  else
    echo "Already installed: ${1}"
  fi
}

