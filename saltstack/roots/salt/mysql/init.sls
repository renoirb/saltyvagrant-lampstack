mysql-client-pkgs:
  pkg:
    - latest
    - names:
      - mysql-client
  file.managed:
    - name: /etc/mysql/conf.d/client-unicode.cnf
    - source: salt://mysql/files/client-unicode.cnf
    - mode: 644
