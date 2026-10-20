#!/usr/bin/env bash
# Link vim/vimrc to ~/.vimrc, install Vundle, then install plugins.
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"

if [ -e ~/.vimrc ] && [ ! -L ~/.vimrc ]; then
  mv ~/.vimrc ~/.vimrc.bak.$(date +%Y%m%d%H%M%S)
fi
ln -sfn "$here/vim/vimrc" ~/.vimrc

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qall

# Make tmux use a 256-color terminal (prefer tmux-256color if terminfo has it).
# Appended between markers so re-running replaces the block instead of duplicating it.
if infocmp tmux-256color >/dev/null 2>&1; then term=tmux-256color; else term=screen-256color; fi
touch ~/.tmux.conf
sed -i '/^# >>> hanbin_dev 256color >>>$/,/^# <<< hanbin_dev 256color <<<$/d' ~/.tmux.conf
cat >> ~/.tmux.conf <<EOF
# >>> hanbin_dev 256color >>>
set -g default-terminal "$term"
# <<< hanbin_dev 256color <<<
EOF
if tmux info >/dev/null 2>&1; then tmux source-file ~/.tmux.conf; fi
