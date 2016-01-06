#!/bin/bash

cd "$(dirname "$BASH_SOURCE")" \
    && source '../utils.sh'

main() {
  update

  print_in_green '\n  ---\n\n'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Tools for compiling/building software from source
  install_package 'Build Essential' 'build-essential' '-qqy'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  install_package 'cURL' 'curl' '-qqy'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  install_package 'Git' 'git' '-qqy'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  curl -sL https://deb.nodesource.com/setup_0.12 | sudo -E bash -
  install_package 'NodeJS v0.12' 'nodejs' '-qqy'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # install npm

  for i in ${NODE_PACKAGES[@]}; do
    sudo npm install -g $i
  done

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  if ! package_is_installed 'subl'; then

    add_ppa 'webupd8team/sublime-text-3' \
      || print_error 'Sublime-text (add PPA)'

    update &> /dev/null \
      || print_error 'Sublime-text (resync package index files)' \

  fi

  install_package 'Sublime-text' 'sublime-text-installer' '-qqy'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  install_package 'GNOME Vim' 'vim-gnome' '-qqy'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  install_package 'ImageMagick' 'imagemagick' '-qqy'
  install_package 'libmagickcore dev' 'libmagickcore-dev' '-qqy'
  install_package 'libmagickwand dev' 'libmagickwand-dev' '-qqy'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # heroku
  wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh
  # heroku login

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Apache2, PHP5 e MySQL
  install_package 'Apache2' 'apache2' '-qqy'
  install_package 'PHP5' 'php5' '-qqy'
  install_package 'ibapache2-mod-php5' 'libapache2-mod-php5' '-qqy'
  install_package 'php5-mcrypt' 'php5-mcrypt' '-qqy'
  install_package 'php5-curl' 'php5-curl' '-qqy'
  install_package 'mysql-server' 'mysql-server' '-y'
  install_package 'php5-mysql' 'php5-mysql' '-qqy'

  sudo a2enmod rewrite
  sudo service apache2 restart
  sudo chown -R $USER: /var/www/

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # PostgreSQL
  install_package 'PostgreSQL' 'postgresql' '-qqy'
  install_package 'postgresql-contrib' 'postgresql-contrib' '-qqy'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # PHPMyAdmin
  install_package 'phpmyadmin' 'phpmyadmin' '-y'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Composer
  curl -s https://getcomposer.org/installer | php
  sudo mv -f ./composer.phar /usr/local/bin/composer

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Virtualhost | https://github.com/RoverWire/virtualhost
  wget -O virtualhost https://raw.githubusercontent.com/RoverWire/virtualhost/master/virtualhost.sh
  chmod +x virtualhost
  sudo mv -f /usr/local/bin/virtualhost

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_in_green '\n  ---\n\n'
  update
  upgrade

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_in_green '\n  ---\n\n'
  autoremove
}

main
