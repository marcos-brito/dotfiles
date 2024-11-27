export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-vi-mode
  fzf
)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source $ZSH/oh-my-zsh.sh

export EDITOR="nvim"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.ghcup/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

alias ta="tmux attach -t"
alias tn="tmux new -s"
alias gs="git status -s"
alias gc="git commit"
alias gp="git push"
alias ga="git add"


# opam stuff
[[ ! -r '/home/marcos-brito/.opam/opam-init/init.zsh' ]] || source '/home/marcos-brito/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null

# bun completions
[ -s "/home/marcos-brito/.bun/_bun" ] && source "/home/marcos-brito/.bun/_bun"
. "/home/marcos-brito/.deno/env"
