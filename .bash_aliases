#
# # ex - archive extractor
# # usage: ex <file>
extract ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.tar.xz)    tar xJf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo ""$1" cannot be extracted via extract()" ;;
    esac
  else
    echo ""$1" is not a valid file"
  fi
}
### ALIASES ###
# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias myip="curl http://ipecho.net/plain; echo"
# Changing "ls" to "eza"
alias l='exa -a --color=always  --icons  --group-directories-first' # ls short
alias ls='exa -al --color=always --icons --group-directories-first' # my preferred listing
alias la='exa -a --color=always --icons --group-directories-first'  # all files and dirs
alias ll='exa --long --header  --icons'                        #long format
alias lt='exa -aT --color=always --icons --group-directories-first' # tree listing
alias l.='exa -al --color=always  --icons --group-directories-first ../' # ls on the PARENT directory
alias l..='exa -al --color=always --icons --group-directories-first ../../' # ls on directory 2 levels up
alias l...='exa -al --color=always --group-directories-first ../../../' # ls on directory 3 levels up
alias ldot="exa -ld .* --icons"
alias lS="ls -1FSsh"
alias lart="ls -1Fcart"
alias lrt="ls -1Fcrt"
alias s="sudo"
alias h="history"
alias t="tail -f"
alias v="vim"
alias c="clear"
alias dc="cd"
alias aupd="sudo nala update"
#alias aupdg="sudo apt update && sudo apt dist-upgrade -y"
alias aupdg="sudo nala update && sudo nala upgrade -y"
alias sv="sudo vim"
#alias grep="grep --color"

alias sgrep="grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} "
alias t="tail -f"

#alias tmux="tmux -2"
alias less="less -R"
alias dc="cd"
alias glog="git log --oneline --graph --color --all --decorate"
alias sn="sudo nano"
alias lsmount="mount | column -t"
alias ka="killall"
alias icat="kitty +kitten icat"
#alias grep="--color="auto"
alias mv="mv -iv"
alias rm="rm -iv"
alias mkd="mkdir -pv"
 # Computer Maintence
alias sdn="sudo shutdown now"
alias rbn="sudo reboot"
alias sysctl="sudo systemctl"
alias openports='netstat -nape --inet' # Show open ports
alias logs="sudo find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"  # Show all logs in /var/log
alias running_services="systemctl list-units  --type=service  --state=running"

 # yt-dlp
alias YT="youtube-viewer"
alias yt="yt-dlp --add-metadata -ic"  # Download video link
alias yta-aac="yt-dlp --extract-audio --audio-format aac "
alias yta-aac="yt-dlp --extract-audio --audio-format flac "
alias yta-best="--extract-audio --audio-format best "
alias yta="yt -x -f bestaudio/best"
alias ytt="yt --skip-download --write-thumbnail"
# Internal
alias ethspeed="speedometer -rx enx00e04c6806ca"
set showtabline=2
# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Git ALIASES
alias g='cd /home/sms/Documents/Github'
alias gst='git status'
alias gc='git commit'
alias ga='git add'
alias gpl='git pull'
alias gpom='git pull origin master'
alias gpu='git push'
alias gpuom='git push origin master'
alias gd='git diff'
alias gch='git checkout'
alias gnb='git checkout -b'
alias gac='git add . && git commit'
alias grs='git restore --staged .'
alias gre='git restore'
alias gr='git remote'
alias gcl='git clone'
alias glg="git log --graph --abbrev-commit --decorate --format=format:'%C(bold green)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold yellow)(%ar)%C(reset)%C(auto)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
alias gt='git ls-tree -r master --name-only'
alias grm='git remote'
alias gb='git branch'
alias gm='git merge'
alias gf='git fetch'

# Bare Repository
alias cst="config status"
alias cad="config add"
alias ccm="config commit -m"
alias cpu="config push"
