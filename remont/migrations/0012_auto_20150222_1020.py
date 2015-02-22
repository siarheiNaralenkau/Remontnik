# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0011_auto_20150216_2010'),
    ]

    operations = [
        migrations.AlterField(
            model_name='organizationprofile',
            name='city',
            field=models.ForeignKey(related_name='reg_city', verbose_name='\u0413\u043e\u0440\u043e\u0434 \u0440\u0435\u0433\u0438\u0441\u0442\u0440\u0430\u0446\u0438\u0438', to='remont.City', null=True),
            preserve_default=True,
        ),
    ]
