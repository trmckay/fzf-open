#!/bin/bash

##############################################################################
################################ CUSTOM OPENER ###############################
##############################################################################

TEXT_EDITOR="nvim_open"
PDF_VIEWER="zathura"
IMAGE_VIEWER="feh"
VIDEO_PLAYER="mpv"
SPREADSHEET_EDITOR="sc-im"
WEB_BROWSER="firefox"
TERMINAL="alacritty"

# open
function nvim_open() {
    export NVIM_FILE_TO_OPEN=$1
    $TERMINAL -e zsh -c 'clear; nvim $NVIM_FILE_TO_OPEN'
}

FILE=$1
EXTENSION=$(echo $FILE | sed 's/.*\.//')
MIME=$(xdg-mime query filetype $FILE)

case "$EXTENSION" in
    pdf)
        $PDF_VIEWER $FILE
        exit;;
    png|jpg|jpeg|PNG|JPG|JPEG)
        $IMAGE_VIEWER $FILE
        exit;;
    mov|mp4|mp3|mkv)
        $VIDEO_PLAYER $FILE
        exit;;
    csv|xlsv)
        $SPREADSHEET_EDITOR $FILE
        exit;;
    htm|html)
        $WEB_BROWSER $FILE
        exit;;
esac

case "$MIME" in
    image/*)
        $IMAGE_VIEWER $FILE
        exit;;
    text/*)
        $TEXT_EDITOR $FILE
        exit;;
    *)
        $FALLBACK_OPENER $FILE;;
esac
