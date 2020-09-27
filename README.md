# fzf-open
Use fzf to open files in appropriate applications (a la macOS Spotlight)

## Features ##
- Customizable: supports configuration of terminals and openers
- Designed to be launched easily from a hotkey
- Comes with a simple opener: `xdg-open` **not** required
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
- python
- fzf

For other distros, installation is still simple:

```
git clone https://github.com/trmckay/fzf-open.git
cd fzf-open
sudo ./install.sh
cd ..
rm -rf fzf-open
```
Don't forget to configure!

## Configuration ##

Install and run `fzf-open` at least once for it to create config files.
Configuration is located at `$HOME/.config/fzf-open/config`.
An example configuration file is also included in `/usr/share/fzf-open/example_config`.

**Configuration keys** (absolute paths only, no environment variables):

| KEY | DEFUALT VALUE |
| --- | --- |
| `OPENER` | `~/.config/lopen.sh` |
| `TERMINAL` | `xterm` |
| `STARTING_DIR` | `~/` |
| `WIN_TITLE` | `fzf-open-run` |
| `WIN_TITLE_FLAG` | `--title` |
| `SPAWN_TERM` | `False` |

Most of these can be overwitten by flags:

| FLAG | EFFECT |
| --- | --- |
| `-n` | Spawn a new terminal with `fzf-open` |
| `-o "opener"` | Use this as the opener |
| `-d "dir"` | Start in this directory |
| `-t` "term" | Use this terminal program |

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
