# Installation
First, make sure you clone this repository like so:
```
git clone git@github.com:mathom/Matts-Configs.git
```

After cloning, you can easily make symlinks with [GNU Stow](http://www.gnu.org/software/stow/).
```
cd Matts-Configs

# install general packages (cross platform)
stow -t ~ tmux git vim zsh dircolors emacs
# install my bin scripts
stow -t ~/bin bin

# install linux desktop stuff
stow -t ~ kde
```
