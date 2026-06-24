#!/bin/bash
# Install dotfiles using symlinks
cd "$(dirname "$0")"
sudo pacman -S --needed stow
for dir in */; do
	stow "${dir%/}"
done
echo "Dotfiles were linked"
