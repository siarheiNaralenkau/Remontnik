# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('remont', '0034_auto_20150715_1139'),
    ]

    operations = [
        migrations.AddField(
            model_name='organizationprofile',
            name='account',
            field=models.ForeignKey(related_name='account', verbose_name='\u0410\u043a\u043a\u0430\u0443\u043d\u0442', blank=True, to=settings.AUTH_USER_MODEL, null=True),
        ),
    ]
