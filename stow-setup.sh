#!/bin/sh

if [ -f ~/.gitconfig ]; then
    name="`git-config user.name`"
    email="`git-config user.email`"
    rm ~/.gitconfig
fi

stow -t ~ --override=".*" tmux git vim zsh dircolors emacs vimrc_custom
