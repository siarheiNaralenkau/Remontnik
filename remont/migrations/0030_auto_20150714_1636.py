# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0029_auto_20150714_1539'),
    ]

    operations = [
        migrations.AlterField(
            model_name='workphoto',
            name='album',
            field=models.ForeignKey(verbose_name='\u0410\u043b\u044c\u0431\u043e\u043c', to='remont.WorkPhotoAlbum', null=True),
        ),
    ]
