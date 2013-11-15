php-basic:
  pkg:
    - installed
    - names:
      - php5
      - php5-common
      - php5-cli
      - php5-curl
      - php-pear
      - php-db

curl:
  pkg:
    - installed

get-composer:
  cmd.run:
    - cwd: /root
    - name: 'CURL=`which curl`; $CURL -sS https://getcomposer.org/installer | php'
    - unless: test -f /usr/local/bin/composer
    - require:
      - pkg: php5-cli
      - pkg: php5-curl
      - pkg: curl

install-composer:
  cmd.wait:
    - name: mv /root/composer.phar /usr/local/bin/composer
    - cwd: /root
    - watch:
      - cmd: get-composer