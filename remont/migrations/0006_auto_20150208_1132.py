# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import remont.models


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0005_auto_20150207_1138'),
    ]

    operations = [
        migrations.AddField(
            model_name='workcategory',
            name='icon',
            field=models.ImageField(null=True, upload_to=remont.models.save_job_icon),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='worktype',
            name='icon',
            field=models.ImageField(null=True, upload_to=remont.models.save_job_icon),
            preserve_default=True,
        ),
    ]
