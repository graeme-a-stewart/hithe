#! /bin/bash

# First OS independent stuff
alias a=alias
alias e=emacs
alias h='history | tail -20'
alias hs='history | grep $*'
alias j=jobs
alias m=less
alias u=unalias
alias which="type -path"
alias x="startx --auth $HOME/.Xauthority"

# Sizes beneath cwd
alias ddu='du -s $(find . -maxdepth 1 -type d)'
alias ddua='ddu | sort -k 2'
alias ddus='ddu | sort -n -r -k 1'

# Pretty print with enscript
alias pp='enscript -2Gr'
alias pp1='enscript -G'

alias p='ps ux'
alias pa='ps aux'
alias v="ls -l"

# Avoid using the dynamic DNS name for the laptop - hardcode
MNAME=sapphire

# Ensure command prompt is my favourite
PS1="$MNAME:\W\\$ "

if [ $TERM = "xterm" -o $TERM = "xterm-256color" ]; then
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@$MNAME: ${PWD}\007"'
    export PROMPT_COMMAND
fi

# OS X Useful bits
alias ae='open -a Aquamacs'
alias vsc='open -a "Visual Studio Code"'
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'

# SSH Shortcuts
alias pa='ssh graeme@login.physics.gla.ac.uk'
alias ppelx='ssh graeme@ppelx.physics.gla.ac.uk'
alias ppe165='ssh graeme@ppepc165.physics.gla.ac.uk'
alias csf='ssh graeme@csf.rl.ac.uk'
alias rcm='ssh pcmpp001.cern.ch' #Rolf's machine
alias gsg='ssh glasvr02.cern.ch'
alias gsr='ssh -o "PubkeyAuthentication yes" root@glasvr02.cern.ch'
alias gcalib='ssh alibrari@lxplus.cern.ch'
alias mic='ssh atmic001.cern.ch'
alias lcgp1='ssh lcgapp-centos7-physical1.cern.ch'
alias lcgp2='ssh lcgapp-centos7-physical2.cern.ch'

alias sshafs='sshfs lxplus.cern.ch:/afs/cern.ch/ /afs/cern.ch'

# Tunneling to see CI Jenkins machine
alias citunnel='ssh -N -L localhost:8080:aibuild080.cern.ch:8080 graemes@lxplus.cern.ch'

# Code search
alias tsearch='find $(ls -d ./*/trunk) -name \*.py | xargs grep "$@"'

# I still love it, after all these years...
export NETHACKOPTIONS=female,showexp,name:Kataleena,catname:Bob,dogname:Daft

# Link into this directory
function dlink () {
    while [ -n "$1" ]; do
	if [ -d $1 ]; then
	    for f in $(ls $1); do
		ln -s $1/$f $f
	    done
	fi
	shift
    done
}

# Go to specific cern.ch node
# Interpret numeric NNN hostname as lxplusNNN
function gc () {
    if [ -z "$1" ]; then
	ssh lxplus7.cern.ch
    elif echo -n $1 | egrep '^[0-9]+$' > /dev/null; then
	ssh lxplus${1}.cern.ch
    else
	ssh $1.cern.ch
    fi
}


# Get ROOT working
#if [ brew --prefix root6 &> /dev/null ]; then
#    . $(brew --prefix root6)/libexec/thisroot.sh
#fi

# Docker
alias docker-fix-date="docker run --rm --privileged ubuntu date -s \"\$(date)\""

# Ruby
export GEM_HOME=~/.gem
export GEM_PATH=$GEM_HOME
