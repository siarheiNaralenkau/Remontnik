# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0037_currency_jobprice'),
    ]

    operations = [
        migrations.AddField(
            model_name='message',
            name='was_read',
            field=models.DateTimeField(default=None, null=True, verbose_name='\u0414\u0430\u0442\u0430 \u043f\u0440\u043e\u0447\u0442\u0435\u043d\u0438\u044f \u0441\u043e\u043e\u0431\u0449\u0435\u043d\u0438\u044f'),
        ),
        migrations.AddField(
            model_name='message',
            name='was_written',
            field=models.DateTimeField(auto_now_add=True, verbose_name='\u0414\u0430\u0442\u0430 \u0441\u043e\u0437\u0434\u0430\u043d\u0438\u044f \u0441\u043e\u043e\u0431\u0449\u0435\u043d\u0438\u044f', null=True),
        ),
    ]
