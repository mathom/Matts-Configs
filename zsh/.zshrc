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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$($CONDA_INSTALL/bin/conda 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$CONDA_INSTALL/etc/profile.d/conda.sh" ]; then
        . "$CONDA_INSTALL/etc/profile.d/conda.sh"
    else
        export PATH="$CONDA_INSTALL/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

if [ -d "$CONDA_INSTALL/envs/$CONDA_ENV" ]; then
    conda activate py37
fi
