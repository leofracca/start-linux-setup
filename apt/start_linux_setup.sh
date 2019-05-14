#!/bin/bash

# If it is equal to 0 you are root
# This script must be run as a normal user
if [ "$EUID" = 0 ]
  then echo "You are root. Please run this script as a normal user!"
  exit 1
fi

# System update
echo "Updating your system..."
sudo apt update -y && sudo apt upgrade -y

############################################

# Balena Etcher: to create Live USB
echo "Installing Balena Etcher..."
echo "deb https://deb.etcher.io stable etcher" | sudo tee /etc/apt/sources.list.d/balena-etcher.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61
sudo apt-get update
sudo apt-get install balena-etcher-electron -y

# Chromium: Google's open source browser
echo "Installing Chromium..."
sudo apt install -y chromium-browser

# Git: free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.
echo "Installing Git..."
sudo apt install -y git

# Google Chrome: needs no introduction
echo "Installing Google Chrome..."
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt update && sudo apt upgrade
sudo apt install -y google-chrome-stable

# Gimp: GNU Image Manipulation Program
echo "Installing Gimp..."
sudo apt install -y gimp

# Inkscape: vector edit graphics
echo "Installing Inkscape..."
sudo apt install -y inkscape

# Htop: see all active process
echo "Installing Htop..."
sudo apt install -y htop

# Nano: small text editor
echo "Installing Nano..."
sudo apt install -y nano

# Neofetch: CLI system information tool
echo "Installing Neofetch..."
sudo apt install -y neofetch

# Spotify: music player
echo "Installing Spotify..."
sudo snap install spotify # using snap

# Telegram: client desktop for Telegram
echo "Installing Telegram..."
sudo apt install -y telegram-desktop

# Visual Studio Code: text editor by Microsoft
echo "Installing Visual Studio Code..."
sudo snap install --classic code # using snap

############################################

# EXTENSIONS (only for GNOME)
if [ "$DESKTOP_SESSION" = "gnome" ]
  # Gnome Tweaks: program that allows you to customize Gnome
  echo "Installing Gnome Tweaks..."
  sudo apt install -y gnome-tweaks

  # Enable theme modification
  sudo apt install -y gnome-shell-extension-user-theme
  # Install Dash to Dock
  sudo apt install -y gnome-shell-extension-dashtodock

  # ICONS
  # Papirus Icon Theme
  echo "Installing Papirus Icon Theme..."
  sudo apt install -y papirus-icon-theme

  # THEMES
  # Materia Theme
  echo "Installing Materia Theme..."
  sudo apt install -y materia-gtk-theme
  # Adapta Theme
  echo "Installing Adapta Theme..."
  sudo apt install -y adapta-gtk-theme
  # Arc Theme
  echo "Installing Arc Theme..."
  sudo apt install -y arc-theme

  # CURSORS
  # Breeze Cursor
  echo "Installing Breeze Cursor..."
  sudo apt install -y breeze-cursor-theme
  # Breeze-Adapta Cursor
  git clone https://github.com/mustafaozhan/Breeze-Adapta.git && cd Breeze-Adapta && chmod +x install.sh && sh install.sh
  cd

  # APPLYING
  # Theme (Materia-dark-compact)
  gsettings set org.gnome.desktop.interface gtk-theme 'Materia-dark-compact'
  # Cursor (Breeze-Snow)
  gsettings set org.gnome.desktop.interface cursor-theme 'Breeze-Adapta'
  # Icon pack (Papirus-Dark)
  gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
  # Top bar
  # gsettings set org.gnome.shell.extensions.user-theme name 'Materia-dark-compact'
fi

# Refresh
sudo apt update -y && sudo apt upgrade -y

# All programs installed
echo "Done. All programs installed!"

# Reboot?
read -p "To apply all changes a reboot is required. Do you want reboot? [y/n]: " reboot
if [ $reboot == "y" ]
then
	reboot
else
	echo "Thank you for using the script!"
fi
exit
