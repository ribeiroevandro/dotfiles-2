#!/bin/bash

answer_is_yes() {
  [[ "$REPLY" =~ ^[Yy]$ ]] \
    && return 0 \
    || return 1
}

ask() {
  print_question "$1"
  read
}

ask_for_confirmation() {
  print_question "$1 (y/n) "
  read -n 1
  printf "\n"
}

ask_for_sudo() {

  # Ask for the administrator password upfront
  sudo -v &> /dev/null

  # Update existing `sudo` time stamp until this script has finished
  # https://gist.github.com/cowboy/3118588
  while true; do
      sudo -n true
      sleep 60
      kill -0 "$$" || exit
  done &> /dev/null &

}

cmd_exists() {
  command -v "$1" &> /dev/null
  return $?
}

execute() {
  eval "$1" &> /dev/null
  print_result $? "${2:-$1}"
}

get_answer() {
  printf "$REPLY"
}

is_git_repository() {
  git rev-parse &> /dev/null
  return $?
}

mkd() {
  if [ -n "$1" ]; then
    if [ -e "$1" ]; then
      if [ ! -d "$1" ]; then
        print_error "$1 - a file with the same name already exists!"
      else
        print_success "$1"
      fi
    else
      execute "mkdir -p $1" "$1"
    fi
  fi
}

print_error() {
  print_in_red "  [✖] $1 $2\n"
}

print_in_green() {
  printf "\e[0;32m$1\e[0m"
}

print_in_purple() {
  printf "\e[0;35m$1\e[0m"
}

print_in_red() {
  printf "\e[0;31m$1\e[0m"
}

print_in_yellow() {
  printf "\e[0;33m$1\e[0m"
}

print_info() {
  print_in_purple "\n $1\n\n"
}

print_question() {
  print_in_yellow "  [?] $1"
}

print_result() {
  [ $1 -eq 0 ] \
    && print_success "$2" \
    || print_error "$2"

  return $1
}

print_success() {
  print_in_green "  [✔] $1\n"
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

add_key() {
  wget -qO - "$1" | sudo apt-key add - &> /dev/null
}

add_ppa() {
  sudo add-apt-repository -y ppa:"$1" &> /dev/null
}

add_to_source_list() {
  sudo sh -c "printf 'deb $1' >> '/etc/apt/sources.list.d/$2'"
}

autoremove() {

  # Remove packages that were automatically installed to satisfy
  # dependencies for other other packages and are no longer needed
  execute 'sudo apt-get autoremove -qqy' 'autoremove'
  execute 'sudo apt-get autoclean -qqy' 'autoclean'

}

install_package() {

  declare -r PACKAGE="$2"
  declare -r PACKAGE_READABLE_NAME="$1"
  declare -r PARAMS="$3"

  if ! package_is_installed "$PACKAGE"; then
    execute "sudo apt-get install --allow-unauthenticated $PARAMS $PACKAGE" "$PACKAGE_READABLE_NAME"
  else
    print_success "$PACKAGE_READABLE_NAME"
  fi

}

package_is_installed() {
  dpkg -s "$1" &> /dev/null
}

update() {

  # Resynchronize the package index files from their sources
  print_in_yellow 'apt-get update. Please wait.. \n\n'
  execute 'sudo apt-get update -qqy' 'update'
  printf '\n'

}

upgrade() {

  # Install the newest versions of all packages installed
  print_in_yellow 'apt-get upgrade. Please wait.. \n\n'
  execute 'sudo apt-get upgrade -qqy' 'upgrade'
  printf '\n'

}

copy_dotfiles() {

  print_info "copying $1 to $2"
  cp -Rfvl $1 $2

}
