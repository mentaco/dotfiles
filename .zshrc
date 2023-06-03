export PATH="$HOME/Library/Python/3.9/lib/python/site-packages:$HOME/Library/Python/3.9/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:/usr/local/bin:$PATH"

PROMPT="%c %# "

autoload -U zmv

export PATH="/usr/local/opt/openssl@3/bin:$PATH"

BREW_PREFIX=$(brew --prefix)
export LDFLAGS="-L${BREW_PREFIX}/opt/openssl/lib -L${BREW_PREFIX}/lib"
export CPPFLAGS="-I${BREW_PREFIX}/opt/openssl/include -I${BREW_PREFIX}/include"
export MYSQLCLIENT_LDFLAGS="${LDFLAGS} -L${BREW_PREFIX}/opt/zlib/lib"
export MYSQLCLIENT_CFLAGS="${CPPFLAGS} -I${BREW_PREFIX}/opt/zlib/include"
