#!/bin/bash

# Load config
#
chmod +x ./config.sh
cd "$(dirname "$BASH_SOURCE")" \
    && source './config.sh'

main() {

  # Load utils
  #
  chmod +x ./utils.sh
  if [ -x './utils.sh' ]; then
    source './utils.sh' || exit 1
  fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  #
  # Ask sudo su

  ask_for_sudo

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  #
  # update
  # upgrade

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  #
  # Dev applications and command line tools

  ask_for_confirmation 'Install dev applications and command line tools?'
  print_in_green '\n  ---\n\n'

  if answer_is_yes; then

    chmod +x ./install/dev_applications.sh
    ./install/dev_applications.sh

    print_in_green '\n  ---\n\n'

    chmod +x ./install/fish_shell.sh
    ./install/fish_shell.sh

    print_in_green '\n  ---\n\n'

    chmod +x ./install/ruby.sh
    ./install/ruby.sh

  fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  #
  # Other applications

  ask_for_confirmation 'Install the other applications?'
  print_in_green '\n  ---\n\n'

  if answer_is_yes; then

    chmod +x ./install/applications.sh
    ./install/applications.sh

    print_in_green '\n  ---\n\n'

  fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  #
  # Extras applications

  ask_for_confirmation 'Install the extras applications?'
  print_in_green '\n  ---\n\n'

  if answer_is_yes; then

    chmod +x ./install/extras.sh
    ./install/extras.sh

    print_in_green '\n  ---\n\n'

  fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  #
  # copy dotfiles

  ask_for_confirmation 'Copy dotfiles?'
  print_in_green '\n  ---\n\n'

  if answer_is_yes; then

    for i in ${DOTFILES[@]}; do
      copy_dotfiles "./dotfiles/$i" "$HOME/"
    done

    print_in_green '\n  ---\n\n'

  fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  #
  # git ssh-keygen

  ask_for_confirmation 'Configure git ssh-keygen?'
  print_in_green '\n  ---\n\n'

  if answer_is_yes; then

    ssh-keygen -t rsa -b 4096 -C ${EMAIL}

    print_in_green '\n  ---\n\n'

  fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

}

main
