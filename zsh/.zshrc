# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH:/home/catalin/Games/factorio/factorio/bin/x64:/home/catalin/Downloads/ghidra_11.3.1_PUBLIC:/snap/bin
export PATH=$HOME/.local/bin:$PATH
export PATH="$HOME/.npm-global/bin:$PATH"
# export PATH="$PATH:/usr/local/mcuxpressoide-25.6.136/ide/tools/bin"
export PATH="$PATH:/usr/local/mcuxpressoide-25.6.136/ide/plugins/com.nxp.mcuxpresso.tools.linux_25.6.0.202501151204/tools/bin"

export ZSH="$HOME/.oh-my-zsh"

export JAVA_HOME=/opt/jdk-21
export WIN="/mnt/36280B70280B2F05"
export GH="https://github.com"

ZSH_THEME="gallois"
# ZSH_THEME=random
# ZSH_THEME_RANDOM_CANDIDATES=( "bira" "agnoster" "robbyrussell" "fino-time" "gallois" "imajes" "itchy" "jnrowe" "minimal" "nicoulaj"  )

CASE_SENSITIVE="false"

# HYPHEN_INSENSITIVE="true"

# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder
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
#
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


prompt_context(){}

# STARTING POINT

# Source other zsh components
source $ZSH/oh-my-zsh.sh
source ~/.zsh/.zsh_functions
source ~/.zsh/.zsh_templates
source ~/.zsh/.zsh_aliases

# Start global env
source ~/.venv/dev/bin/activate
