#!/bin/bash

cd "$(dirname "$BASH_SOURCE")" \
    && source '../utils.sh'

main() {
  update

  print_in_green '\n  ---\n\n'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  install_package 'Yakuake' 'yakuake' '-qqy'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  install_package 'Chromium' 'chromium-browser' '-qqy'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  if ! package_is_installed 'firefox-trunk'; then

    add_ppa 'ubuntu-mozilla-daily/ppa' \
      || print_error 'Firefox Nightly (add PPA)'

    update &> /dev/null \
      || print_error 'Firefox Nightly (resync package index files)' \

  fi

  install_package 'Firefox Nightly' 'firefox-trunk' '-qqy'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  install_package 'Flash' 'flashplugin-installer' '-qqy'
  install_package 'Flash-nonfree' 'pepperflashplugin-nonfree' '-qqy'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  install_package 'VirtualBox' 'virtualbox' '-qqy'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  install_package 'FileZilla' 'filezilla' '-qqy'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_in_green '\n  ---\n\n'
  update
  upgrade

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_in_green '\n  ---\n\n'
  autoremove
}

main
