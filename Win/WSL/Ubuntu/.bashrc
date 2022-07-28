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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
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
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# aliases
alias ..='cd .. ' # lazy
alias ...='cd ../.. ' # very lazy
alias ....='cd ../../.. ' # plus ultra lazy
alias 777='chmod -R 777 ' # set permissions to 777
alias audio='cvlc --no-video -q ' # play audio only
alias bashrc="nano ~/.bashrc " # edit bashrc
alias brootpi='br -d -s --show-root-fs -T ' # navigate filesystem
alias c='clear ' # shorter clear
alias cat='bat --theme="Visual Studio Dark+" ' # pretty cat
alias cd..='cd .. ' # fix typo
alias child='tldr ' # see man and woman
# alias close='_close() { echo $RANDOM | tee /home/pi/Downloads/ColdStorage/close.txt ;}; _close ' # close last opened
alias count='grep -ci' # displays the number of occurrences of keyword in a file
alias cp="cp -i " # copy file interactively
alias derp='tldr $(fc -ln -1)' # when you forget a command
alias df='df -h --total ' # human readable disk space usage
alias edit='nano ' # edit files
alias eg='eg --pager-cmd "less -sR" ' # get examples for how a command is used
# alias exa='exa -al -F -h --group-directories-first --color-scale ' # like ls but better
alias grep='grep -iI -P --exclude-dir=".git" --color=auto ' # pretty grep
alias h='history' # shorter history
alias hdi='function hdi(){ howdoi $* -a -c -n 3 ;}; hdi' # shorter howdoi
alias how='function hdi(){ howdoi $* -a -c -n 3 ;}; hdi' # shorter howdoi alt
alias howdoi='function hdi(){ howdoi $* -a -c -n 3 ;}; hdi' # when idk how to do things
alias highlight='_highlight() { less -JMINsp$@ ;}; _highlight' # highlight all occurrences of a keyword in a file
alias hl='_hl() { less -JMINsp$@ ;}; _hl' # shorter highlight
alias hs='history | grep ' # search command history
alias jobs='jobs -l ' # list jobs
alias ln='ln -i ' # link file interactively
alias ls='ls -aFhv --color=auto --group-directories-first ' # better ls output
alias lsa='natls ' # like ls but better alt
alias mcd='_mcd() { mkdir -p "$1" && cd "$1" ;}; _mcd' # make a directory and cd to it
alias mkdir='mkdir -pv ' # make directory and parent directories, verbose
alias mp3='cvlc --no-video -q *.mp3 ' # play mp3 audio with vlc
alias mv="mv -i " # move file interactively
# alias open='_open() { echo $PWD/"$@" | tee /home/pi/Downloads/ColdStorage/filename.txt ;}; _open ' # echos a filepath
alias open='explorer.exe .' # open your WSL working directory in Windows File Explorer
alias path='echo $PATH | tr -s ":" "\n" ' # pretty print the path
alias ping='ping -c 5 ' # ping only 5 times then stop
alias please='sudo $(fc -ln -1)' # rerun last command with sudo, good manners
alias pls='sudo $(fc -ln -1)' # shorter please
alias plz='sudo $(fc -ln -1)' # shorter please alt
alias ports='sudo lsof -i -P -n | grep LISTEN ' # list ports in use
# alias poweroff='sudo shutdown -h now' # turn off device
# alias reboot='sudo reboot' # reboot
alias refresh="source ~/.bashrc" # reload .zshrc properly
alias reload="source ~/.bashrc" # reload .zshrc properly alt
alias rn='mv ' # rename/move a file shorter
alias rename='mv ' # rename/move a file
alias rm='rm -r -i' # remove file interactively
alias tarup='tar czvf ' # pack a .tar file
# alias twig='_twig() { "$@" | tee /home/pi/temp/twig.log ;}; _twig ' # log stdout of a command to file
alias untar='tar -zxvf ' # unpack a .tar file
alias update="sudo apt-get update && sudo apt-get upgrade" # shorter update
alias vlca='cvlc --no-video -q ' # play audio only
alias wget="wget -c " # continue, resume getting a partially-downloaded file
alias woman='eg ' # like man
alias x='chmod +x ' # make executable
alias yolo='rm -rf node_modules/ && rm package-lock.json && npm install' # reinstall a project’s dependencies
alias yta='_yta() { yt-dlp -f "ba" -x --audio-format mp3 "$1" -o "%(id)s.%(ext)s" ;}; _yta' # download audio only
alias ytdl="yt-dlp " # easier to remember command to download a video from YouTube
alias zshrc="nano ~/.zshrc" # edit zshrc

# suffix aliases
# alias -s {ahk,bat,bin,cs,css,csv,h,html,ini,js,json,log,lua,md,ps1,py,rc,reg,sh,ts,txt,xml,yml}=nano

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

# enable powerline
function _update_ps1() {
    PS1="$(oh-my-posh -config /home/pirate/.poshthemes/Plague.json -error $?)"
}

if [ "$TERM" != "linux" ] && [ -x "$(command -v oh-my-posh)" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
eval "$(thefuck --alias FUCK)"
eval "$(thefuck --alias data)"
eval "$(thefuck --alias Data)"
eval "$(thefuck --alias)"

export PATH=$PATH:$HOME/.cargo/bin
export DISPLAY=$(grep -m 1 nameserver /etc/resolv.conf | awk '{print $2}'):0.0
