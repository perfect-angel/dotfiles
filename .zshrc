#     "ZSHRC"
# BY ANGEL CAMPBELL
#     A NOVEL
export PS1="%~ > "
bindkey -e  # emacs mode (Ctrl-A/E work)                                                     

# America's favorite paths time
export PATH=$HOME/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
[ -f ~/.cargo/env ] && source ~/.cargo/env

# brew completions
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# neovim-remote for nested nvim
export NVIM_LISTEN_ADDRESS="/tmp/nvim-$USER"
export LOCAL_EDITOR="nvr --remote-silent -cc 'edit'"
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvr --remote-silent -cc edit'
fi
export VISUAL=$EDITOR

# aliases
[ -f ~/dotfiles/.bash_aliases ] && source ~/dotfiles/.bash_aliases

# Local (nonmanaged) zsh config ~/.zshrc.local
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# fzf
source <(fzf --zsh)

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# local neovim
export PATH="$HOME/.local/nvim/bin:$PATH"

# mise
[ -x ~/.local/bin/mise ] && eval "$(~/.local/bin/mise activate zsh)"
