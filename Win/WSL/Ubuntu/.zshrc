# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/pirate/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages colorize extract command-not-found zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
export LANG=en_US.UTF-8

export EDITOR='micro'
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/usr/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

# Preferred for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export DISPLAY=:0.0
   export EDITOR='nano'
 else
   export EDITOR='code'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# aliases
alias ..='cd .. ' # lazy
alias ...='cd ../.. ' # very lazy
alias ....='cd ../../.. ' # plus ultra lazy
alias 777='chmod -R 777 ' # set permissions to 777
# alias audio='cvlc --no-video -q ' # play audio only
alias bashrc="nano ~/.bashrc " # edit bashrc
alias bat='batcat --theme="Visual Studio Dark+" ' # pretty bat
# alias brootpi='br -d -s --show-root-fs -T ' # navigate filesystem
alias c='clear ' # shorter clear
alias cat='batcat --theme="Visual Studio Dark+" ' # pretty cat
alias cd..='cd .. ' # fix typo
alias child='tldr ' # see man and woman
# alias close='_close() { echo $RANDOM | tee /home/pi/Downloads/ColdStorage/close.txt ;}; _close ' # close last opened
alias count='grep -ci' # displays the number of occurrences of keyword in a file
alias cp="cp -i " # copy file interactively
alias derp='tldr $(fc -ln -1)' # when you forget a command
alias df='df -h --total ' # human readable disk space usage
alias edit='nano ' # edit files
alias eg='eg --pager-cmd "less -sR" ' # get examples for how a command is used
alias exa='exa -al -F -h --group-directories-first --color-scale ' # like ls but better
alias grep='grep -iI -P --exclude-dir=".git" --color=auto ' # pretty grep
alias h='history' # shorter history
alias hdi='function hdi(){ howdoi $* -a -c -n 3 ;}; hdi' # shorter howdoi
alias how='function hdi(){ howdoi $* -a -c -n 3 ;}; hdi' # shorter howdoi alt
alias howdoi='function hdi(){ howdoi $* -a -c -n 3 ;}; hdi' # when idk how to do things
alias highlight='_highlight() { less -JMINsp$@ ;}; _highlight' # highlight all occurrences of a keyword in a file
alias hl='_hl() { less -JMINsp$@ ;}; _hl' # shorter highlight
alias hs='history | grep ' # search command history
alias ht='htop' # shorter htop
alias jobs='jobs -l ' # list jobs
alias ln='ln -i ' # link file interactively
alias ls='ls -aFhv --color=auto --group-directories-first ' # better ls output
alias lsa='exa -al -F -h --group-directories-first --color-scale ' # like ls but better alt
alias mcd='_mcd() { mkdir -p "$1" && cd "$1" ;}; _mcd' # make a directory and cd to it
alias mkdir='mkdir -pv ' # make directory and parent directories, verbose
# alias mp3='cvlc --no-video -q *.mp3 ' # play mp3 audio with vlc
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
alias refresh="exec zsh" # reload .zshrc properly
alias reload="exec zsh" # reload .zshrc properly alt
alias rn='mv ' # rename/move a file shorter
alias rename='mv ' # rename/move a file
alias rm='rm -r -i' # remove file interactively
alias tarup='tar czvf ' # pack a .tar file
# alias twig='_twig() { "$@" | tee /home/pi/temp/twig.log ;}; _twig ' # log stdout of a command to file
alias untar='tar -zxvf ' # unpack a .tar file
alias update="sudo apt-get update && sudo apt-get upgrade" # shorter update
# alias vlca='cvlc --no-video -q ' # play audio only
alias wget="wget -c " # continue, resume getting a partially-downloaded file
alias woman='eg ' # like man
alias x='chmod +x ' # make executable
alias yolo='rm -rf node_modules/ && rm package-lock.json && npm install' # reinstall a project’s dependencies
alias yta='_yta() { yt-dlp -f "ba" -x --audio-format mp3 "$1" -o "%(id)s.%(ext)s" ;}; _yta' # download audio only
alias ytdl="yt-dlp " # easier to remember command to download a video from YouTube
alias zshrc="nano ~/.zshrc" # edit zshrc

# suffix aliases
alias -s {ahk,bat,bin,cs,css,csv,h,html,ini,js,json,log,lua,md,ps1,py,rc,reg,sh,ts,txt,xml,yml}=nano

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# enable zsh syntax highlighting, autosuggestions and z
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/pirate/.oh-my-zsh/plugins/z/zsh-z.plugin.zsh
source /home/pirate/.zshrc.enterls
# source /home/pi/.config/broot/launcher/bash/br

# . /usr/share/autojump/autojump.sh
# . /home/pirate/.local/share/lscolors.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
