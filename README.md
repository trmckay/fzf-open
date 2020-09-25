# fzf-open
Use fzf to open files in appropriate applications (a la macOS Spotlight)

## Features ##
- Customizable: supports configuration of terminals and openers
- Designed to be launched easily from a hotkey
- Comes with a simple opener: no `xdg-open` required
- Fast: uses the fantastic [fzf](https://github.com/junegunn/fzf)

![demonstration of fzf-open](extra/demo.gif)

## Installation ##

### Arch based ###

For Arch based distros, `fzf-open` is [on the AUR](https://aur.archlinux.org/packages/fzf-open/).

```
yay -S fzf-open
```

### Other distros ###

**Requirements**:
- bash
- fzf

For other distros, installation is still simple:

```
git clone https://github.com/trmckay/fzf-open.git
cd fzf-open
sudo ./install.sh
cd ..
rm -rf fzf-open
```
Don't forget to configure! Make sure to change the default 

## Configuration ##

Install and run `fzf-open` at least once for it to create config files.
Configuration is located at `$HOME/.config/fzf-open/config`.
An example configuration file is also included in `/usr/share/fzf-open/example_config`.

**Configuration keys**:

| KEY | DEFUALT VALUE |
| --- | --- |
| `OPENER` | `$HOME/.config/lopen.sh` |
| `TERMINAL` | `urxvt` |
| `STARTING_DIR` | `$HOME` |

If you choose to keep, `lopen.sh` as the opener. You should customize it at `$HOME/.config/fzf-open/lopen.sh`, especially if the following
default applications do not look sane:

| FILETYPE | APPLICATION |
| --- | --- |
| Images | `feh` |
| Videos | `mpv` |
| Text | `vim` |
| PDF | `zathura` |
| Web | `firefox` |
| Terminal | `urxvt` |

## Planned features ##
- Scriptability so it can be used as a fuzzy opener anywhere
- Flag to _not_ create a new host terminal when running
- Flags to override other configuration keys
