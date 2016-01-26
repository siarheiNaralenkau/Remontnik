# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0050_page'),
    ]

    operations = [
        migrations.DeleteModel(
            name='Page',
        ),
    ]
