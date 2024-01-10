export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Plugins stuff
plugins=(
  zsh-syntax-highlighting
  zsh-autosuggestions
  fzf
)

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source $ZSH/oh-my-zsh.sh

# Things to run
xset r rate 200 25
xset s off
xset -dpms

# Variables
export EDITOR="nvim"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.ghcup/bin:$PATH"

# Aliases
alias ta="tmux attach -t"
alias gs="git status -s"
alias gc="git commit"
