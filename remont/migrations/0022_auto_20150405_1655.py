# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0021_workphoto'),
    ]

    operations = [
        migrations.AlterField(
            model_name='organizationprofile',
            name='login',
            field=models.CharField(default=None, max_length=100, null=True, verbose_name='\u041b\u043e\u0433\u0438\u043d \u043d\u0430 \u0441\u0430\u0439\u0442\u0435', blank=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='organizationprofile',
            name='password',
            field=models.CharField(default=None, max_length=120, null=True, verbose_name='\u041f\u0430\u0440\u043e\u043b\u044c', blank=True),
            preserve_default=True,
        ),
    ]
