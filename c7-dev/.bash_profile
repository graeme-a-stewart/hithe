# Editor
EDITOR=emacs
VISUAL=emacs
export EDITOR VISUAL

# Now read from .bashrc, if it exists
if [ -r ~/.bashrc ];
    then source ~/.bashrc;
fi
