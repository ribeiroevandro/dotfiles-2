#!/bin/bash

cd "$(dirname "$BASH_SOURCE")" \
    && source '../utils.sh'

main() {
  update
  upgrade

  print_in_green '\n  ---\n\n'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  install_package 'Ruby' 'ruby' '-qqy'
  install_package 'Ruby dev' 'ruby-dev' '-qqy'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # install rvm
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  curl -sSL https://get.rvm.io | bash -s stable

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  #
  # rvm commands

  rvm requirements
  rvm install ruby
  rvm use ruby --default
  rvm rubygems current

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  #
  # install ruby gems

  for i in ${RUBYGEMS[@]}; do
    gem install $i
  done

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_in_green '\n  ---\n\n'
  update
  upgrade

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_in_green '\n  ---\n\n'
  autoremove
}

main
