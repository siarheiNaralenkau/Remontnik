# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0023_article'),
    ]

    operations = [
        migrations.AddField(
            model_name='article',
            name='date_created',
            field=models.DateTimeField(auto_now_add=True, verbose_name='\u0414\u0430\u0442\u0430 \u0441\u043e\u0437\u0434\u0430\u043d\u0438\u044f \u0441\u0442\u0430\u0442\u044c\u0438', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='article',
            name='date_modified',
            field=models.DateTimeField(auto_now=True, verbose_name='\u0414\u0430\u0442\u0430 \u043f\u043e\u0441\u043b\u0435\u0434\u043d\u0435\u0433\u043e \u0438\u0437\u043c\u0435\u043d\u0435\u043d\u0438\u044f \u0441\u0442\u0430\u0442\u044c\u0438', null=True),
            preserve_default=True,
        ),
    ]
