# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0003_auto_20150215_1750'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='worktype',
            name='icon',
        ),
    ]
