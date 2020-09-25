#!/bin/bash

sudo cp ./fzf-open.sh /usr/bin/fzf-open
mkdir -p $HOME/.config/fzf-open
cp lopen.sh $HOME/.config/fzf-open/lopen.sh
cp example_config $HOME/.config/fzf-open/config
