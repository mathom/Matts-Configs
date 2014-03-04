HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

bindkey -e
bindkey '^F' history-incremental-pattern-search-forward

autoload -Uz compinit
compinit
setopt COMPLETE_IN_WORD

export PATH=/usr/local/bin:$PATH
export EDITOR=vim

source ~/.antigen.zsh

antigen-use oh-my-zsh

antigen-bundle zsh-users/zsh-syntax-highlighting

antigen-theme mathom/Matts-Configs themes/dpoggi-short

antigen-apply

function chpwd() {
    if [ -d .venv ]; then
        . .venv/bin/activate
    fi
}
