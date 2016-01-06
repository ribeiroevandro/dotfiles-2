#!/bin/bash

cd "$(dirname "$BASH_SOURCE")" \
    && source '../utils.sh'

main() {
  update

  print_in_green '\n  ---\n\n'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  install_package 'Musique' 'musique' '-qqy'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  install_package 'VLC' 'vlc' '-qqy'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  install_package 'Dropbox' 'nautilus-dropbox' '-qqy'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  install_package 'Ubuntu extras' 'ubuntu-restricted-extras' '-qqy'
  install_package 'lib av codec' 'libavcodec-extra' '-qqy'
  install_package 'lib av tools' 'libav-tools' '-qqy'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  if ! package_is_installed 'grive-tools'; then

    add_ppa 'thefanclub/grive-tools' \
      || print_error 'Google Drive (add PPA)'

    update &> /dev/null \
      || print_error 'Google Drive (resync package index files)' \

  fi

  install_package 'Google Drive' 'grive-tools' '-qqy'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  install_package 'GParted' 'gparted' '-qqy'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  install_package 'byzanz GIF Recorder' 'byzanz' '-qqy'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  install_package 'RAR' 'rar' '-qqy'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  if ! package_is_installed 'wine'; then

    add_ppa 'ubuntu-wine/ppa' \
      || print_error 'ubuntu-wine (add PPA)'

    update &> /dev/null \
      || print_error 'ubuntu-wine (resync package index files)' \

  fi

  install_package 'Wine' 'wine' '-qqy'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  if ! package_is_installed 'scudcloud'; then

    add_ppa 'rael-gc/scudcloud' \
      || print_error 'ScudCloud (add PPA)'

    update &> /dev/null \
      || print_error 'ScudCloud (resync package index files)' \

  fi

  install_package 'ScudCloud' 'scudcloud' '-qqy'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  if ! package_is_installed 'numix-gtk-theme'; then

    add_ppa 'numix/ppa' \
      || print_error 'numix-gtk-theme (add PPA)'

    update &> /dev/null \
      || print_error 'numix-gtk-theme (resync package index files)' \

  fi

  install_package 'numix-gtk-theme' 'numix-gtk-theme' '-qqy'
  install_package 'numix-icon-theme-circle' 'numix-icon-theme-circle' '-qqy'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_in_green '\n  ---\n\n'
  update
  upgrade

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_in_green '\n  ---\n\n'
  autoremove
}

main
