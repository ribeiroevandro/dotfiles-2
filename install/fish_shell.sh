#!/bin/bash

cd "$(dirname "$BASH_SOURCE")" \
    && source '../utils.sh'

main() {
  update
  upgrade

  print_in_green '\n  ---\n\n'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  install_package 'python-software-properties' 'python-software-properties'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  if ! package_is_installed 'fish'; then

    add_ppa 'fish-shell/nightly-master' \
      || print_error 'Fish Shell (add PPA)'

    update &> /dev/null \
      || print_error 'Fish Shell (resync package index files)' \

  fi

  install_package 'fish-shell' 'fish'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  #
  # integration rvm fish shell

  curl -L --create-dirs -o ~/.config/fish/functions/rvm.fish https://raw.github.com/lunks/fish-nuggets/master/functions/rvm.fish
  echo "rvm default" >> ~/.config/fish/config.fish

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_in_green '\n  ---\n\n'
  update
  upgrade

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_in_green '\n  ---\n\n'
  autoremove
}

main
