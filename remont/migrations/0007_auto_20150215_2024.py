# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0006_auto_20150215_1922'),
    ]

    operations = [
        migrations.AddField(
            model_name='organizationprofile',
            name='mobile_phone2',
            field=models.CharField(max_length=30, verbose_name='\u0412\u0442\u043e\u0440\u043e\u0439 \u043c\u043e\u0431\u0438\u043b\u044c\u043d\u044b\u0439 \u0442\u0435\u043b\u0435\u0444\u043e\u043d', blank=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='organizationprofile',
            name='address',
            field=models.CharField(max_length=150, verbose_name='\u0410\u0434\u0440\u0435\u0441', blank=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='organizationprofile',
            name='logo',
            field=models.ImageField(default=None, upload_to=b'logos/', verbose_name='\u041b\u043e\u0433\u043e\u0442\u0438\u043f \u043e\u0440\u0433\u0430\u043d\u0438\u0437\u0430\u0446\u0438\u0438', blank=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='organizationprofile',
            name='mobile_phone',
            field=models.CharField(max_length=30, verbose_name='\u041c\u043e\u0431\u0438\u043b\u044c\u043d\u044b\u0439 \u0442\u0435\u043b\u0435\u0444\u043e\u043d'),
            preserve_default=True,
        ),
    ]
