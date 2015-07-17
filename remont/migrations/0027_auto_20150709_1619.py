# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0026_article_job_spec'),
    ]

    operations = [
        migrations.AlterField(
            model_name='jobsuggestion',
            name='email',
            field=models.EmailField(default=b'', max_length=254, verbose_name='\u042d\u043b\u0435\u043a\u0442\u0440\u043e\u043d\u043d\u0430\u044f \u043f\u043e\u0447\u0442\u0430'),
        ),
        migrations.AlterField(
            model_name='organizationprofile',
            name='address',
            field=models.CharField(max_length=180, verbose_name='\u0410\u0434\u0440\u0435\u0441', blank=True),
        ),
    ]
