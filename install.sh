#!/bin/bash

set -ue

cd "$(dirname "$0")"
DOT_DIR="$(pwd)"
DOT_CONF_DIR="$(pwd)/.config"

for f in ${DOT_DIR}/.??*; do
    [[ "$(basename ${f})" == ".git" ]] && continue
    [[ "$(basename ${f})" == ".gitconfig" ]] && continue
    [[ "$(basename ${f})" == ".gitignore" ]] && continue
    [[ "$(basename ${f})" == ".DS_Store" ]] && continue
    [[ "$(basename ${f})" =~ .swp$ ]] && continue
    
    if [[ "$(basename ${f})" == ".config" ]]; then
        for f in ${DOT_CONF_DIR}/*; do
            command ln -snfv "${f}" $HOME/.config
        done
    else
        command ln -snfv "${f}" $HOME
    fi
done

