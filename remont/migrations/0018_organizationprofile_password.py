# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0017_auto_20150320_0745'),
    ]

    operations = [
        migrations.AddField(
            model_name='organizationprofile',
            name='password',
            field=models.CharField(default=None, max_length=120, null=True, verbose_name='\u041f\u0430\u0440\u043e\u043b\u044c'),
            preserve_default=True,
        ),
    ]
