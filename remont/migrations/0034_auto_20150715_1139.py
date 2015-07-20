# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0033_auto_20150715_1138'),
    ]

    operations = [
        migrations.AlterField(
            model_name='organizationprofile',
            name='spec',
            field=models.ManyToManyField(default='\u0412\u0441\u0435', to='remont.WorkSpec', verbose_name='\u0421\u043f\u0435\u0446\u0438\u0430\u043b\u0438\u0437\u0430\u0446\u0438\u044f'),
        ),
    ]
