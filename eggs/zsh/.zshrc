ZSH_THEME="jnrowe"

plugins=(
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-vi-mode
  fzf
)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $ZSH/oh-my-zsh.sh

alias ta="tmux attach -t"
alias tn="tmux new -s"
alias gs="git status -s"
alias gc="git commit"
alias gp="git push"
alias ga="git add"
alias z="zellij --session"
