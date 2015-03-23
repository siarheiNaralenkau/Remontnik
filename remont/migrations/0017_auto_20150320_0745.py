# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import remont.models


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0016_remove_organizationprofile_type'),
    ]

    operations = [
        migrations.AlterField(
            model_name='organizationprofile',
            name='logo',
            field=models.ImageField(default=None, upload_to=remont.models.save_organization_logo, verbose_name='\u041b\u043e\u0433\u043e\u0442\u0438\u043f \u043e\u0440\u0433\u0430\u043d\u0438\u0437\u0430\u0446\u0438\u0438', blank=True),
            preserve_default=True,
        ),
    ]
