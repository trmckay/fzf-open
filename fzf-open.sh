#!/bin/bash

OPENER="$HOME/development/fzf-open/open.sh"
TERMINAL="alacritty"
STARTING_DIR="$HOME"

$TERMINAL --title "fzf-open" --command zsh -c 'cd $STARTING_DIR; fzf > /tmp/fzf-open'

if test -f "/tmp/fzf-open"; then
    FILE=$STARTING_DIR/$(cat /tmp/fzf-open)
    echo $FILE
    $OPENER $FILE
fi
