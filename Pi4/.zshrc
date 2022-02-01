# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/pi/.oh-my-zsh"

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
plugins=(git autojump colored-man-pages colorize extract thefuck command-not-found zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
export LANG=en_US.UTF-8

export EDITOR='micro'
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/usr/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nano'
 else
   export EDITOR='mousepad'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# aliases
alias ..='cd ..' # lazy
alias ...='cd ../..' # very lazy
alias ....='cd ../../..' # plus ultra lazy
alias brootpi='br -d -s --show-root-fs -T' # navigate filesystem
alias exa='exa -al -F -h --group-directories-first --color-scale' # like ls but better
alias ls='ls -aFhv --color=auto --group-directories-first' # better ls output
alias update="sudo apt-get update && sudo apt-get upgrade" # shorter update
alias derp='tldr $(fc -ln -1)' # when you forget a command
alias cat='bat --theme="Visual Studio Dark+"' # pretty cat
alias how='howdoi' # shorter howdoi
alias hdi='howdoi' # shorter howdoi
alias howdoi='function hdi(){ howdoi $* -c -n 3; }; hdi' # when idk how to do things
alias pls='please' # shorter please
alias plz='please' # shorter please
alias please='sudo $(fc -ln -1)' # rerun last command with sudo, good manners
alias h='history' # shorter history
alias c='clear' # shorter clear
alias mkdir='mkdir -pv' # make directory and parent directories, verbose
alias cp="cp -i" # copy file interactively
alias mv="mv -i" # move file interactively
alias rm='rm -r -i' # remove file interactively
alias wget="wget -c" # continue, resume getting a partially-downloaded file
alias reboot='sudo reboot' # reboot
alias poweroff='sudo shutdown -h now' # turn off device
alias reload="source ~/.zshrc" # reload zshrc
alias zshrc="nano ~/.zshrc" # edit zshrc
alias bashrc="nano ~/.bashrc" # edit bashrc
alias ports='sudo lsof -i -P -n | grep LISTEN' # list ports in use
alias grep='grep -iI -P --exclude-dir=".git" --color=auto' # pretty grep
alias path='echo $PATH | tr -s ":" "\n"' # pretty print the path
alias 777='chmod -R 777' # set permissions to 777
alias x='chmod +x' # make executable
alias woman='eg' # like man
alias eg='eg --pager-cmd "less -sR"' # get examples for how a command is used

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# enable zsh syntax highlighting and autosuggestions
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source /home/pi/.config/broot/launcher/bash/br

. /usr/share/autojump/autojump.sh
. /home/pi/.local/share/lscolors.sh