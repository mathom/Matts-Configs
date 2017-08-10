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

setopt no_beep

function chpwd() {
    [[ -d .venv ]] && . .venv/bin/activate
}
export PATH=$PATH:~/.venv/bin

# if a home venv exists, turn it on
[[ -d ~/.venv ]] && . ~/.venv/bin/activate

unset LSCOLORS
[[ -a ~/.dircolors ]] && eval `dircolors ~/.dircolors`

export PATH=$PATH:/usr/local/mysql/bin
export GOPATH=~/go
export PATH=$PATH:~/go/bin

function awsprofile {
    export AWS_DEFAULT_PROFILE=$1
}

function awsclearshell {
    echo unset AWS_SESSION_TOKEN
    echo unset AWS_ACCESS_KEY_ID
    echo unset AWS_SECRET_ACCESS_KEY
}

function awsclear {
    eval $(awsclearshell)
}

function awsrole {
    aws sts get-caller-identity --profile $1 > /dev/null
    eval $(jq -r '.Credentials | "export AWS_ACCESS_KEY_ID="+.AccessKeyId, "export AWS_SECRET_ACCESS_KEY="+.SecretAccessKey, "export AWS_SESSION_TOKEN="+.SessionToken' < ~/.aws/cli/cache/$1--*.json)
}
