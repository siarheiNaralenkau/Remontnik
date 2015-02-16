# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0008_auto_20150216_1941'),
    ]

    operations = [
        migrations.AlterField(
            model_name='organizationprofile',
            name='mobile_phone',
            field=models.CharField(max_length=30, verbose_name='\u041c\u043e\u0431\u0438\u043b\u044c\u043d\u044b\u0439 \u0442\u0435\u043b\u0435\u0444\u043e\u043d', blank=True),
            preserve_default=True,
        ),
    ]
