export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"

cat << "EOF"
 ______   ______   __  __    
/\___  \ /\  ___\ /\ \_\ \   
\/_/  /__\ \___  \\ \  __ \  
  /\_____\\/\_____\\ \_\ \_\ 
  \/_____/ \/_____/ \/_/\/_/
EOF

# PROMPT="%F{159}%~%f %# "

alias ls="ls --color"

# Load zsh plugins
eval "$(sheldon source)"

autoload -Uz compinit && compinit
zstyle ':completion:*:default' list-colors di=34 ex=31 ln=35
zstyle ':completion:*:default' menu select=1

zstyle :prompt:pure:path color 159
zstyle :prompt:pure:execution_time color 247
zstyle :prompt:pure:git:stash show yes
PURE_PROMPT_SYMBOL='%F{215}%#%f'

ZSH_HIGHLIGHT_STYLES[cursor]='fg=#ffffff'

# Start tmux
if [[ -z $TMUX && $- == *l* ]]; then
    ID="$(tmux list-sessions)"
    if [[ -z "${ID}" ]]; then
        tmux new-session && exit
    fi
    create_new_session="Create New Session"
    ID="${ID}\n${create_new_session}:"
    ID="$(echo -e "${ID}" | fzf | cut -d: -f1)"
    if [[ "${ID}" = "${create_new_session}" ]]; then
        tmux new-session
    elif [[ -n "${ID}" ]]; then
        tmux attach-session -t "${ID}" && exit
    else
        :    # Start terminal normally
    fi
fi
