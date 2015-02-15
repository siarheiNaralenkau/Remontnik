# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import remont.models


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0004_remove_worktype_icon'),
    ]

    operations = [
        migrations.AlterField(
            model_name='workcategory',
            name='icon',
            field=models.ImageField(default=None, null=True, upload_to=remont.models.save_job_icon),
            preserve_default=True,
        ),
    ]
