include:
  - php

php-apache:
  pkg:
    - installed
    - names:
      - libapache2-mod-php5
    - require:
      - pkg: php5