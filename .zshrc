#     "ZSHRC"
# BY ANGEL CAMPBELL
#     A NOVEL

# Brew completions
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# America's favorite paths time
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="minimal"
plugins=(git asdf aws direnv fzf npm brew)
source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='lvim'
else
  export EDITOR='vim'
fi

# Compilation flags for M1 stuff
# export ARCHFLAGS="-arch x86_64"

# aliases
[ -f ~/dotfiles/.bash_aliases ] && source ~/dotfiles/.bash_aliases

# Local (nonmanaged) zsh config ~/.zshrc.local
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# # Vim iced clojure support
# PATH=~/.config/nvim/plugged/vim-iced/bin:${PATH}
