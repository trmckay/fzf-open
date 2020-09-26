#!/bin/bash

##############################################################################
################################ CUSTOM OPENER ###############################
##############################################################################

FALLBACK_OPENER=xdg-open

TEXT_EDITOR=vim_open
PDF_VIEWER=zathura
IMAGE_VIEWER=feh
VIDEO_PLAYER=mpv
SPREADSHEET_EDITOR=sc-im
WEB_BROWSER=firefox
TERMINAL=urxvt

# open
function vim_open() {
    export VIM_FILE_TO_OPEN=$1
    $TERMINAL -e bash -c 'nvim $VIM_FILE_TO_OPEN'
}

EXTENSION=$(echo "$1" | sed 's/.*\.//')
MIME=$(xdg-mime query filetype "$1")

case "$EXTENSION" in
    pdf)
        $PDF_VIEWER "$1"
        exit;;
    png|jpg|jpeg|PNG|JPG|JPEG)
        $IMAGE_VIEWER "$1"
        exit;;
    flv|avi|mov|mp4|mp3|mkv)
        $VIDEO_PLAYER "$1"
        exit;;
    csv|xlsv)
        $SPREADSHEET_EDITOR "$1"
        exit;;
    htm|html)
        $WEB_BROWSER "$1"
        exit;;
esac

case "$MIME" in
    image/*)
        $IMAGE_VIEWER "$1"
        exit;;
    text/*)
        $TEXT_EDITOR "$1"
        exit;;
esac

echo "Falling back to $FALLBACK_OPENER"
$FALLBACK_OPENER "$1"
