# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0040_auto_20150716_1509'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='message',
            name='org',
        ),
    ]
