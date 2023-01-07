# Powerlevel10k
source $HOME/.p10k/powerlevel10k.zsh-theme
[[ ! -f $HOME/.p10k.zsh ]] || source $HOME/.p10k.zsh

# Alias
alias ls="ls -F --color=auto"
alias ll="ls -Al"
alias d="docker"
alias dc="docker compose"

# Volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
