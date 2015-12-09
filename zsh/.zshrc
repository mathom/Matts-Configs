HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# osx brew crud
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

bindkey -e
bindkey '^F' history-incremental-pattern-search-forward

autoload -Uz compinit
compinit
setopt COMPLETE_IN_WORD

export PATH=/usr/local/bin:$PATH:~/bin
export EDITOR=vim

source ~/.antigen.zsh

antigen-use oh-my-zsh

antigen-bundle zsh-users/zsh-syntax-highlighting

antigen-theme mathom/Matts-Configs themes/dpoggi-short

antigen-apply

function chpwd() {
    [[ -d .venv ]] && . .venv/bin/activate
}
export PATH=$PATH:~/.venv/bin

# if a home venv exists, turn it on
[[ -d ~/.venv ]] && . ~/.venv/bin/activate

unset LSCOLORS
[[ -a ~/.dircolors ]] && eval `dircolors ~/.dircolors`

export PATH=$PATH:/usr/local/mysql/bin
