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
HISTSIZE=10000
HISTFILESIZE=10000
export HISTTIMEFORMAT='%d/%m/%y %H:%M '
PROMPT_COMMAND='history -a'

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

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
    xterm-color|*-256color) color_prompt=yes;;
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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \$\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    #alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    #alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

alias ..='cd .. ' # lazy
alias ...='cd ../.. ' # very lazy
alias ....='cd ../../.. ' # plus ultra lazy
alias 777='chmod -R 777 ' # set permissions to 777
alias audio='cvlc --no-video -q ' # play audio only
alias bashrc="nano ~/.bashrc " # edit bashrc
#alias bat='bat --theme="Visual Studio Dark+" ' # pretty bat
#alias brootpi='br -d -s --show-root-fs -T ' # navigate filesystem
alias c='clear ' # shorter clear
#alias cat='bat --theme="Visual Studio Dark+" ' # pretty cat
#alias cato='bat -P --theme="Visual Studio Dark+" ' # pretty cat -o
alias cd..='cd .. ' # fix typo
#alias child='tldr ' # see man and woman
#alias close='_close() { echo $RANDOM | tee ~/Downloads/ColdStorage/close.txt ;}; _close ' # close last opened
alias count='grep -ci' # displays the number of occurrences of keyword in a file
alias cp="cp -i " # copy file interactively
#alias derp='tldr $(fc -ln -1)' # when you forget a command
alias df='df -h --total ' # human readable disk space usage
#alias docker='sudo docker ' # auto-prefix docker commands with sudo
alias down='cd ~/Downloads ' # change active directory to the Downloads directory
alias edit='nano ' # edit files
#alias eg='eg --pager-cmd "less -sR" ' # get examples for how a command is used
#alias exa='exa -al -F -h --group-directories-first --color-scale ' # like ls but better
alias exe='chmod +x ' # make executable
#alias fh='cd ~ && audio FH.mp3' # plays an audio file
#alias garden='cd ~ && audio BG.mp3' # plays an audio file
alias getip="curl icanhazip.com" # get current external IP
alias grep='grep -iI -P --exclude-dir=".git" --color=auto ' # pretty grep
alias h='history' # shorter history
alias hc='history |  cut -c24- | sort  | uniq -c | sort -nr | head -n 100 ' # get common commands from history
#alias hdi='function hdi(){ howdoi $* -a -c -n 3 ;}; hdi' # shorter howdoi
alias highlight='_highlight() { less -JMINsp$@ ;}; _highlight' # highlight all occurrences of a keyword in a file
alias hl='_hl() { less -JMINsp$@ ;}; _hl' # shorter highlight
#alias how='function hdi(){ howdoi $* -a -c -n 3 ;}; hdi' # shorter howdoi alt
#alias howdoi='function hdi(){ howdoi $* -a -c -n 3 ;}; hdi' # when idk how to do things
alias hs='history | grep ' # search command history
alias ht='htop' # shorter htop
alias jobs='jobs -l ' # list jobs
alias ln='ln -i ' # link file interactively
alias ls='ls -aFhv --color=auto --group-directories-first ' # better ls output
#alias lsa='exa -al -F -h --group-directories-first --color-scale ' # like ls but better alt
alias mcd='_mcd() { mkdir -p "$1" && cd "$1" ;}; _mcd' # make a directory and cd to it
alias mkdir='mkdir -pv ' # make directory and parent directories, verbose
alias mp3='cvlc --no-video -q *.mp3 ' # play mp3 audio with vlc
alias mv="mv -i " # move file interactively
alias nrr='sudo systemctl restart nodered.service' # restart the nodered service
#alias open='_open() { echo $PWD/"$@" | tee ~/Downloads/ColdStorage/filename.txt ;}; _open ' # echos a filepath
alias os='cat /etc/os-release' # get os information
alias path='echo $PATH | tr -s ":" "\n" ' # pretty print the path
alias ping='ping -c 5 ' # ping only 5 times then stop
alias please='sudo $(fc -ln -1)' # rerun last command with sudo, good manners
alias pls='sudo $(fc -ln -1)' # shorter please
alias plz='sudo $(fc -ln -1)' # shorter please alt
alias ports='sudo lsof -i -P -n | grep LISTEN ' # list ports in use
alias poweroff='sudo shutdown -h now' # turn off device
#alias python='/usr/bin/python3.7'
alias reboot='sudo reboot' # reboot
#alias refresh="exec zsh" # reload .zshrc properly
#alias reload="exec zsh" # reload .zshrc properly alt
alias rn='mv ' # rename/move a file shorter
alias rename='mv ' # rename/move a file
alias rm='rm -r -I' # remove file interactively
#alias rtsp='cd /home/pi/Downloads/Temp && RTSP_RTSPADDRESS=10.0.0.111:8554 ./rtsp-simple-server' # start rtsp server
alias ssdisable='sudo systemctl disable ' # disable a service with systemctl
alias ssenable='sudo systemctl enable ' # enable a service with systemctl
alias ssreload='sudo systemctl daemon-reload' # reload systemd manager configuration
alias ssrestart='sudo systemctl restart ' # restart a service with systemctl
alias ssstart='sudo systemctl start ' # start a service with systemctl
alias ssstop='sudo systemctl stop ' # stop a service with systemctl
alias sruby='_sruby() { ruby "$@" 2>/dev/null ;}; _sruby ' # suppress warnings from a ruby program
alias tarup='tar czvf ' # pack a .tar file
alias twig='_twig() { "$@" | tee ~/temp/twig.log ;}; _twig ' # log stdout of a command to file
alias untar='tar -zxvf ' # unpack a .tar file
alias update="sudo apt-get update && sudo apt-get upgrade" # shorter update
alias vlca='cvlc --no-video -q ' # play audio only
#alias webcam='sudo ffmpeg -f v4l2 -framerate 30 -video_size 640x480 -i /dev/video0 -f rtsp -rtsp_transport tcp rtsp://myuser:mypass@10.0.0.114:8554/livestream' # pipe webcam into rtsp server
#alias webcam='sudo ffmpeg -f v4l2 -pix_fmt yuyv422 -framerate 10 -video_size 1280x720 -i /dev/video0 -b:v 1M -f rtsp -rtsp_transport tcp rtsp://myuser:mypass@10.0.0.114:8554/livestream' # start rtsp stream from webcam
alias wget="wget -c " # continue, resume getting a partially-downloaded file
#alias woman='eg ' # like man
alias yolo='rm -rf node_modules/ && rm package-lock.json && npm install' # reinstall a project’s dependencies
alias yta='_yta() { yt-dlp -f "ba" -x --audio-format mp3 "$1" -o "%(id)s.%(ext)s" ;}; _yta' # download audio only
alias ytdl="yt-dlp " # easier to remember command to download a video from YouTube
alias zshrc="nano ~/.zshrc" # edit zshrc

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
