#!/bin/sh

if [ -f ~/.gitconfig ]; then
    name="`git config --global user.name`"
    email="`git config --global user.email`"
    rm ~/.gitconfig
fi

stow -t ~ --override=".*" tmux git vim zsh dircolors emacs

if [ -z "$name" ]; then
    git config --global --replace-all user.name "$name"
    git config --global --replace-all user.email "$email"
fi
