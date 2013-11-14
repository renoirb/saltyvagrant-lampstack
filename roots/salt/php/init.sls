php-basic:
  pkg:
    - latest
    - names:
      - php5-common
      - php5-cli
      - php-pear
      - php-db

get-composer:
  cmd.wait:
    - name: 'CURL=`which curl`; $CURL -sS https://getcomposer.org/installer | php'
    - unless: test -f /usr/local/bin/composer
    - cwd: /root/

install-composer:
  cmd.wait:
    - name: mv /root/composer.phar /usr/local/bin/composer
    - cwd: /root/
    - watch:
      - cmd: get-composer
