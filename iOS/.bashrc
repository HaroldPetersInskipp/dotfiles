# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

alias ..='cd .. ' # lazy
alias ...='cd ../.. ' # very lazy
alias ....='cd ../../.. ' # plus ultra lazy
alias bashrc="nano ~/.bashrc " # edit bashrc
alias c='clear ' # shorter clear
alias cd..='cd .. ' # fix typo
alias cdnr='cd /var/mobile/Containers/Data/Application/A31D71F3-2B92-487F-8B7E-2CF011DF247F/Documents/apps/node-red/.node-red ' # change active directory to the node-red directory
alias count='grep -ci' # displays the number of occurrences of keyword in a file
alias cp="cp -i " # copy file interactively
alias df='df -h ' # human readable disk space usage
alias down='cd /var/mobile/Downloads ' # change active directory to the Downloads directory
alias sdown='cd "/var/mobile/Containers/Shared/AppGroup/F16CF9A6-64F0-4ED1-98AC-0E65C7DB7436/File Provider Storage/Downloads" ' # change active directory to the Safari Downloads directory
alias edit='nano ' # edit files
alias exe='chmod +x ' # make executable
alias getip="curl icanhazip.com" # get current external IP
alias grep='grep -iI --color=auto ' # pretty grep
alias h='history' # shorter history
alias hc='history |  cut -c24- | sort  | uniq -c | sort -nr | head -n 100 ' # get common commands from history
alias highlight='_highlight() { less -JMINsp$@ ;}; _highlight' # highlight all occurrences of a keyword in a file
alias hl='_hl() { less -JMINsp$@ ;}; _hl' # shorter highlight
alias hs='history | grep ' # search command history
alias ht='htop' # shorter htop
alias jobs='jobs -l ' # list jobs
alias ln='ln -i ' # link file interactively
alias ls='ls -aFhv --color=auto --group-directories-first ' # better ls output
alias "node-red"='node /var/mobile/Containers/Data/Application/A31D71F3-2B92-487F-8B7E-2CF011DF247F/Documents/apps/node-red/.node-red/node_modules/node-red/red.js ' # start node-red server
alias mcd='_mcd() { mkdir -p "$1" && cd "$1" ;}; _mcd' # make a directory and cd to it
alias mkdir='mkdir -pv ' # make directory and parent directories, verbose
alias mv="mv -i " # move file interactively
alias path='echo $PATH | tr -s ":" "\n" ' # pretty print the path
alias ping='ping -c 5 ' # ping only 5 times then stop
alias ports='lsof -i -P -n | grep LISTEN ' # list ports in use
alias reload="source ~/.bashrc" # reload .bashrc
alias rn='mv ' # rename/move a file shorter
alias rename='mv ' # rename/move a file
alias rm='rm -r -I' # remove file interactively
alias tarup='tar czvf ' # pack a .tar file
alias untar='tar -zxvf ' # unpack a .tar file
alias wget="wget -c " # continue, resume getting a partially-downloaded file
alias yolo='rm -rf node_modules/ && rm package-lock.json && npm install' # reinstall a project’s dependencies
alias zshrc="nano ~/.zshrc" # edit zshrc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

PATH=/usr/bin/node:$PATH