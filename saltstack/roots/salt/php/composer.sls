include:
  - php

composer-php-requirements:
  pkg:
    - installed
    - names:
      - php5-curl
      - curl
    - require:
      - sls: php

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
    - unless: test -f /usr/local/bin/composer
    - watch:
      - cmd: get-composer