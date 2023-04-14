install_nginx:
  pkg.installed:
    - name: nginx
  service.running:
    - name: nginx           
    - enable: true
	
add_epel:
  pkg.installed:
    - name: epel-release
	
nginx_configuration:
  file.managed:
    - name: /etc/nginx/nginx.conf
    - source: salt://nginx/config/nginx.conf
    - require:
      - pkg: nginx
	  
nginx_restart:
  module.wait:                  
  - name: service.restart
  - m_name: nginx
  - watch:
    - nginx_configuration