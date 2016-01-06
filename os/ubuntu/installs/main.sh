#!/bin/bash

cd "$(dirname "$BASH_SOURCE")" \
    && source '../../utils.sh' \
    && source 'utils.sh'

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    update
    upgrade

    print_in_green '\n  ---\n\n'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Tools for compiling/building software from source
    install_package 'Build Essential' 'build-essential'

    # GnuPG archive keys of the Debian archive
    install_package 'GnuPG archive keys' 'debian-archive-keyring'

    # Software which is not included by default
    # in Ubuntu due to legal or copyright reasons
    install_package 'Ubuntu Restricted Extras' 'ubuntu-restricted-extras'
    install_package 'lib av codec' 'libavcodec-extra'
    install_package 'lib av tools' 'libav-tools'

    print_in_green '\n  ---\n\n'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'Yakuake' 'yakuake'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! package_is_installed 'subl'; then

        add_ppa 'webupd8team/sublime-text-3' \
            || print_error 'Sublime-text (add PPA)'

        update &> /dev/null \
            || print_error 'Sublime-text (resync package index files)' \

    fi

    install_package 'Sublime-text' 'sublime-text-installer'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! package_is_installed 'atom'; then

        add_ppa 'webupd8team/atom' \
            || print_error 'Atom (add PPA)'

        update &> /dev/null \
            || print_error 'Atom (resync package index files)'

    fi

    install_package 'Atom' 'atom'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! package_is_installed 'google-chrome-unstable'; then

        add_key 'https://dl-ssl.google.com/linux/linux_signing_key.pub' \
            || print_error 'Chrome Canary (add key)'

        add_to_source_list 'http://dl.google.com/linux/deb/ stable main' 'google-chrome.list' \
            || print_error 'Chrome Canary (add to package resource list)'

        update &> /dev/null \
            || print_error 'Chrome Canary (resynch package index files)'

    fi

    install_package 'Chrome Canary' 'google-chrome-unstable'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'Chromium' 'chromium-browser'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'cURL' 'curl'

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

    install_package 'Git' 'git'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'GNOME Vim' 'vim-gnome'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'ImageMagick' 'imagemagick'
    install_package 'libmagickcore dev' 'libmagickcore-dev'
    install_package 'libmagickwand dev' 'libmagickwand-dev'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! package_is_installed 'opera'; then

        add_key 'http://deb.opera.com/archive.key' \
            || print_error 'Opera (add key)'

        add_to_source_list 'http://deb.opera.com/opera-stable/ stable non-free' 'opera.list' \
            || print_error 'Opera (add to package resource list)'

        update &> /dev/null \
            || print_error 'Opera (resync package index files)' \

    fi

    # Opera stable based on Blink is only
    # available for the 64-bit version of Ubuntu

    install_package 'Opera' 'opera-stable'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'tmux' 'tmux'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'VirtualBox' 'virtualbox'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'FileZilla' 'filezilla'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'VLC' 'vlc'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'Musique' 'musique'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'xclip' 'xclip'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'Zopfli' 'zopfli'


    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'GParted' 'gparted'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'byzanz GIF Recorder' 'byzanz'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'RAR' 'rar'
    install_package '7zip' 'p7zip'
    install_package '7zip-full' 'p7zip-full'
    install_package '7zip-rar' 'p7zip-rar'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'Apache2' 'apache2'
    install_package 'PHP5' 'php5'
    install_package 'ibapache2-mod-php5' 'libapache2-mod-php5'
    install_package 'php5-curl' 'php5-curl'
    install_package 'php5-mcrypt' 'php5-mcrypt'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # heroku
    wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    sudo a2enmod rewrite
    sudo service apache2 restart
    sudo chown -R $USER: /var/www/

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'PostgreSQL' 'postgresql'
    install_package 'postgresql-contrib' 'postgresql-contrib'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Composer
    curl -s https://getcomposer.org/installer | php
    sudo mv -f ./composer.phar /usr/local/bin/composer

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Virtualhost | https://github.com/RoverWire/virtualhost
    wget -qO virtualhost https://raw.githubusercontent.com/RoverWire/virtualhost/master/virtualhost.sh
    chmod +x virtualhost
    sudo mv -f /usr/local/bin/virtualhost

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
