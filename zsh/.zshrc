bindkey -e
bindkey '^F' history-incremental-pattern-search-forward

autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit
setopt COMPLETE_IN_WORD

plugins=(
    ansible
    aws
    docker
    encode64
    git
    macos
)

if [ ! -d $ZSH ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git $ZSH
fi

source $ZSH/oh-my-zsh.sh

test -e ~/.bash_sft_complete && source ~/.bash_sft_complete

if [ -f /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    export PATH=/opt/homebrew/bin:$PATH
fi

if command -v pyenv 2>&1 >/dev/null; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

