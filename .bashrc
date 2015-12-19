# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Normal Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White
# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White
# Background
bgBlack='\e[40m'       # Black
bgRed='\e[41m'         # Red
bgGreen='\e[42m'       # Green
bgYellow='\e[43m'      # Yellow
bgBlue='\e[44m'        # Blue
bgPurple='\e[45m'      # Purple
bgCyan='\e[46m'        # Cyan
bgWhite='\e[47m'       # White

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# Shopts
shopt -s cdspell
shopt -s cdable_vars
shopt -s checkhash
shopt -s checkwinsize
shopt -s sourcepath
shopt -s no_empty_cmd_completion
shopt -s cmdhist
shopt -s histappend histreedit histverify
shopt -s extglob       # Necessary for programmable completion.


# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes
[ -d ~/DamnText ] && [ -d /media/Eidetic/DamnTexts ] && cp -u ~/DamnText/*.xt /media/Eidetic/DamnTexts/

function _exit()              # Function to run upon exit of shell.
{
	echo -e "${BRed}I'll be waiting for you \n  my beloved... \n" & sleep 2
	[ -d ~/DamnText ] && [ -d /media/Eidetic/DamnTexts ] && cp -u ~/DamnText/*.xt /media/Eidetic/DamnTexts/
    }
    trap _exit EXIT

	color_prompt=yes
if [ $UID -eq "0" ] ; then 
PS1="$BCyan  \@$White *\j$Green  ..-=$White\w$Green=-...\n$Red \u✔ $BYellow-inside-$BPurple\h: #!$Cyan\n"
PS2="$White >..<"
 else
PS1="$BCyan  \@$White *\j$Green  ..-=\w=-...\n$Red \u✔ $BYellow-inside-$BPurple\h♥ #!$Cyan\n"

PS2="$White >..<"
fi

# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
 #   PS1='\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1'
 #   ;;
#*)
#    ;;
#esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

xt="~/xt.xt/" 
if [ -d ~/xt.xt/ ] ; then  PATH="$PATH:~/xt.xt/:" 
fi
#######*#######################*##############################
###*###############*###################Absolutely ############
###########*################*#########*################The####
######*#########################################Best##########
export EDITOR=vi                          ####*#########*#####
######*#####################################The###############
##########*#################*#########################Hell####
###*###############*#################*###With#################
######*#####*##################*#####################theRest##
alias su="sudo su"

#Envies will go here.. 



#Recently tempered -$1 days 
function tempered() { find . -mtime -$1 -printf "%Tx\t\t%p\n" | sort -rg ; }

function _exit()              #On exit 
{
	clear && printf "${BRed}I'll be waiting for you \n  \t\t my beloved... \n\t♥\n\n" & sleep 2
    }
    trap _exit EXIT

    
function title {
    if [[ $TERM == "screen"* ]]; then
	            print -nR $'\033k'$1$'\033\\'
		            print -nR $'\033]0;'$2$'\a'
			        fi
			}

			function precmd {
			    title "zsh" "$PWD"
		    }   

		    function preexec {
		        emulate -L zsh
			    local -a cmd; cmd=(${(z)1})
			        title "$cmd[1]:t" "$cmd[2,-1]"
			}

# Returns a color according to free disk space in $PWD.
function disk_color()
{
	if [ ! -w "${PWD}" ] ; then
		echo -en ${Red}
	elif [ -s "${PWD}" ] ; then
		local used=$(command df -P "$PWD" |
		awk 'END {print $5} {sub(/%/,"")}')
		if [ ${used} -gt 95 ]; then
			echo -en ${ALERT}           # Disk almost full (>95%).
		elif [ ${used} -gt 90 ]; then
			echo -en ${BRed}            # Free disk space almost gone.
		else
			echo -en ${Green}           # Free disk space is ok.
		fi
			echo -en ${Cyan}
			# Current directory is size '0' (like /proc, /sys etc).
		fi
		 }

if [ -f /usr/bin/zsh ] ; then zsh 
fi	
