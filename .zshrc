# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH:/home/catalin/Games/factorio/factorio/bin/x64:/home/catalin/Downloads/ghidra_11.3.1_PUBLIC

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export JAVA_HOME="/usr/lib/jvm/java-21-openjdk-amd64"

export WIN="/media/catalin/win"

export GH="https://github.com"

ZSH_THEME="gallois"
# ZSH_THEME=random
# ZSH_THEME_RANDOM_CANDIDATES=( "bira" "agnoster" "robbyrussell" "fino-time" "gallois" "imajes" "itchy" "jnrowe" "minimal" "nicoulaj"  )

CASE_SENSITIVE="true"

# HYPHEN_INSENSITIVE="true"

# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 10

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"
# DISABLE_LS_COLORS="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

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
HIST_STAMPS="dd-mm-yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-history-substring-search
	zsh-z
	emotty
	emoji
	fzf
	colored-man-pages
)

source $ZSH/oh-my-zsh.sh
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

prompt_context(){}

# make terminal window fullscreen
# wmctrl -r :ACTIVE: -b toggle,maximized_vert,maximized_horz
# sleep 0.4
# date and time
# date | figlet -t
# echo "\n"
# fortune told by animal 
# fortune -l | cowsay -f `ls -1 /usr/share/cowsay/cows/ | sort -R | head -1` -n

# Other functions
source ~/.zsh_functions
source ~/.zsh_templates

# Programs
alias index="nohup vivaldi index.html &"
alias viv="nohup vivaldi &> /dev/null & disown"
alias arduino="~/Arduino/arduino-ide_2.3.3_Linux_64bit.AppImage"
alias nemo="nohup nemo . &"

# Configing
alias nvimrc="cd ~/.config/nvim && nvim"
alias vimrc="nvim ~/.vimrc"
alias zshrc="nvim ~/.zshrc"
alias zource="source ~/.zshrc"

# System
alias PO="poweroff"
alias RB="reboot"

# Messing around
alias lol="l | lolcat"
alias cmat="cmatrix -u 9| lolcat -p 100 -i"

# Rust
alias ccheck="cargo check"
alias crun="cargo run"
alias cbuild="cargo build"
alias cbuildr="cargo build --release"

# QOL
alias mna="man"
alias Man="man -a"
alias nivm="nvim"
alias ecr="echo $?"
alias cdop="cd $OLDPWD"
alias x="exit"
alias all="make all"
alias help="run-help"
alias clr="clear"
alias rmf="rm -rf"
alias mkdir="mkdir -p"
alias cdwin="/media/catalin/win/Users/catal"
alias c="clear"
alias r="fc -s"
alias sl="ls"
alias f="fzf --preview='cat {}'"

# POWERLEVEL9K_CONTEXT_TEMPLATE="%n"

[ -f "/home/catalin/.ghcup/env" ] && . "/home/catalin/.ghcup/env" # ghcup-env

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
