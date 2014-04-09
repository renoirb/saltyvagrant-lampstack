include:
  - php.composer

php-basic:
  pkg:
    - installed
    - names:
      - php5
      - php5-common
      - php5-cli
      - php-pear
      - php-db
  file.managed:
    - name: /etc/php5/conf.d/unicode.ini
    - source: salt://php/files/unicode.ini
    - mode: 644
    - require:
      - pkg: php5