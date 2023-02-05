#!/bin/bash
source ./functions.sh

sudo apt update
sudo apt-get install -y curl
sudo apt-get install -y kubuntu-restricted-extras
sudo apt-get install -y vim
sudo apt-get install -y xclip
sudo apt-get install -y firefox
sudo apt-get install -y maven
sudo apt-get install -y snapd
sudo apt-get install -y default-jdk
sudo apt-get install -y gdebi
sudo apt-get install -y steam
sudo apt-get install -y piper
installDiscord
installDeno

sudo snap install code --classic
