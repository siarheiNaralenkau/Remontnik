# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0038_auto_20150716_1144'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='message',
            name='msg_from',
        ),
    ]
