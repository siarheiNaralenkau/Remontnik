# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0013_workspec'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='workspec',
            options={'verbose_name': '\u0421\u043f\u0435\u0446\u0438\u0430\u043b\u0438\u0437\u0430\u0446\u0438\u044f', 'verbose_name_plural': '\u0421\u043f\u0435\u0446\u0438\u0430\u043b\u0438\u0437\u0430\u0446\u0438\u0438 \u0440\u0430\u0431\u043e\u0442'},
        ),
        migrations.AddField(
            model_name='organizationprofile',
            name='spec',
            field=models.ManyToManyField(default=None, to='remont.WorkSpec', verbose_name='\u0421\u043f\u0435\u0446\u0438\u0430\u043b\u0438\u0437\u0430\u0446\u0438\u044f'),
            preserve_default=True,
        ),
    ]
