#!/bin/bash

cd "$(dirname "$BASH_SOURCE")" \
    && source '../utils.sh'

main() {
  update

  print_in_green '\n  ---\n\n'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  install_package 'Musique' 'musique'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  install_package 'VLC' 'vlc'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  install_package 'Dropbox' 'nautilus-dropbox'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  install_package 'Ubuntu extras' 'ubuntu-restricted-extras'
  install_package 'lib av codec' 'libavcodec-extra'
  install_package 'lib av tools' 'libav-tools'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  if ! package_is_installed 'grive-tools'; then

    add_ppa 'thefanclub/grive-tools' \
      || print_error 'Google Drive (add PPA)'

    update &> /dev/null \
      || print_error 'Google Drive (resync package index files)' \

  fi

  install_package 'Google Drive' 'grive-tools'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  install_package 'GParted' 'gparted'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  install_package 'byzanz GIF Recorder' 'byzanz'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  install_package 'RAR' 'rar'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  if ! package_is_installed 'wine'; then

    add_ppa 'ubuntu-wine/ppa' \
      || print_error 'ubuntu-wine (add PPA)'

    update &> /dev/null \
      || print_error 'ubuntu-wine (resync package index files)' \

  fi

  install_package 'Wine' 'wine'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  if ! package_is_installed 'scudcloud'; then

    add_ppa 'rael-gc/scudcloud' \
      || print_error 'ScudCloud (add PPA)'

    update &> /dev/null \
      || print_error 'ScudCloud (resync package index files)' \

  fi

  install_package 'ScudCloud' 'scudcloud'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  if ! package_is_installed 'numix-gtk-theme'; then

    add_ppa 'numix/ppa' \
      || print_error 'numix-gtk-theme (add PPA)'

    update &> /dev/null \
      || print_error 'numix-gtk-theme (resync package index files)' \

  fi

  install_package 'numix-gtk-theme' 'numix-gtk-theme'
  install_package 'numix-icon-theme-circle' 'numix-icon-theme-circle'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_in_green '\n  ---\n\n'
  update
  upgrade

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_in_green '\n  ---\n\n'
  autoremove
}

main
