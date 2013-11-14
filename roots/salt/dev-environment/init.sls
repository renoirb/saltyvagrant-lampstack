/home/vagrant/.bash_aliases:
  file.managed:
    - user: vagrant
    - group: vagrant
    - source: salt://dev-environment/files/bash_aliases.txt

/home/vagrant/workspace:
  file.symlink:
    - target: /vagrant