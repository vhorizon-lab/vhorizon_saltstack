dev:
  '*':
    - match: compound:
    - chrony

  'G@os_family:Ubuntu':
    - match: compound
    - apache

  'G@os_family:CentOS':
    - match: compound:
    - nginx