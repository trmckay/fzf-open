#!/bin/bash

install -Dm 755 fzf-open/fzf-open /usr/bin/fzf-open
install -d /usr/share/fzf-open/
install -Dm 755 fzf-open/lopen.sh /usr/share/fzf-open
install -Dm 644 fzf-open/fzf-open.py /usr/share/fzf-open
install -Dm 666 extra/config /usr/share/fzf-open/example_config
