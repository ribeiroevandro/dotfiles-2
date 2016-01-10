#!/bin/bash

cd "$(dirname "$BASH_SOURCE")" \
    && source 'utils.sh'

declare -a DIRECTORIES=(
    "$WORKSPACE/clients"
    "$WORKSPACE/projects"
    "$WORKSPACE/contrib"
    "$WORKSPACE/playground"
    "$HOME/Downloads/torrents"
    "$HOME/Downloads/bin"
)

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    for i in ${DIRECTORIES[@]}; do
        mkd "$i"
    done

}

main
