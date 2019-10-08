bindkey -e
bindkey '^F' history-incremental-pattern-search-forward

autoload -Uz compinit
compinit
setopt COMPLETE_IN_WORD

plugins=(
    ansible
    aws
    docker
    encode64
    git
    osx
)

if [ ! -d $ZSH ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git $ZSH
fi

source $ZSH/oh-my-zsh.sh

test -e ~/.bash_sft_complete && source ~/.bash_sft_complete

