export PATH="/usr/local/bin:$HOME/Library/Python/3.9/lib/python/site-packages:$HOME/Library/Python/3.9/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:$PATH"

PROMPT="%c %# "

autoload -U zmv

export PATH="$PATH:/usr/local/opt/openssl@3/bin"

BREW_PREFIX=$(brew --prefix)
export LDFLAGS="-L${BREW_PREFIX}/opt/openssl/lib -L${BREW_PREFIX}/lib"
export CPPFLAGS="-I${BREW_PREFIX}/opt/openssl/include -I${BREW_PREFIX}/include"
export MYSQLCLIENT_LDFLAGS="${LDFLAGS} -L${BREW_PREFIX}/opt/zlib/lib"
export MYSQLCLIENT_CFLAGS="${CPPFLAGS} -I${BREW_PREFIX}/opt/zlib/include"

export PATH="$HOME/development/flutter/bin:$PATH"

export PATH="$HOME/.nodebrew/current/bin:$PATH"

# 起動時にTmuxを開くための設定
if [[ ! -n $TMUX && $- == *l* ]]; then
    ID="`tmux list-sessions`"
    if [[ -z "${ID}" ]]; then
        tmux new-session
    fi
    create_new_session="Create New Session"
    ID="${ID}\n${create_new_session}:"
    ID="`echo "${ID}" | fzf | cut -d: -f1`"
    if [[ "${ID}" = "${create_new_session}" ]]; then
        tmux new-session
    elif [[ -n "${ID}" ]]; then
        tmux attach-session -t "${ID}"
    else
        :    # Start terminal normally
    fi
fi
