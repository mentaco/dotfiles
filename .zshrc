export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"

PROMPT="%c %# "

# 起動時にTmuxを開くための設定
if [[ ! -n $TMUX && $- == *l* ]]; then
    ID="`tmux list-sessions`"
    if [[ -z "${ID}" ]]; then
        tmux new-session && exit
    fi
    create_new_session="Create New Session"
    ID="${ID}\n${create_new_session}:"
    ID="`echo "${ID}" | fzf | cut -d: -f1`"
    if [[ "${ID}" = "${create_new_session}" ]]; then
        tmux new-session
    elif [[ -n "${ID}" ]]; then
        tmux attach-session -t "${ID}" && exit
    else
        :    # Start terminal normally
    fi
fi
