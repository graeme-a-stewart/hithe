# Add missing pieces tp PATH
PATH=~/bin:$HOME/.gem/bin:/usr/local/bin:$PATH:/sbin:/usr/sbin:/usr/local/sbin

# Editor
EDITOR=emacs
VISUAL=emacs
export EDITOR VISUAL

# Now read from .bashrc, if it exists
if [ -r ~/.bashrc ];
    then source ~/.bashrc;
fi

export BLOCKSIZE=1k

# Long history...
SAVEHIST=5000
HISTSIZE=6000
export SAVEHIST HISTSIZE

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/graemestewart/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/graemestewart/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/graemestewart/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/graemestewart/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="$HOME/.cargo/bin:$PATH"
