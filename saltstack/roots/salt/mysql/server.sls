include:
  - mysql
  - mysql.salt_local_module

mysql-server:
  pkg:
    - installed
  service:
    - name: mysql
    - running
  file.managed:
    - name: /etc/mysql/conf.d/server-unicode.cnf
    - source: salt://mysql/files/server-unicode.cnf
    - mode: 644
