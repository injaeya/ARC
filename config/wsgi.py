"""
WSGI config for config project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/4.0/howto/deployment/wsgi/
"""

import os

from django.core.wsgi import get_wsgi_application

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'config.settings')

application = get_wsgi_application()

import builtins
import logging

def logging_print(*args, **kwargs):
    # 로깅 시스템이 초기화된 후에야 로그를 남길 수 있음
    logging.getLogger('django').info(' '.join(map(str, args)))

# print 함수를 로깅 함수를 대체
builtins.print = logging_print