include:
  - php

ondrej-ppa:
  pkgrepo.managed:
    - humanname: Ondrej PHP5 PPA
    - name: deb http://ppa.launchpad.net/ondrej/php5/ubuntu precise main
    - dist: precise
    - file: /etc/apt/sources.list.d/ondrejphp5.list
    - keyid: E5267A6C
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: php5-latest

php5-latest:
  pkg:
    - latest
    - name: php5
    - refresh: True