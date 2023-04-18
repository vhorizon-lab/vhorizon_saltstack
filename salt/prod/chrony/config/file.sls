# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_package_install = tplroot ~ '.package.install' %}
{%- from tplroot ~ "/map.jinja" import chrony with context %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch with context %}

include:
  - {{ sls_package_install }}

chrony-config-file-file-managed:
  file.managed:
    - name: {{ chrony.config }}
    - source: {{ files_switch(['chrony.conf.jinja'],
                              lookup='chrony-config-file-file-managed'
                 )
              }}
    - mode: 644
    - user: root
    - group: root
    - template: jinja
    - context:
        chrony: {{ chrony|json }}
    - require:
      - sls: {{ sls_package_install }}
