# osx brew crud
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

export PATH=/usr/local/bin:$PATH:~/bin
export PATH=$PATH:/usr/local/mysql/bin

export GOPATH=~/go
export PATH=$PATH:~/go/bin

export EDITOR=vim

__conda_setup="$(CONDA_REPORT_ERRORS=false $HOME/miniconda3/bin/conda shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
