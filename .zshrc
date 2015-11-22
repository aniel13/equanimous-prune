# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam2

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

#############################################
###Under Default
#
#if [ -f ~/.bash_history ] ; then
# 	cp -u ~/.bash_history ~/.zsh_history
#fi

[ -d ~/.oh-my-zsh ] && printf '!\n' ZSH="/home/aniel/.oh-my-zsh/" && ZSH_THEME="muse" || printf "zsh would be nicer with oh-my-zsh\n"
[ ~/.bash_aliases ] &&  . ~/.bash_aliases
#?Update when I feel like it, thank you.
DISABLE_AUTO_UPDATE="true" 
# claims to display red dots while at completion.
#COMPLETION_WAITING_DOTS="true"
#-----------------------------------
#Plugins will go here.. 
plugins=(git)


#Recently tempered -$1 days 
function tempered() { find . -mtime -$1 -printf "%Tx\t\t%p\n" | sort -rg ; }

 #On exit 
 _exit() {
	echo "I'll be waiting for you \n \t\t my beloved... " 
    }
    trap _exit EXIT


#dots while tabbing 
expand-or-complete-with-dots() {
	  echo -n "\e[31m......\e[0m"
	    zle expand-or-complete
	      zle redisplay
      }
      zle -N expand-or-complete-with-dots
      bindkey "^I" expand-or-complete-with-dots
#
#Speaking title ya stolen spread    
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
#
 
