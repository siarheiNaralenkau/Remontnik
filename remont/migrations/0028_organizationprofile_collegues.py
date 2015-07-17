# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0027_auto_20150709_1619'),
    ]

    operations = [
        migrations.AddField(
            model_name='organizationprofile',
            name='collegues',
            field=models.ManyToManyField(related_name='collegues_rel_+', null=True, verbose_name='\u041a\u043e\u043b\u043b\u0435\u0433\u0438', to='remont.OrganizationProfile'),
        ),
    ]
