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

alias p='ps ux'
alias pa='ps aux'
alias v="ls -l"

# Command prompt
PS1="\h [\u]:\W\\$ "

# ATLAS Setttings
export AtlasSetup=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase/x86_64/AtlasSetup/current/AtlasSetup
alias asetup='source $AtlasSetup/scripts/asetup.sh $*'

# This should allow DB access from anywhere...
export FRONTIER_SERVER="(serverurl=http://atlasfrontier-ai.cern.ch:8000/atlr)(serverurl=http://lcgft-atlas.gridpp.rl.ac.uk:3128/frontierATLAS)(serverurl=http://frontier-atlas.lcg.triumf.ca:3128/ATLAS_frontier)(serverurl=http://ccfrontier.in2p3.fr:23128/ccin2p3-AtlasFrontier)"
