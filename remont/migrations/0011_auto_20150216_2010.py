# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0010_auto_20150216_2004'),
    ]

    operations = [
        migrations.AlterField(
            model_name='organizationprofile',
            name='fax',
            field=models.CharField(default=b'', max_length=40, verbose_name='\u041d\u043e\u043c\u0435\u0440 \u0444\u0430\u043a\u0441\u0430', blank=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='organizationprofile',
            name='landline_phone',
            field=models.CharField(default=b'', max_length=30, verbose_name='\u0421\u0442\u0430\u0446\u0438\u043e\u043d\u0430\u0440\u043d\u044b\u0439 \u0442\u0435\u043b\u0435\u0444\u043e\u043d', blank=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='organizationprofile',
            name='mobile_phone',
            field=models.CharField(default=b'', max_length=30, verbose_name='\u041c\u043e\u0431\u0438\u043b\u044c\u043d\u044b\u0439 \u0442\u0435\u043b\u0435\u0444\u043e\u043d', blank=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='organizationprofile',
            name='mobile_phone2',
            field=models.CharField(default=b'', max_length=30, verbose_name='\u0412\u0442\u043e\u0440\u043e\u0439 \u043c\u043e\u0431\u0438\u043b\u044c\u043d\u044b\u0439 \u0442\u0435\u043b\u0435\u0444\u043e\u043d', blank=True),
            preserve_default=True,
        ),
    ]
