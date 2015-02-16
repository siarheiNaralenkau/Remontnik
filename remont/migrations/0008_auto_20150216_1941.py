# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0007_auto_20150215_2024'),
    ]

    operations = [
        migrations.AddField(
            model_name='organizationprofile',
            name='work_cities',
            field=models.ManyToManyField(to='remont.City', verbose_name='\u041e\u0440\u0433\u0430\u043d\u0438\u0437\u0430\u0446\u0438\u044f \u0440\u0430\u0431\u043e\u0442\u0430\u0435\u0442 \u0432 \u0433\u043e\u0440\u043e\u0434\u0430\u0445'),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='organizationprofile',
            name='city',
            field=models.ForeignKey(related_name='reg_city', verbose_name='\u0413\u043e\u0440\u043e\u0434 \u0440\u0435\u0433\u0438\u0441\u0442\u0440\u0430\u0446\u0438\u0438', to='remont.City'),
            preserve_default=True,
        ),
    ]
