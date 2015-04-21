# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import ckeditor.fields


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0022_auto_20150405_1655'),
    ]

    operations = [
        migrations.CreateModel(
            name='Article',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=100, verbose_name='\u041d\u0430\u0437\u0432\u0430\u043d\u0438\u0435 \u0441\u0442\u0430\u0442\u044c\u0438')),
                ('content', ckeditor.fields.RichTextField()),
            ],
            options={
                'verbose_name': '\u0421\u0442\u0430\u0442\u044c\u044f \u043e \u0441\u0442\u0440\u043e\u0439\u043a\u0435 \u0438 \u0440\u0435\u043c\u043e\u043d\u0442\u0435',
                'verbose_name_plural': '\u0421\u0442\u0430\u0442\u044c\u0438 \u043e \u0441\u0442\u0440\u043e\u0439\u043a\u0435 \u0438 \u0440\u0435\u043c\u043e\u043d\u0442\u0435',
            },
            bases=(models.Model,),
        ),
    ]
