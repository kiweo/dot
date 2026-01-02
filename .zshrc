# fzf
source <(fzf --zsh)

# fnm
eval "$(fnm env --use-on-cd --shell zsh)"

# editor
export EDITOR='nvim'
export VISUAL='nvim'

# looks
export CLICOLOR=1
PROMPT='%F{magenta}%~%f %(?.%F{yellow}.%F{red})❯%f '
