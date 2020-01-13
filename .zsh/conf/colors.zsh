#---[ Color settings ]--------------------------------------------------

# colors
export black='\e[0;30m'
export blue='\e[0;34m'
export green='\e[0;32m'
export cyan='\e[0;36m'
export red='\e[0;31m'
export purple='\e[0;35m'
export brown='\e[0;33m'
export lightgray='\e[0;37m'
export darkgray='\e[1;30m'
export lightblue='\e[1;34m'
export lightgreen='\e[1;32m'
export lightcyan='\e[1;36m'
export lightred='\e[1;31m'
export lightpurple='\e[1;35m'
export yellow='\e[1;33m'
export white='\e[1;37m'
export nc='\e[0m'

# colors for less pager (man pages)
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  eval "$(dircolors -b)"
fi
