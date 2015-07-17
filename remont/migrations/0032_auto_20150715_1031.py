# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0031_auto_20150714_1658'),
    ]

    operations = [
        migrations.AlterField(
            model_name='organizationprofile',
            name='collegues',
            field=models.ManyToManyField(related_name='collegues_rel_+', verbose_name='\u041a\u043e\u043b\u043b\u0435\u0433\u0438', to='remont.OrganizationProfile', blank=True),
        ),
    ]
