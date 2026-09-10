#!/bin/bash

# Pick a random image from your wallpaper folder
WALLPAPER=$(find ~/wallpapers -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | shuf -n 1)

# Pick a random transition type (skipping the boring "none"/"simple")
TRANSITIONS=("fade" "left" "right" "top" "bottom" "wipe" "wave" "grow" "center" "outer" "any")
TRANSITION=${TRANSITIONS[$RANDOM % ${#TRANSITIONS[@]}]}

# Randomize angle (for wipe/wave) and center position (for grow)
ANGLE=$((RANDOM % 360))
POS_X=$(awk -v seed=$RANDOM 'BEGIN{srand(seed); print rand()}')
POS_Y=$(awk -v seed=$RANDOM 'BEGIN{srand(seed); print rand()}')

# Apply it
awww img "$WALLPAPER" \
  --transition-type "$TRANSITION" \
  --transition-duration 1.5 \
  --transition-fps 60 \
  --transition-angle "$ANGLE" \
  --transition-pos "$POS_X,$POS_Y" \
  --transition-wave "20,20"
