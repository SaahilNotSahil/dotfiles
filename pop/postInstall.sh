#!/bin/bash

echo "Welcome to the Pop OS Post Install Script!"
echo "                           -authored by XanderWatson"
echo "Let's get you started!"

sudo apt update && sudo apt upgrade -y
sudo apt install -y snapd git vim gcc g++ make cmake gdb llvm clang bison flex build-essential
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O ~/Downloads/chrome.deb
sudo dpkg -i ~/Downloads/chrome.deb
wget https://az764295.vo.msecnd.net/stable/899d46d82c4c95423fb7e10e68eba52050e30ba3/code_1.63.2-1639562499_amd64.deb -O ~/Downloads/code.deb
sudo dpkg -i ~/Downloads/code.deb
sudo apt install -y python3-pip
sudo apt upgrade -y
sudo snap install discord
echo "export PATH='~/.local/bin:$PATH'" >> ~/.bashrc
source ~/.bashrc

