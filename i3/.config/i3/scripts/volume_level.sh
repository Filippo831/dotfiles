#!/bin/bash

# Get current volume level
current_volume=$(amixer -D pulse sget Master | grep -oP '\d+%' | head -n1 | sed 's/%//')

# Generate a filled bar representing volume level
filled_bar=""
for (( i=0; i<current_volume; i+=5 )); do
    filled_bar="${filled_bar}█"
done

# Generate an empty bar for remaining space
empty_bar=""
for (( i=current_volume; i<100; i+=5 )); do
    empty_bar="${empty_bar}░"
done

# Combine filled and empty bars
combined_bar="${filled_bar}${empty_bar}"

# Send notification with volume level and progress bar
notify-send --replace-id=1 "Volume Level" "Current Level: ${current_volume}%\n[${combined_bar}]" -t 2000

