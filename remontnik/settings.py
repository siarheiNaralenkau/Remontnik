# -*- coding: utf-8 -*-

"""
Django settings for remontnik project.

For more information on this file, see
https://docs.djangoproject.com/en/1.6/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.6/ref/settings/
"""

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import os
import sys
import codecs
import locale
import socket
from django.conf import global_settings

BASE_DIR = os.path.dirname(os.path.dirname(__file__))

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.6/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '-b1o=+9@9#*zs$iq@b4%c^r1e#845!gcz_#@b4^*c#vyo8-fx7'

# SECURITY WARNING: don't run with debug turned on in production!
if socket.gethostname() == 'staatix.by':
  DEBUG = False
  TEMPLATE_DEBUG = False
else:
  DEBUG = True
  TEMPLATE_DEBUG = True

TEMPLATE_DIRS = [os.path.join(BASE_DIR, 'templates')]

platform = sys.platform

if sys.platform.startswith("win"):
  MEDIA_ROOT = "c://MyDevelopment//MediaStorage"
  STATIC_ROOT = "c://MyDevelopment//remontnik_static"
  LOG_FILE = "c://MyDevelopment//logs//remontnik.log"
elif sys.platform.startswith("linux"):
  MEDIA_ROOT = "/home/media/remontnik"
  STATIC_ROOT = "/var/www/app/remontnik_static"
  LOG_FILE = "/var/www/logs/remontnik.log"
else:
  MEDIA_ROOT = "/home/media"

MEDIA_URL = "/media/"

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.6/howto/static-files/
STATIC_URL = '/static/'

# Environment configuration(local or remote)
ENVIRONMENT = os.environ.get('REM_ENVIRONMENT', 'local')

# Logging configuration
LOGGING = {
  'version': 1,
  'disable_existing_loggers': False,
  'formatters': {
    'simple': {
      'format': '%(asctime)s %(levelname)s %(filename)s %(lineno)d : %(message)s'
    }
  },
  'handlers': {
    'file': {
      'level': 'INFO',
      'class': 'logging.FileHandler',
      'filename': LOG_FILE,
      'formatter': 'simple'
    },
  },
  'loggers': {
    'remont.default_logger': {
      'handlers': ['file'],
      'level': 'INFO',
      'propagate': True,
    },
  },
}

# Application definition

INSTALLED_APPS = (
  'django.contrib.admin',
  'django.contrib.auth',
  'django.contrib.contenttypes',
  'django.contrib.sessions',
  'django.contrib.messages',
  'django.contrib.staticfiles',
  'django.db.backends.mysql',
  'redactor',
  'django_mobile',
  'push_notifications',
  'remont',
  'lastActivityDate',
  'ckeditor',
  'ckeditor_uploader',
)

MIDDLEWARE_CLASSES = (
  'django.contrib.sessions.middleware.SessionMiddleware',
  'django.middleware.common.CommonMiddleware',
  'django.middleware.csrf.CsrfViewMiddleware',
  'django.contrib.auth.middleware.AuthenticationMiddleware',
  'django.contrib.messages.middleware.MessageMiddleware',
  'django.middleware.clickjacking.XFrameOptionsMiddleware',
  'django.middleware.locale.LocaleMiddleware',
  'django_mobile.middleware.MobileDetectionMiddleware',
  'django_mobile.middleware.SetFlavourMiddleware',
  'lastActivityDate.middleware.LastActivityMiddleware'
)

ROOT_URLCONF = 'remontnik.urls'

WSGI_APPLICATION = 'remontnik.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.6/ref/settings/#databases
DATABASES = {
  'default': {
    'NAME': 'remontnik',
    'ENGINE': 'django.db.backends.mysql',
    'USER': 'remontnik',
    'PASSWORD': 'remontnik',
  }
}

if ENVIRONMENT == 'remote':
  DATABASES['default']['HOST'] = '31.130.201.148'
  DATABASES['default']['USER'] = 'remontnik'
  DATABASES['default']['PASSWORD'] = 'remontnik'

# Internationalization
# https://docs.djangoproject.com/en/1.6/topics/i18n/

LANGUAGE_CODE = 'ru-RU'
USE_TZ = True
TIME_ZONE = 'Europe/Minsk'
USE_I18N = True
USE_L10N = True

try:
  HOST_NAME = socket.gethostbyname(socket.gethostname())
except:
  HOST_NAME = "localhost"

# Mailing settings
SMTP_SERVER = "smtp.gmail.com"
SMTP_PORT = 587
MAIL_FROM = "staatix.gomel@gmail.com"
MAIL_PASSWORD = "staatix2015"

OPTIONS = {
  'loaders': [
    'django_mobile.loader.Loader'
  ]
}

TEMPLATE_CONTEXT_PROCESSORS = global_settings.TEMPLATE_CONTEXT_PROCESSORS + (
    "django.core.context_processors.request",
    "django_mobile.context_processors.flavour"
)

PUSH_NOTIFICATIONS_SETTINGS = {
    "GCM_API_KEY": "<your api key>",
    "APNS_CERTIFICATE": "/path/to/your/certificate.pem",
}

# CKEditor Settings
CKEDITOR_UPLOAD_PATH = "ckeditor/"
CKEDITOR_IMAGE_BACKEND = "pillow"
CKEDITOR_CONFIGS = {
    'default': {
        'toolbar': 'full',
        'height': 600,
        'width': 800,
    },
}
