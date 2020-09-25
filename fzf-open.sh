#!/bin/bash

# defaults
OPENER="$HOME/.config/fzf-open/lopen.sh"
TERMINAL=urxvt
STARTING_DIR="/"

# source config
CONFIG_FILE=$HOME/.config/fzf-open/config
. $CONFIG_FILE

$TERMINAL --title "fzf-open-run" -e zsh -c 'cd $STARTING_DIR; fzf > /tmp/fzf-open'

if test -f "/tmp/fzf-open"; then
    FILE=$STARTING_DIR/$(cat /tmp/fzf-open)
    echo "$FILE"
    $OPENER "$FILE"
    rm /tmp/fzf-open
fi
