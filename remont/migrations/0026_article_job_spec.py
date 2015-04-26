# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0025_auto_20150426_1723'),
    ]

    operations = [
        migrations.AddField(
            model_name='article',
            name='job_spec',
            field=models.ForeignKey(default=b'', verbose_name='\u0421\u043f\u0435\u0446\u0438\u0430\u043b\u0438\u0437\u0430\u0446\u0438\u044f', to='remont.WorkSpec', null=True),
            preserve_default=True,
        ),
    ]
