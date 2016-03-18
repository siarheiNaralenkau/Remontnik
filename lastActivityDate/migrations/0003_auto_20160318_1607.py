# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('lastActivityDate', '0002_auto_20150715_1611'),
    ]

    operations = [
        migrations.AlterField(
            model_name='useractivity',
            name='last_activity_ip',
            field=models.GenericIPAddressField(),
        ),
    ]
