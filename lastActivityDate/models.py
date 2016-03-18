# -*- coding: utf-8 -*-

from django.db import models
from django.contrib.auth.models import User
from datetime import datetime

class UserActivity(models.Model):
    class Meta:
        verbose_name = u'Активность пользователя'
        verbose_name_plural = u'Активности пользозьвателя'

    last_activity_ip = models.GenericIPAddressField()
    last_activity_date = models.DateTimeField(default=None)
    user = models.OneToOneField(User, primary_key=True)

    def __unicode__(self):
        return u'Посешение пользоватем {0} сайта'.format(self.user.username)

