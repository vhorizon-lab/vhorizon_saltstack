httpd:
  pkg.installed
  
httpd Service:
  service.running:
    - name: httpd
    - enable: True
    - require:
      - pkg: httpd
    - watch:
      - file: /etc/httpd/sites-available/{{ pillar['domain'] }}.conf
  
firewalld:
  pkg.installed

firewalld Service:
  service.running:
    - name: firewalld
    - enable: True
    - require:
      - pkg: firewalld

Turn off KeepAlive:
  file.replace:
    - name: /etc/httpd/conf/httpd.conf
    - pattern: 'KeepAlive On'
    - repl: 'KeepAlive Off'
    - show_changes: True
    - require:
      - pkg: httpd

Change DocumentRoot:
  file.replace:
    - name: /etc/httpd/conf/httpd.conf
    - pattern: 'DocumentRoot "/var/www/html"'
    - repl: 'DocumentRoot "/var/www/html/{{ pillar['domain'] }}/public_html"'
    - show_changes: True
    - require:
      - pkg: httpd

/etc/httpd/conf.d/tune_apache.conf:
  file.managed:
    - source: salt://files/tune_apache.conf
    - require:
      - pkg: httpd

/etc/httpd/conf.d/include_sites_enabled.conf:
  file.managed:
    - source: salt://files/include_sites_enabled.conf
    - require:
      - pkg: httpd

/etc/httpd/sites-available:
  file.directory

/etc/httpd/sites-enabled:
  file.directory

/var/www/html/{{ pillar['domain'] }}:
  file.directory

/var/www/html/{{ pillar['domain'] }}/backups:
  file.directory

/var/www/html/{{ pillar['domain'] }}/public_html:
  file.directory

/etc/httpd/sites-available/{{ pillar['domain'] }}.conf:
  apache.configfile:
    - config:
      - VirtualHost:
          this: '*:80'
          ServerName:
            - {{ pillar['domain'] }}
          ServerAlias:
            - www.{{ pillar['domain'] }}
          DocumentRoot: /var/www/html/{{ pillar['domain'] }}/public_html
  file.symlink:
    - target: /etc/httpd/sites-enabled/{{ pillar['domain'] }}.conf
    - force: True

/var/www/html/{{ pillar['domain'] }}/public_html/index.html:
  file.managed:
    - source: salt://{{ pillar['domain'] }}/index.html

Configure Firewall:
  firewalld.present:
    - name: public
    - ports:
      - 22/tcp
      - 80/tcp
      - 443/tcp