# Installation
First, make sure you clone this repository like so:
```
git clone --recursive git@github.com:mathom/Matts-Configs.git
```
If you already have a copy, just update the submodules recursively:
```
git submodule update --init --recursive
```
This ensures that the vim submodule's submodules are downloaded.

After cloning, you can easily make symlinks with [GNU Stow](http://www.gnu.org/software/stow/).
```
cd Matts-Configs
stow tmux git vim zsh
```

# Themes
This repo contains a few themes for zsh. To use them, make sure you
have [antigen](https://github.com/zsh-users/antigen) loaded.
Then, simply add my themes:
```
antigen-theme mathom/Matts-Configs themes/dpoggi-short
```
See the themes folder for more.
