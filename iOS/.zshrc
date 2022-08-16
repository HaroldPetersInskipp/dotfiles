# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
PATH=/usr/bin/node:$PATH
# Path to your oh-my-zsh installation.
export ZSH="/var/mobile/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

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

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
plugins=(git colored-man-pages colorize extract zsh-syntax-highlighting zsh-autosuggestions command-not-found)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

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
alias refresh="exec zsh" # reload .zshrc properly
alias reload="exec zsh" # reload .zshrc properly alt
alias rn='mv ' # rename/move a file shorter
alias rename='mv ' # rename/move a file
alias rm='rm -r -I' # remove file interactively
alias tarup='tar czvf ' # pack a .tar file
alias untar='tar -zxvf ' # unpack a .tar file
alias wget="wget -c " # continue, resume getting a partially-downloaded file
alias yolo='rm -rf node_modules/ && rm package-lock.json && npm install' # reinstall a project’s dependencies
alias zshrc="nano ~/.zshrc" # edit zshrc

# suffix aliases
alias -s {ahk,bat,bin,cs,css,csv,h,html,ini,js,json,log,lua,md,ps1,py,rc,reg,sh,ts,txt,xml,yml}=nano
