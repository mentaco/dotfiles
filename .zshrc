cat << "EOF"
 ______   ______   __  __    
/\___  \ /\  ___\ /\ \_\ \   
\/_/  /__\ \___  \\ \  __ \  
  /\_____\\/\_____\\ \_\ \_\ 
  \/_____/ \/_____/ \/_/\/_/
EOF

typeset -U PATH
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
export PATH="$HOME/develop/flutter/bin:$PATH"

HISTSIZE=1000
SAVEHIST=1000
HISTFILE="$HOME/.zsh_history"

# PROMPT="%F{159}%~%f %# "

alias ls="ls --color"

disable r

# Load zsh plugins
eval "$(sheldon source)"

autoload -Uz compinit && compinit
zstyle ':completion:*:default' list-colors di=34 ex=31 ln=35
zstyle ':completion:*:default' menu select=1

PURE_PROMPT_SYMBOL='%#'
zstyle :prompt:pure:path color 159
zstyle :prompt:pure:execution_time color 247
zstyle :prompt:pure:git:stash show yes
zstyle :prompt:pure:prompt:success color 221
zstyle :prompt:pure:prompt:error color 009

# for dracula theme
# ZSH_HIGHLIGHT_STYLES[cursor]='fg=#ffffff'

case "$(uname)" in
    "Darwin") source $HOME/.mac_zshrc ;;
    "Linux" ) source $HOME/.linux_zshrc ;;
esac
