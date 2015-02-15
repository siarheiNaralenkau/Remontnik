# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0005_auto_20150215_1919'),
    ]

    operations = [
        migrations.AlterField(
            model_name='workcategory',
            name='icon',
            field=models.ImageField(default=None, upload_to=b'icons/', blank=True),
            preserve_default=True,
        ),
    ]
