# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0015_auto_20150310_0813'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='organizationprofile',
            name='type',
        ),
    ]
