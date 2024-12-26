# Get back up the tree faster
alias ..=' cd ..'
alias ...=' cd ../..'
alias ....=' cd ../../..'
alias .....=' cd ../../../..'
alias ......=' cd ../../../../..'

# git stuff
alias gs='git status'
alias gl='git log --oneline --graph --decorate $argv'
alias gr='git rebase'
alias grc='git rebase --continue'
alias gri='git rebase -i'
alias ga='git add -p'
alias gc='git commit -m'
alias gca='git commit --amend --no-edit'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gf='git fetch --all --prune'
alias gpf='git push --force-with-lease'
alias grhh='git reset --hard HEAD'

# git submodule stuff
alias gsuu='git submodule update --remote --rebase'
alias gsup='git push --recurse-submodules=on-demand'

# No time to type those other letters
alias ec="emacsclient"

# easier xclipping
alias xclip="xclip -selection c"

# clear the screen
alias cl=clear

# list everything
alias la='ls -la'

# git grep
alias gag="git --no-pager grep --heading --break --line-number"

# fzf rg grep!
alias rf="rg . | fzf"

# give me my ip
alias haz="curl -4 icanhazip.com"

# copy local ip
alias myip="ifconfig | grep en0 -A 3 | grep \"inet \" | cut -d \" \" -f 2"

# Docker stuff
alias dc="docker compose"
alias dcl="docker container ls"
alias ktl="kubectl"
alias kgp="kubectl get pods"
alias kgs="kubectl get services"
alias kgd="kubectl get deployments"

# tmux in color mode with unicode
alias tmux="tmux -u2"

# iex with mix
alias ism="iex -S mix"

# open phoenix server
alias imps="iex -S mix phx.server"
# mix test
alias mixtest="mix test --listen-on-stdin --stale"
# debug jest test
alias jestdebug="node --nolazy --inspect-brk ./node_modules/jest-cli/bin/jest.js --runInBand --colors --verbose"
# activate python venv
alias vba=". ./venv/bin/activate"
# killall zsh
alias killzsh="ps ax -o pid,command,ppid | grep 'zsh' | awk '{print $1}' | xargs kill -9"
# Open localhost
olh () {
    open http://localhost:$1;
}
read_secret () {
    aws secretsmanager get-secret-value --secret-id $1 --query SecretString --output text
}
alias tf=terraform

alias livebook="docker run -p 8080:8080 -p 8081:8081 --pull always -u $(id -u):$(id -g) -v $(pwd):/data livebook/livebook"
