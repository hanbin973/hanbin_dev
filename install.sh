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
