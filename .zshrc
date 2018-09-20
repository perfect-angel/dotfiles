# Path to your oh-my-zsh installation.
export ZSH=/Users/colbydehart/.oh-my-zsh
# If you come from bash you might have to change your $PATH.
# Local executables
PATH="/usr/local/bin:$PATH"
#NPM executables
export PATH="/usr/local/opt/node@8/bin:$PATH"
#YARN executables
YARN_BIN_PATH=$(yarn global bin)
[ -d $YARN_BIN_PATH ] && export PATH="$PATH:$YARN_BIN_PATH"
#Rust
RUST_BIN_PATH="~/.cargo/bin"
[ -d $RUST_BIN_PATH ] && export PATH="$PATH:$RUST_BIN_PATH"
[ -f ~/.cargo/env ] && source ~/.cargo/env
#Python executables
PYTHON_BIN_PATH="/usr/local/opt/python/libexec/bin"
[ -d $PYTHON_BIN_PATH ] && export PATH="$PATH:$PYTHON_BIN_PATH"
#Android executables
export ANDROID_HOME="$HOME/Library/Android/sdk"
[ -d $ANDROID_HOME ] && export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"
#Haskell executables
[ -d "$HOME/Library/Haskell/bin" ] && export PATH="$HOME/Library/Haskell/bin:$PATH"
#Go executables
[ -d "$HOME/go/bin" ] && export PATH="$PATH:$HOME/go/bin"
#OCAML executables
. /Users/colbydehart/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
#Java executables
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-10.0.2.jdk"
export PATH="$PATH:$JAVA_HOME/Contents/Home/bin"
#Rbenv
eval "$(rbenv init -)"
# OCI (oracle drivers)
export OCI_DIR=$(brew --prefix)/lib

# Homebrew completions
BREW_COMPLETIONS=$(brew --prefix)
[ -f $BREW_COMPLETIONS/share/zsh-completions ] && fpath=($BREW_COMPLETIONS/share/zsh-completions $fpath)

# use nvr to prevent neovim nesting
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
  if [ -x "$(command -v nvr)" ]; then
    alias nvim=nvr
  else
    alias nvim=$(echo "No nesting!")
  fi
fi

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="eastwood"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker docker-compose heroku lein mix npm yarn zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
[ -f ~/.bash_aliases ] && source ~/.bash_aliases
alias zshconfig="nv ~/.zshrc"
alias ohmyzsh="nv ~/.oh-my-zsh"

# ---------------- Additional Config ----------------

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#
# respect gitignore
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# set erlang flags for iex history
export ERL_AFLAGS="-kernel shell_history enabled"

# NVIM COLORS
export NVIM_TUI_ENABLE_TRUE_COLOR=1 # Neovim colors
