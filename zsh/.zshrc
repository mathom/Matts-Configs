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

function awsclear {
    #unset AWS_DEFAULT_PROFILE
    unset AWS_ACCESS_KEY_ID
    unset AWS_SECRET_ACCCESS_KEY
}

function awsrole {
    awsclear
    eval $(aws sts assume-role --role-arn `aws configure get --profile $1 role_arn` --role-session-name console --query 'Credentials.[AccessKeyId,SecretAccessKey,SessionToken]' --output text | xargs printf "export AWS_ACCESS_KEY_ID='%s'; export AWS_SECRET_ACCESS_KEY='%s'; export AWS_SESSION_TOKEN='%s'")
}
