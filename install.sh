#!/bin/bash

echo "ImJotaa Dotfiles will be installed"
read -p "Do you want to save the current ~/.config/ directory? [Y/n] " answer

# Create Dotfiles directory
if [[ ! -d "~/Dotfiles" ]]; then
	mkdir ~/Dotfiles/
fi

# Remove directory ~/.config/ directory if answer ir no 
if [[ "$answer" == "n" || "$answer" == "N" ]]; then
	echo "Configuration will be removed"
	rm -rf ~/.config/*
# Save a copy if answer is yes
else
	echo "Configuration will be saved in ~/Dotfiles/Old_configuration/"
	mkdir ~/Dotfiles/Old_configuration	
	mv ~/.config/ ~/Dotfiles/Old_configuration/.config
fi

# Remove ~/.config directory and create symlink to new Dotfiles
rm -rf ~/.config
ln -s ~/Dotfiles/ImJotaa-dotfiles/.config ~/.config
