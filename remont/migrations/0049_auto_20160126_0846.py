# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import redactor.fields


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0048_auto_20160122_1516'),
    ]

    operations = [
        migrations.AlterField(
            model_name='article',
            name='content',
            field=redactor.fields.RedactorField(max_length=10000, verbose_name='\u0422\u0435\u043a\u0441\u0442 \u0441\u0442\u0430\u0442\u044c\u0438'),
        ),
    ]
