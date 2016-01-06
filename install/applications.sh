#!/bin/bash

cd "$(dirname "$BASH_SOURCE")" \
    && source '../utils.sh'

main() {
  update

  print_in_green '\n  ---\n\n'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  install_package 'Yakuake' 'yakuake'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  install_package 'Chromium' 'chromium-browser'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  if ! package_is_installed 'firefox-trunk'; then

    add_ppa 'ubuntu-mozilla-daily/ppa' \
      || print_error 'Firefox Nightly (add PPA)'

    update &> /dev/null \
      || print_error 'Firefox Nightly (resync package index files)' \

  fi

  install_package 'Firefox Nightly' 'firefox-trunk'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  install_package 'Flash' 'flashplugin-installer'
  install_package 'Flash-nonfree' 'pepperflashplugin-nonfree'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  install_package 'VirtualBox' 'virtualbox'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  install_package 'FileZilla' 'filezilla'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_in_green '\n  ---\n\n'
  update
  upgrade

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_in_green '\n  ---\n\n'
  autoremove
}

main
