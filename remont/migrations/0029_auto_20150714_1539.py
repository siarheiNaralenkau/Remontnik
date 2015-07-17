# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0028_organizationprofile_collegues'),
    ]

    operations = [
        migrations.AddField(
            model_name='workphoto',
            name='organization',
            field=models.ForeignKey(verbose_name='\u041e\u0440\u0433\u0430\u043d\u0438\u0437\u0430\u0446\u0438\u044f', to='remont.OrganizationProfile', null=True),
        ),
        migrations.AlterField(
            model_name='organizationprofile',
            name='collegues',
            field=models.ManyToManyField(related_name='collegues_rel_+', verbose_name='\u041a\u043e\u043b\u043b\u0435\u0433\u0438', to='remont.OrganizationProfile'),
        ),
    ]
