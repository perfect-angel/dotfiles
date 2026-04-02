#     "ZSHRC"
# BY ANGEL CAMPBELL
#     A NOVEL
export PS1="%~ > "

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

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# aliases
[ -f ~/dotfiles/.bash_aliases ] && source ~/dotfiles/.bash_aliases

# Local (nonmanaged) zsh config ~/.zshrc.local
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

[ -f /opt/homebrew/opt/asdf/libexec/asdf.sh ] && . /opt/homebrew/opt/asdf/libexec/asdf.sh

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

# opencode
export PATH=$HOME/.opencode/bin:$PATH
export PATH="$HOME/.local/nvim/bin:$PATH"
