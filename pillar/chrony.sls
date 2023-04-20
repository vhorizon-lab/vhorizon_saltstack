# -*- coding: utf-8 -*-
# vim: ft=yaml
---
chrony:
  ntpservers:
    - name: '0.debian.pool.ntp.org'
      options: iburst
    - name: '1.centos.pool.ntp.org'
    - '2.arch.pool.ntp.org'
    - '3.gentoo.pool.ntp.org'
  pool:
    - name: '0.debian.pool.ntp.org'
      options: iburst
    - name: '1.centos.pool.ntp.org'
    - '2.arch.pool.ntp.org'
    - '3.gentoo.pool.ntp.org'
  allow:
    - '10/8'
    - '192.168/16'
    - '172.16/12'
  otherparams:
    - 'rtcsync'
    - 'makestep 10 3'
    - 'stratumweight 0'
    - 'bindcmdaddress 127.0.0.1'
    - 'bindcmdaddress ::1'
    - 'commandkey 1'
    - 'generatecommandkey'
    - 'noclientlog'
    - 'logchange 0.5'
  tofs:
    # # The files_switch key serves as a selector for alternative
    # # directories under the formula files directory. See TOFS pattern
    # # doc for more info.
    # # Note: Any value not evaluated by `config.get` will be used literally.
    # # This can be used to set custom paths, as many levels deep as required.
    # files_switch:
    #   - any/path/can/be/used/here
    #   - id
    #   - osfinger
    #   - os
    #   - os_family
    # # All aspects of path/file resolution are customisable using the options below.
    # # This is unnecessary in most cases; there are sensible defaults.
    # path_prefix: template_alt
    # dirs:
    #   files: files_alt
    #   default: default_alt
    source_files:
      chrony-config-file-file-managed:
        - 'chrony.conf'