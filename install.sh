#!/bin/bash

install -Dm 755 fzf-open/fzf-open.sh /usr/bin/fzf-open
install -d /usr/share/fzf-open/
install -Dm 755 fzf-open/lopen.sh /usr/share/fzf-open
install -Dm 644 extra/config /usr/share/fzf-open/example_config
