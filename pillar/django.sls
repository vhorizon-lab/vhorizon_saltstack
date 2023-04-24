# -*- coding: utf-8 -*-
# vim: ft=yaml
---
django:
  lookup:
    pkg: python3
    pip: Django


# Django Application Deployment
django_apps:

  poll-single:
    venv: /var/www/poll
    proj: /var/www/poll/django-tutorial
    settings: poll.settings
    ROOT_URLCONF: poll.urls
    SECRET_KEY: 'gith!)on!_dq0=2l(otd67%#0urmrk6_d0!zu)i9fn=!8_g5(c'
    DATABASES:
      default:
        ENGINE: django.db.backends.mysql
        NAME: polldb
        USER: polluser
        PASSWORD: pollpass
        HOST: localhost
        PORT: 3306
    TEMPLATE_DIRS:
      - /var/www/poll/django-tutorial/templates
    STATICFILES_DIRS:
      - /var/www/poll/django-tutorial/static
    STATIC_ROOT: /var/www/poll/django-tutorial/staticroot

  poll-multi:
    minion_roles:
      database: django-db
      webhosts:
        - django-web1
        - django-web2
    venv: /var/www/poll
    proj: /var/www/poll/django-tutorial
    settings: poll.settings
    ROOT_URLCONF: poll.urls
    SECRET_KEY: 'gith!)on!_dq0=2l(otd67%#0urmrk6_d0!zu)i9fn=!8_g5(c'
    DATABASES:
      default:
        ENGINE: django.db.backends.mysql
        NAME: polldb
        USER: polluser
        PASSWORD: pollpass
        PORT: 3306
    TEMPLATE_DIRS:
      - /var/www/poll/django-tutorial/templates
    STATICFILES_DIRS:
      - /var/www/poll/django-tutorial/static
    STATIC_ROOT: /var/www/poll/django-tutorial/staticroot