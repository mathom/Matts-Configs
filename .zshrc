HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

bindkey -v

zstyle :compinstall filename '/home/vagrant/.zshrc'

autoload -Uz compinit
compinit

export PATH=$PATH:/opt/ruby/bin/
export EDITOR=vim

alias work_haste='HASTE_SERVER=http://hastebin.britecorepro.com haste'

source ~/antigen.zsh

antigen-lib

antigen-bundle pip
antigen-bundle zsh-users/zsh-syntax-highlighting

antigen-theme mathom/Matts-Configs themes/mathom

antigen-apply

function chpwd() {
    if [ -d .venv ]; then
        . .venv/bin/activate
    fi
}
