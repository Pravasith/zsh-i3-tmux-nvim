#!/bin/bash

current_hour=$(date +"%H")

# Ask the user for the target platform
read -p "'D' for dark theme, 'L' for light theme. Enter: " theme

# Convert the input to lowercase for case-insensitive comparison
theme=$(echo "$theme" | tr '[:upper:]' '[:lower:]')
src_dir="$HOME/.config/alacritty"

# Check the user input and print a message accordingly
if [ "$theme" = "d" ]; then
    echo "Applying dark theme..."
    cp "$src_dir/dark.toml" "$src_dir/alacritty.toml"
    echo "Applied dark theme"

elif [ "$theme" = "l" ]; then
    echo "Applying light theme..."
    cp "$src_dir/light.toml" "$src_dir/alacritty.toml"
    echo "Applied light theme"

else
    echo "Invalid input. 'D' for dark theme, 'L' for light theme. Quitting..."
fi


# if [ "$current_hour" -ge 17 ]; then
#     echo "dark theme applied" >> ./output.log
#     cp dark.toml alacritty.toml
# else
#     echo "light theme applied" >> ./output.log
#     cp light.toml alacritty.toml
# fi
