HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

bindkey -v

zstyle :compinstall filename '/home/vagrant/.zshrc'

autoload -Uz compinit
compinit

alias work_haste='HASTE_SERVER=http://hastebin.britecorepro.com haste'
export PATH=$PATH:/opt/ruby/bin/

source ~/antigen.zsh

antigen-lib

antigen-bundle pip
antigen-bundle zsh-users/zsh-syntax-highlighting

antigen-theme mathom

antigen-apply
