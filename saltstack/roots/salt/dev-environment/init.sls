include:
  - apache

{% from "apache/vhost.sls" import vhost %}
{{ vhost('workspace') }}

/home/vagrant/.bash_aliases:
  file.managed:
    - user: vagrant
    - group: vagrant
    - source: salt://dev-environment/files/bash_aliases.txt

/home/vagrant/workspace:
  file.symlink:
    - target: /vagrant

/etc/apache2/sites-available/workspace.conf:
  file.managed:
    - user: root
    - group: root
    - source: salt://dev-environment/files/vhost.workspace.conf
    - require:
      - cmd: a2dissite 000-default
    - require_in:
      - cmd: vhost-exist
  cmd.wait:
    - name: a2dissite 000-default
    - unless: test -f /etc/apache2/sites-enabled/000-default