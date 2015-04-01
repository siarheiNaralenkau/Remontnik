# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0018_organizationprofile_password'),
    ]

    operations = [
        migrations.AddField(
            model_name='organizationprofile',
            name='login',
            field=models.CharField(default=None, max_length=100, null=True, verbose_name='\u041b\u043e\u0433\u0438\u043d \u043d\u0430 \u0441\u0430\u0439\u0442\u0435'),
            preserve_default=True,
        ),
    ]
