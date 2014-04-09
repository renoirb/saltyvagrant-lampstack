include:
  - mysql.server

python-mysqldb:
  pkg:
    - installed
    - require:
      - pkg: mysql-server

/etc/salt/minion.d/mysql.conf:
  file:
    - managed
    - contents: 'mysql.default_file: "/etc/mysql/debian.cnf"'
