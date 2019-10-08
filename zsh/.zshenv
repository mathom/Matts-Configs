DEFAULT_CONDA_ENV=py37
MINICONDA_INSTALL=~/miniconda3

if [ -d $MINICONDA_INSTALL/bin ]; then
    export PATH=$MINICONDA_INSTALL/bin:$PATH
    if [ -d $MINICONDA_INSTALL/envs/$DEFAULT_CONDA_ENV ]; then
        source activate $DEFAULT_CONDA_ENV
    fi
fi

export ZSH="~/.omz.git"

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="fishy"

COMPLETION_WAITING_DOTS="true"

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# osx brew crud
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

export PATH=~/bin:/usr/local/bin:$PATH
export EDITOR=vim

export PATH=$PATH:/usr/local/mysql/bin
export GOPATH=~/go
export PATH=$PATH:~/go/bin

PATH="/Users/mathom/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/mathom/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/mathom/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/mathom/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/mathom/perl5"; export PERL_MM_OPT;

export NVM_DIR="$HOME/.nvm"

