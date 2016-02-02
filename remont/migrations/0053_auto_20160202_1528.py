# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import ckeditor_uploader.fields


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0052_auto_20160201_1733'),
    ]

    operations = [
        migrations.AlterField(
            model_name='article',
            name='content',
            field=ckeditor_uploader.fields.RichTextUploadingField(),
        ),
    ]
