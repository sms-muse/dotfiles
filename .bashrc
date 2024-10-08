#VIMINIT="source ~/.config/vim/vimrc"

shopt -s checkwinsize
complete -C z  z  #To activate bash completion
set -o vi
# Correct small spelling errors
shopt -s cdspell
shopt -s autocd # Allows you to cd into directory merely by typing the name
# append to the history file, don't overwrite it
shopt -s histappend

# Ctl+p copy/paste option
#vnoremap <C-c> "+y
#map <C-P> "+p
#
#export PAGER='most'

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac
export PATH=/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:/home/sms/bin:/home/sms/.scripts/:/home/sms/.screenlayout/

#don't put duplicate lines or lines starting with space in the history.

# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTCONTROL=erasedups:ignoreboth
HISTSIZE=1000000
HISTFILESIZE=1000000
HISTIGNORE="&:ls:[bf]g:history:exit"  #ignore these commands from history

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
# Case insensitive auto-completion
bind "set completion-ignore-case"

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# Set 'man' colors
if [ "$color_prompt" = yes ]; then
	man() {
	env \
	LESS_TERMCAP_mb=$'\e[01;31m' \
	LESS_TERMCAP_md=$'\e[01;31m' \
	LESS_TERMCAP_me=$'\e[0m' \
	LESS_TERMCAP_se=$'\e[0m' \
	LESS_TERMCAP_so=$'\e[01;44;33m' \
	LESS_TERMCAP_ue=$'\e[0m' \
	LESS_TERMCAP_us=$'\e[01;32m' \
	man "$@"
	}
fi

unset color_prompt force_color_prompt

# For git bare repository
alias config='/usr/bin/git --git-dir=$HOME/dotfiles.git/ --work-tree=$HOME'

# PS1 Prompt
export PS1="\[\e[33m\][\[\e[m\]\[\e[31m\]\u\[\e[m\]@\[\e[36m\]\h\[\e[m\]:\[\e[35m\]\w\[\e[m\]\[\e[33m\]]\[\e[m\] (\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)) \$ "

## enable color support of ls and also add handy aliases
#if [ -x /usr/bin/dircolors ]; then
#    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#    alias ls='ls --color=auto'
#    alias dir='dir --color=auto'
#    alias vdir='vdir --color=auto'
#
#    alias grep='grep --color=auto'
#    alias fgrep='fgrep --color=auto'
#    alias egrep='egrep --color=auto'
#fi
#
# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'
#alias em='emacs -nw'

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

