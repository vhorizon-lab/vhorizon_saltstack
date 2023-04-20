install_apache:
  pkg.installed:
    - name: apache2

  service.running:
    - name: apache2
    - enable: true

apache_configuration:
  file.managed:
    - name: /etc/apache2/apache2.conf
    - source: salt://apache/config/debian-apache2.conf
    - require:
      - pkg: apache2

tune_apache:
  file.managed:
    - name: /etc/apache2/conf-available/tune-apache2.conf
    - source: salt://apache/config/tune-apache2.conf
    - require:
      - pkg: apache2
 
restart_apache:
  module.wait:
  - name: service.restart
  - m_name: apache2
  - watch:
    - apache_configuration