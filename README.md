# hanbin_dev

Personal dev-environment config.

## Vim
```bash
git clone https://github.com/hanbin973/hanbin_dev.git ~/hanbin_dev
~/hanbin_dev/install.sh
```
Symlinks `vim/vimrc` to `~/.vimrc`, installs Vundle, and runs `:PluginInstall`
(airline + airline-themes). Edit `vim/vimrc` and commit to sync across machines.

## tmux
`install.sh` also adds `set -g default-terminal "tmux-256color"` to `~/.tmux.conf`
(falls back to `screen-256color` if that terminfo is missing). The line sits in a
marked block, so you can run the script again without getting duplicate lines.
Other settings in `~/.tmux.conf` are left as they are.
