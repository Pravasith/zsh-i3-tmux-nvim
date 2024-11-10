#!/bin/bash

GLB_CONF_PATH="./global-configs"

# COPY ALACRITTY CONFIG FOLDER ---------------------
ALACRITTY_SRC="$HOME/.config/alacritty"
ALACRITTY_DEST="$GLB_CONF_PATH/alacritty"

mkdir "$ALACRITTY_DEST"
find "$ALACRITTY_SRC" -maxdepth 1 -type f \
    -exec cp {} "$ALACRITTY_DEST" \;

# COPY ZSH CONFIG FILE -----------------------------
ZSH_SRC="$HOME"
ZSH_DEST="$GLB_CONF_PATH/zsh"

mkdir "$ZSH_DEST"
cp "$ZSH_SRC/.zshrc" "$ZSH_DEST/.zshrc"

# COPY I3 CONFIG FILE ------------------------------
I3_SRC="$HOME/.config/i3"
I3_DEST="$GLB_CONF_PATH/i3"

mkdir "$I3_DEST"
cp "$I3_SRC/config" "$I3_DEST/config"

# COPY TMUX CONFIG FILE ----------------------------
TMUX_SRC="$HOME"
TMUX_DEST="$GLB_CONF_PATH/tmux"

mkdir "$TMUX_DEST"
cp "$TMUX_SRC/.tmux.conf" "$TMUX_DEST/.tmux.conf"

# COPY POLYBAR CONFIG FOLDER -----------------------
POLYBAR_SRC="$HOME/.config/polybar"
POLYBAR_DEST="$GLB_CONF_PATH"

mkdir "$POLYBAR_DEST"
cp -rf "$POLYBAR_SRC" "$POLYBAR_DEST"

# GIT ADD, COMMIT AND PUSH -------------------------
read -p "Git commit message: " gitmessage

if [ "$gitmessage" = "" ]; then
    printf "Please enter non-empty string"
else
    git add .
    git commit -m "$gitmessage"
    git push origin main

    printf "Pushed commit \""$gitmessage"\" to main successfully"
fi
