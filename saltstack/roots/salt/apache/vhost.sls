{% macro vhost(name, enabled=true) -%}
{% if enabled %}
vhost-exist:
  file.exists:
    - user: root
    - group: root
    - name: /etc/apache2/sites-available/{{ name }}.conf

a2ensite {{ name }}:
  cmd.wait:
    - unless: test -L /etc/apache2/sites-enabled/{{ name }}.load
    - require:
      - pkg: apache2
      - file: vhost-exist
    - watch_in:
      - service: apache2
{% else %}
a2dissite {{ name }}:
  cmd.wait:
    - unless: test ! -L /etc/apache2/sites-enabled/{{ name }}.load
    - require:
      - pkg: apache2
    - watch_in:
      - service: apache2
{% endif %}
{%- endmacro %}
