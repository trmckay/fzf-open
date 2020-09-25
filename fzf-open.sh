#!/bin/bash

# defaults
LOPEN="$HOME/.config/fzf-open/lopen.sh"
OPENER="$LOPEN"
TERMINAL=urxvt
STARTING_DIR="$HOME"

CONFIG_FILE=$HOME/.config/fzf-open/config
if [ -f $CONFIG_FILE ]; then
    . $CONFIG_FILE
else
    mkdir -p $HOME/.config/fzf-open
    cp /usr/share/fzf-open/example_config $HOME/.config/example_config
fi

if [ ! -f $LOPEN ]; then
    cp /usr/share/fzf-open/lopen.sh $LOPEN
fi

$TERMINAL --title "fzf-open-run" -e bash -c 'cd $STARTING_DIR; fzf > /tmp/fzf-open; echo $# >> /tmp/fzf-open'

if test -f "/tmp/fzf-open"; then
    FILE=$STARTING_DIR/$(cat /tmp/fzf-open | head -1)
    ERROR=$(cat /tmp/fzf-open | tail -1)
    if [ "$ERROR" == "0" ]; then
        echo "$FILE"
        $OPENER "$FILE"
    fi
    rm /tmp/fzf-open
fi
