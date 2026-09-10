#!/bin/bash

### If any command fails , immediately stop the script ###
set -e

### Copy the latest config in the backup repo ###
rsync -a --delete ~/.config/hypr/ ~/dotfiles-backup/hypr/

### Moving into the dotfiles-backup repo ###
cd ~/dotfiles-backup

### Add all fils ###
git add -A

### If changes happens , backup it ###
if ! git diff --cached --quiet; then
	git commit -m "auto backup : $(date '+%Y-%m-%d %H:%M:%S')"
	git push
else
	echo "No Changes to back up. "
fi
