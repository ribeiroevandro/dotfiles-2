#!/bin/bash

cd "$(dirname "$BASH_SOURCE")" \
    && source '../utils.sh'

main() {
  update

  print_in_green '\n  ---\n\n'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Tools for compiling/building software from source
  install_package 'Build Essential' 'build-essential'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  install_package 'cURL' 'curl'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  install_package 'Git' 'git'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  curl -sL https://deb.nodesource.com/setup_0.12 | sudo -E bash -
  install_package 'NodeJS' 'nodejs'

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

  install_package 'Sublime-text' 'sublime-text-installer'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  install_package 'GNOME Vim' 'vim-gnome'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  install_package 'ImageMagick' 'imagemagick'
  install_package 'libmagickcore dev' 'libmagickcore-dev'
  install_package 'libmagickwand dev' 'libmagickwand-dev'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # heroku
  wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh
  # heroku login

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Apache2, PHP5 e MySQL
  install_package 'Apache2' 'apache2'
  install_package 'PHP5' 'php5'
  install_package 'ibapache2-mod-php5' 'libapache2-mod-php5'
  install_package 'php5-mcrypt' 'php5-mcrypt'
  install_package 'mysql-server' 'mysql-server'
  install_package 'php5-mysql' 'php5-mysql'

  sudo a2enmod rewrite
  sudo service apache2 restart
  sudo chown -R $USER: /var/www/

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # PostgreSQL
  install_package 'PostgreSQL' 'postgresql'
  install_package 'postgresql-contrib' 'postgresql-contrib'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # PHPMyAdmin
  install_package 'phpmyadmin' 'phpmyadmin'

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
