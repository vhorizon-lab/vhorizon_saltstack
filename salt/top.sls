base:
  'G@os_family:Debian':
    - match: compound
    - apache-debian

  'minion2':
    - match: compound
    - apache-centos
    - firewall-cmd